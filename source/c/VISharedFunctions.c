/* Copyright 2014 Joe Friedrichsen
 * Licensed under the Apache License, Version 2.0
 */

#include "VISharedFunctions.h"

const int32_t StatusSuccess = 0;
const int32_t UsageError = -1;

const int32_t BufferStringLength = 127;
const int32_t LVRunTimeLoadErrorMessageLength = 1023;

char* viCreateStringWithLength(int32_t length)
{
   int stringLengthWithTerminator = length + 1;
   char* newString = malloc(stringLengthWithTerminator);
   viResetStringWithLength(newString, length);
   return newString;
}

void viResetStringWithLength(char* string, int32_t length)
{
   const char null = 0;
   int stringLengthWithTerminator = length + 1;
   memset(string, null, stringLengthWithTerminator);
}

char* viDuplicateString(const char* oldString)
{
   int32_t stringLength = strlen(oldString);
   char* newString = viCreateStringWithLength(stringLength);
   strncpy(newString, oldString, stringLength);
   return newString;
}

LStrHandle viCreateStringHandleWithLength(int32_t length)
{
   LStrPtr stringPointer = (LStrPtr)malloc(sizeof(int32) + length * sizeof(uChar));
   stringPointer->cnt = length;
   viResetStringWithLength(stringPointer->str, length - 1); // reset speaks in terms of C strings (0x0 term), not LV/Pascal strings

   LStrHandle stringHandle = (LStrHandle)malloc(sizeof(LStrHandle));
   *stringHandle = stringPointer;
   return stringHandle;
}

void viPrintStringHandle(LStrHandle stringHandle, const char* name, int32_t includeDebugInformation)
{
   int32_t stringLength = LHStrLen(stringHandle);

   if (includeDebugInformation)
   {
      printf("(%s) = 0x%p\n", name, stringHandle);
      printf("(*%s) = 0x%p\n", name, LHStrPtr(stringHandle));
      printf("(*%s).cnt = %i\n", name, stringLength);
      printf("(*%s).str = 0x%p\n", name, LHStrBuf(stringHandle));
   }

   char* stringBuffer = viCreateStringWithLength(stringLength);
   viCopyLVString(stringBuffer, stringLength, stringHandle);
   printf("%s\n", stringBuffer);
   free(stringBuffer);
   stringBuffer = NULL;
}

void viCopyLVString(char* destination, int32_t destinationLength, LStrHandle source)
{
   int32_t maximumLength = destinationLength < LHStrLen(source) ? destinationLength : LHStrLen(source);
   viResetStringWithLength(destination, destinationLength);
   strncpy(destination, LHStrBuf(source), maximumLength);
}

int32_t viLoadLabVIEWRunTime()
{
   char* errorMessage = viCreateStringWithLength(LVRunTimeLoadErrorMessageLength);
   int32_t loadErrorCode = LVDLLStatus(errorMessage, LVRunTimeLoadErrorMessageLength, NULL /* module doesn't matter */);

   if (loadErrorCode == StatusSuccess)
   {
      // NOOP -- the run time loaded correctly
   }
   else
   {
      viPrintError(errorMessage);
   }

   free(errorMessage);
   return loadErrorCode;
}

void viPrintError(const char* format, ...)
{
   va_list ap;
   va_start(ap, format);
   vfprintf(stderr, format, ap);
   va_end(ap);
}
