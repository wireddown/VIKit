# VIBuildProject.sh
# Copyright 2014 Joe Friedrichsen
# Licensed under the Apache License, Version 2.0

function PrintUsage
{
   echo >&2 "Usage:"
   echo >&2 "  VIBuildProject.sh --project 'c:\path\to\project.lvproj' [--target 'SpecName@TargetName'] [--lv-version VersionYear]"
   echo >&2
   echo >&2 "To find buildable targets for the --target option, use \"VIQueryBuildSpecs c:\path\to\project.lvproj\""
   echo >&2
}

function ValidateTargetWithSpec
{
   local ProjectPath
   local ProjectTarget
   local ProjectSpec

   local VIQueryBuildSpecs
   local BuildSpecifications
   local SpecsForTarget
   local SpecNameFound

   ProjectPath="$1"
   ProjectTarget="$2"
   ProjectSpec="$3"

   VIQueryBuildSpecs=VIQueryBuildSpecs
   BuildSpecifications=$(${VIQueryBuildSpecs} "${ProjectPath}")
   SpecsForTarget=$(echo "${BuildSpecifications}" | gawk -F '\t' -v target="${ProjectTarget}" 'target == $1 {print $2}')
   SpecNameFound=$(echo "${SpecsForTarget}" | grep "^${ProjectSpec}$" || :)

   if test -z "${SpecNameFound}"; then
      ExitWithError "Could not find spec named \"${ProjectSpec}\" for target \"${ProjectTarget}\" in project \"${ProjectPath}\"."
   fi
}

while test $# -gt 1; do
   key="$1"
   shift

   case $key in
      --project)
         ProjectPath=$(ToWindowsPath "$1")
         shift
         ;;
      --target)
         SpecificationName="$1"
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
      --builder)
         BuilderPath=$(ToWindowsPath "$1")
         shift
         ;;
      *)
         # Unknown option
         ;;
   esac
done

if test -z "${ProjectPath}"; then
   PrintUsage
   ExitWithError "argument '--project c:\path\to\project.lvproj' is required."
fi

if test -z "${RunnerPath}"; then
   RunnerPath=$(FindRunnableVI VHRunVI.vi)
fi

if test -z "${BuilderPath}"; then
   BuilderPath=$(FindRunnableVI VIBuildProject.vi)
fi

if test -n "${LabviewVersion}"; then
   LabviewPath=$(FindLabviewExecutable "${LabviewVersion}")
else
   LabviewPath=$(DetectLabviewVersion "${ProjectPath}")
fi

if test -n "${SpecificationName}"; then
   SpecName=$(echo ${SpecificationName} | gawk -F '@' '{print $1}')
   BuildTarget=$(echo ${SpecificationName} | gawk -F '@' '{print $2}')
   $(ValidateTargetWithSpec "${ProjectPath}" "${BuildTarget}" "${SpecName}")
   CallLabview "${LabviewPath}" "${RunnerPath}" "${BuilderPath}" "${ProjectPath}" "${BuildTarget}" "${SpecName}"
else
   CallLabview "${LabviewPath}" "${RunnerPath}" "${BuilderPath}" "${ProjectPath}"
fi
