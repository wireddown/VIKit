/* Copyright 2014 Joe Friedrichsen
 * Licensed under the Apache License, Version 2.0
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "VIKit/VIKit.h"

const int32_t StatusSuccess = 0;
const int32_t UsageError = -1;

const int32_t VIPathParameterPosition = 1;
const int32_t BufferStringLength = 127;
const int32_t LVRunTimeLoadErrorMessageLength = 1023;
const int32_t VIBuildSpecArrayLength = 1;

LStrHandle createStringHandleWithLength(int32_t length);
void printStringHandle(LStrHandle stringHandle, const char* name, int32_t includeDebugInformation);
char* createStringWithLength(int32_t length);
char* duplicateString(const char* oldString);
void copyLVString(char* destination, LStrHandle source);
int32_t loadLabVIEWRunTime();
void printUsage();
void printBuildSpecs(VIProject_VPTargetBuildSpecsArray targets);

int32_t main(int32_t argc, const char* argv[])
{
   if (argc < 2)
   {
      printUsage();
      return UsageError;
   }
   else
   {
      int32_t errorCode = loadLabVIEWRunTime();
      if (errorCode == StatusSuccess)
      {
         char* viPathString = duplicateString(argv[VIPathParameterPosition]);
         VIProject_VPTargetBuildSpecsArray targets = AllocateVIProject_VPTargetBuildSpecsArray(VIBuildSpecArrayLength);

         errorCode = VIQueryBuildSpecs(viPathString, &targets);
         if (errorCode == StatusSuccess)
         {
            printBuildSpecs(targets);
         }
         else
         {
            printf("Error analyzing '%s':\n", viPathString);
            printf("  Could not find file, or file was not a project file (error code %i).", errorCode);
         }

         free(viPathString);
         viPathString = NULL;

         DeAllocateVIProject_VPTargetBuildSpecsArray(&targets);
         targets = NULL;

         return errorCode;
      }
   }
}

LStrHandle createStringHandleWithLength(int32_t length)
{
   LStrPtr stringPointer = (LStrPtr)malloc(sizeof(int32) + length * sizeof(uChar));
   stringPointer->cnt = length;
   memset(stringPointer->str, 0, length);

   LStrHandle stringHandle = (LStrHandle)malloc(sizeof(LStrHandle));
   *stringHandle = stringPointer;
   return stringHandle;
}

void printStringHandle(LStrHandle stringHandle, const char* name, int32_t includeDebugInformation)
{
   int32_t stringLength = LHStrLen(stringHandle);

   if (includeDebugInformation)
   {
      printf("(%s) = 0x%p\n", name, stringHandle);
      printf("(*%s) = 0x%p\n", name, LHStrPtr(stringHandle));
      printf("(*%s).cnt = %i\n", name, stringLength);
      printf("(*%s).str = 0x%p\n", name, LHStrBuf(stringHandle));
   }

   char* stringBuffer = createStringWithLength(stringLength);
   copyLVString(stringBuffer, stringHandle);
   printf("%s\n", stringBuffer);
   free(stringBuffer);
   stringBuffer = NULL;
}

char* createStringWithLength(int32_t length)
{
   const char null = 0;
   int stringLengthWithTerminator = length + 1;
   char* newString = malloc(stringLengthWithTerminator);
   memset(newString, null, stringLengthWithTerminator);
   return newString;
}

char* duplicateString(const char* oldString)
{
   int32_t stringLength = strlen(oldString);
   char* newString = createStringWithLength(stringLength);
   strncpy(newString, oldString, stringLength);
   return newString;
}

void copyLVString(char* destination, LStrHandle source)
{
   strncpy(destination, LHStrBuf(source), LHStrLen(source));
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
      printf(errorMessage);
   }

   free(errorMessage);
   return loadErrorCode;
}

void printUsage()
{
   printf("Usage: VIQueryBuildSpecs 'path/to/project.lvproj'\n");
   printf("\n");
   printf("Output format is a line of tab-separated fields, one line for each specification:\n");
   printf("\n");
   printf("My Computer\tDAQ Monitor\tEXE\n");
   printf("\n");
   printf("Where the fields are\n");
   printf("  1 LabVIEW target\n");
   printf("  2 Build spec name\n");
   printf("  3 Build spec type\n");
}

void printBuildSpecs(VIProject_VPTargetBuildSpecsArray targets)
{
   char* targetNameBuffer = createStringWithLength(BufferStringLength);
   char* buildSpecNameBuffer = createStringWithLength(BufferStringLength);
   char* buildSpecTypeBuffer = createStringWithLength(BufferStringLength);

   int targetCount = (*targets)->dimSize;
   for (int targetIndex = 0; targetIndex < targetCount; ++targetIndex)
   {
      VIProject_VPTargetBuildSpecs buildSpecsForTarget = (*targets)->BuildSpecification[targetIndex];
      VIProject_VPBuildSpecInformationArray buildSpecs = buildSpecsForTarget.BuildSpecifications;
      copyLVString(targetNameBuffer, buildSpecsForTarget.TargetName);

      int buildSpecCount = (*buildSpecs)->dimSize;
      for (int buildSpecIndex = 0; buildSpecIndex < buildSpecCount; ++buildSpecIndex)
      {
         VIProject_VPBuildSpecInformation buildSpec = (*buildSpecs)->BuildSpecificationInformation[buildSpecIndex];
         copyLVString(buildSpecNameBuffer, buildSpec.Name);
         copyLVString(buildSpecTypeBuffer, buildSpec.Type);

         printf("%s\t%s\t%s\n", targetNameBuffer, buildSpecNameBuffer, buildSpecTypeBuffer);
      }
   }

   free(targetNameBuffer);
   targetNameBuffer = NULL;

   free(buildSpecNameBuffer);
   buildSpecNameBuffer = NULL;

   free(buildSpecTypeBuffer);
   buildSpecTypeBuffer = NULL;
}
