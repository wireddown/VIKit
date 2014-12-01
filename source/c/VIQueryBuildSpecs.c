/* Copyright 2014 Joe Friedrichsen
 * Licensed under the Apache License, Version 2.0
 */

#include "VISharedFunctions.h"

const int32_t VIPathParameterPosition = 1;
const int32_t VIBuildSpecArrayLength = 1;

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
      int32_t errorCode = viLoadLabVIEWRunTime();
      if (errorCode == StatusSuccess)
      {
         char* viPathString = viDuplicateString(argv[VIPathParameterPosition]);
         VIProject_VPTargetBuildSpecsArray targets = AllocateVIProject_VPTargetBuildSpecsArray(VIBuildSpecArrayLength);

         errorCode = VIQueryBuildSpecs(viPathString, &targets);
         if (errorCode == StatusSuccess)
         {
            printBuildSpecs(targets);
         }
         else
         {
            viPrintError("Error analyzing '%s':\n", viPathString);
            viPrintError("  Could not find file, or file was not a project file (error code %i).", errorCode);
         }

         free(viPathString);
         viPathString = NULL;

         DeAllocateVIProject_VPTargetBuildSpecsArray(&targets);
         targets = NULL;

         return errorCode;
      }
   }
}

void printUsage()
{
   viPrintError("Usage: VIQueryBuildSpecs 'path/to/project.lvproj'\n");
   viPrintError("\n");
   viPrintError("Output format is a line of tab-separated fields, one line for each specification:\n");
   viPrintError("\n");
   viPrintError("My Computer\tDAQ Monitor\tEXE\n");
   viPrintError("\n");
   viPrintError("Where the fields are\n");
   viPrintError("  1 LabVIEW target\n");
   viPrintError("  2 Build spec name\n");
   viPrintError("  3 Build spec type\n");
}

void printBuildSpecs(VIProject_VPTargetBuildSpecsArray targets)
{
   char* targetNameBuffer = viCreateStringWithLength(BufferStringLength);
   char* buildSpecNameBuffer = viCreateStringWithLength(BufferStringLength);
   char* buildSpecTypeBuffer = viCreateStringWithLength(BufferStringLength);

   int targetCount = (*targets)->dimSize;
   for (int targetIndex = 0; targetIndex < targetCount; ++targetIndex)
   {
      VIProject_VPTargetBuildSpecs buildSpecsForTarget = (*targets)->BuildSpecification[targetIndex];
      VIProject_VPBuildSpecInformationArray buildSpecs = buildSpecsForTarget.BuildSpecifications;
      viCopyLVString(targetNameBuffer, BufferStringLength, buildSpecsForTarget.TargetName);

      int buildSpecCount = (*buildSpecs)->dimSize;
      for (int buildSpecIndex = 0; buildSpecIndex < buildSpecCount; ++buildSpecIndex)
      {
         VIProject_VPBuildSpecInformation buildSpec = (*buildSpecs)->BuildSpecificationInformation[buildSpecIndex];
         viCopyLVString(buildSpecNameBuffer, BufferStringLength, buildSpec.Name);
         viCopyLVString(buildSpecTypeBuffer, BufferStringLength, buildSpec.Type);

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
