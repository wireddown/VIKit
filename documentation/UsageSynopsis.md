Tools for VIs and LabVIEW Development
-------------------------------------

### Tool list

* **VIBuildProject** -- builds a LabVIEW project.
* **VIPreCommitSnipDiagram** -- mirrors LabVIEW source as VI snippets as part of `git commit`. 
* **VIQueryBuildSpecs** -- prints all of the build specifications in a LabVIEW project.
* **VIQueryVersion** -- prints what LabVIEW version a LabVIEW file was written in.
* **VISnipDiagram** -- creates VI snippets from a VI or folder.

### Usage

* **VIBuildProject** -- builds a LabVIEW project.

>```
$ VIBuildProject.sh --project 'C:\path\to\VIKit.lvproj'
>
$ VIBuildProject.sh --project 'C:\path\to\VIKit.lvproj' --target 'VIKit.dll@My Computer'
>
$ VIBuildProject.sh --project 'C:\path\to\VIKit.lvproj' --lv-version 2014
```

* **VIPreCommitSnipDiagram** -- mirrors LabVIEW source as VI snippets as part of `git commit`. 

>```
$ VIPreCommitSnipDiagram.sh install "relative/path/to/labview/source" "relative/path/to/snippet/mirror"
```

* **VIQueryBuildSpecs** -- prints all of the build specifications in a LabVIEW project.

>```
$ VIQueryBuildSpecs.exe 'C:\path\to\VIKit.lvproj'
My Computer     VIKit.dll       DLL
```

* **VIQueryVersion** -- prints what LabVIEW version a LabVIEW file was written in.

>```
$ VIQueryVersion.exe 'C:\path\to\VIQueryVersion.vi'
13.0
>
$ VIQueryVersion.exe 'C:\path\to\VIKit.lvproj'
13.0
```

* **VISnipDiagram** -- creates VI snippets from a VI or folder.

>```
$ VISnipDiagram.sh --vi 'C:\path\to\VIQueryVersion.vi' --png 'C:\path\to\VIQueryVersion.png'
>
$ VISnipDiagram.sh --vi 'C:\path\to\vi\source' --png 'C:\path\to\snippet\mirror' --lv-version 2014
```

