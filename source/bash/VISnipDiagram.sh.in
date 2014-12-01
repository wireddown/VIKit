# VISnipDiagram.sh
# Copyright 2014 Joe Friedrichsen
# Licensed under the Apache License, Version 2.0

function PrintUsage
{
   echo >&2 "Usage:"
   echo >&2 "  VISnipDiagram.sh --vi 'c:\path\to\your.vi' --png 'c:\path\to\an\image.png' [--lv-version VersionYear]"
   echo >&2
   echo >&2 "where 'your.vi' must exist, and 'image.png' will be created or overwritten."
}

while test $# -gt 1; do
   key="$1"
   shift

   case $key in
      --vi)
         ViPath=$(ToWindowsPath "$1")
         shift
         ;;
      --png)
         PngPath=$(ToWindowsPath "$1")
         shift
         ;;
      --lv-version)
         LabviewVersion="$1"
         shift
         ;;
      --runner)
         RunnerPath=$(ToWindowsPath "$1")
         shift
         ;;
      --snipper)
         SnipperPath=$(ToWindowsPath "$1")
         shift
         ;;
      *)
         # Unknown option
         ;;
   esac
done

if test -z "${ViPath}"; then
   PrintUsage
   ExitWithError "argument '--vi c:\path\to\your.vi' is required."
fi

if test -z "${PngPath}"; then
   PrintUsage
   ExitWithError "argument '--png c:\path\to\an\image.png' is required."
fi

if ! test -f "${ViPath}"; then
   ExitWithError "Cannot find VI '${ViPath}'"
fi

if test -z "${RunnerPath}"; then
   RunnerPath=$(FindRunnableVI VHRunVI.vi)
fi

if test -z "${SnipperPath}"; then
   SnipperPath=$(FindRunnableVI VISnipDiagram.vi)
fi

if test -n "${LabviewVersion}"; then
   LabviewPath=$(FindLabviewExecutable "${LabviewVersion}")
else
   LabviewPath=$(DetectLabviewVersion "${ViPath}")
fi

CallLabview "${LabviewPath}" "${RunnerPath}" "${SnipperPath}" "${ViPath}" "${PngPath}"
