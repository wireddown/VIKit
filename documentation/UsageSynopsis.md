Requirements
=============

* Windows XP or later
* LabVIEW 2013 Run-Time Engine

Tools for VIs
-------------

* **VIQueryBuildSpecs** -- command line tool that prints all of the build specifications in a LabVIEW project.

>```
$ VIQueryBuildSpecs.exe 'C:\path\to\VIKit.lvproj'
My Computer     VIKit.dll       DLL
```

* **VIQueryVersion** -- command line tool that prints what LabVIEW version a LabVIEW file was written in.

>```
$ VIQueryVersion.exe 'C:\path\to\VIQueryVersion.vi'
13.0
$ VIQueryVersion.exe 'C:\path\to\VIKit.lvproj'
13.0
```
