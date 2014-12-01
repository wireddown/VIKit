/* Copyright 2014 Joe Friedrichsen
 * Licensed under the Apache License, Version 2.0
 */

#ifndef ___VISharedFunctions_h___
#define ___VISharedFunctions_h___

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifndef ___VIKit_h___
   #define ___VIKit_h___
   #include "VIKit/VIKit.h"
#endif  // ___VIKit_h___

const int32_t StatusSuccess;
const int32_t UsageError;

const int32_t BufferStringLength;
const int32_t LVRunTimeLoadErrorMessageLength;

char* viCreateStringWithLength(int32_t length);

void viResetStringWithLength(char* string, int32_t length);

char* viDuplicateString(const char* oldString);

LStrHandle viCreateStringHandleWithLength(int32_t length);

void viPrintStringHandle(LStrHandle stringHandle, const char* name, int32_t includeDebugInformation);

void viCopyLVString(char* destination, int32_t destinationLength, LStrHandle source);

int32_t viLoadLabVIEWRunTime();

void viPrintError(const char* format, ...)
     __attribute__ ((format (printf, 1, 2)));

#endif // ___VISharedFunctions_h___
