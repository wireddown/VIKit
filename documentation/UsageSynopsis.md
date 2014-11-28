Tools for VIs
-------------

* **VIBuildProject** -- command line tool that builds a LabVIEW project.

>```
$ VIBuildProject.sh --project 'C:\path\to\VIKit.lvproj'
>
$ VIBuildProject.sh --project 'C:\path\to\VIKit.lvproj' --target 'VIKit.dll@My Computer'
>
$ VIBuildProject.sh --project 'C:\path\to\VIKit.lvproj' --lv-version 2014
```

* **VIQueryBuildSpecs** -- command line tool that prints all of the build specifications in a LabVIEW project.

>```
$ VIQueryBuildSpecs.exe 'C:\path\to\VIKit.lvproj'
My Computer     VIKit.dll       DLL
```

* **VIQueryVersion** -- command line tool that prints what LabVIEW version a LabVIEW file was written in.

>```
$ VIQueryVersion.exe 'C:\path\to\VIQueryVersion.vi'
13.0
>
$ VIQueryVersion.exe 'C:\path\to\VIKit.lvproj'
13.0
```

