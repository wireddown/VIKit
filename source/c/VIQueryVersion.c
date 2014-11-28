/* Copyright 2014 Joe Friedrichsen
 * Licensed under the Apache License, Version 2.0
 */

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "VIKit/VIKit.h"

const int32_t StatusSuccess = 0;
const int32_t UsageError = -1;

const int32_t VIPathParameterPosition = 1;
const int32_t LVRunTimeLoadErrorMessageLength = 1023;
const int32_t VersionStringLength = 31;

void printError(const char* format, ...)
     __attribute__ ((format (printf, 1, 2)));

void printError(const char* format, ...)
{
   va_list ap;
   va_start(ap, format);
   vfprintf(stderr, format, ap);
   va_end(ap);
}

char* createStringWithLength(int32_t length)
{
   return malloc(length + 1);
}

char* duplicateString(const char* oldString)
{
   int32_t stringLengh = strlen(oldString);
   char* newString = createStringWithLength(stringLengh);
   strcpy(newString, oldString);
   return newString;
}

int32_t loadLabVIEWRunTime()
{
   char* errorMessage = createStringWithLength(LVRunTimeLoadErrorMessageLength);
   int32_t loadErrorCode = LVDLLStatus(errorMessage, LVRunTimeLoadErrorMessageLength, NULL /* module doesn't matter */);

   if (loadErrorCode == StatusSuccess)
   {
      // NOOP -- the run time loaded correctly
   }
   else
   {
      printError(errorMessage);
   }

   free(errorMessage);
   return loadErrorCode;
}

int32_t main(int32_t argc, const char* argv[])
{
   if (argc < 2)
   {
      printError("Usage: VIQueryVersion 'path/to/vi'");
      return UsageError;
   }
   else
   {
      int32_t errorCode = loadLabVIEWRunTime();
      if (errorCode == StatusSuccess)
      {
         char* viPathString = duplicateString(argv[VIPathParameterPosition]);
         char* viVersionString = createStringWithLength(VersionStringLength);

         errorCode = VIQueryVersion(viPathString, viVersionString, VersionStringLength);

         if (errorCode == StatusSuccess)
         {
            printf(viVersionString);
         }
         else
         {
            printError("Could not find file, or file was not a LabVIEW file.");
         }

         free(viPathString);
         viPathString = NULL;

         free(viVersionString);
         viVersionString = NULL;

         return errorCode;
      }
   }
}
