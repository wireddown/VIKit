/* Copyright 2014 Joe Friedrichsen
 * Licensed under the Apache License, Version 2.0
 */

#include "VISharedFunctions.h"

const int32_t VIPathParameterPosition = 1;
const int32_t VersionStringLength = 31;

int32_t main(int32_t argc, const char* argv[])
{
   if (argc < 2)
   {
      viPrintError("Usage: VIQueryVersion 'path/to/vi'");
      return UsageError;
   }
   else
   {
      int32_t errorCode = viLoadLabVIEWRunTime();
      if (errorCode == StatusSuccess)
      {
         char* viPathString = viDuplicateString(argv[VIPathParameterPosition]);
         char* viVersionString = viCreateStringWithLength(VersionStringLength);

         errorCode = VIQueryVersion(viPathString, viVersionString, VersionStringLength);

         if (errorCode == StatusSuccess)
         {
            printf(viVersionString);
         }
         else
         {
            viPrintError("Could not find file, or file was not a LabVIEW file.");
         }

         free(viPathString);
         viPathString = NULL;

         free(viVersionString);
         viVersionString = NULL;

         return errorCode;
      }
   }
}
