VIKit
=====

Tools for VIs
-------------

* **VIQueryVersion** -- command line tool that prints what LabVIEW version a VI was written in

>```
$ VIQueryVersion.exe "C:\\path\\to\\your\\VI.vi"
14.0
```

Getting Started
---------------

* These instructions assume you have MinGW installed.
* Unpack the distribution:
```
$ tar -xzf VIKit.tar.gz
```
* Build the tools:
```
$ cd VIKit
$ make
gcc -std=c99 VIQueryVersion.c -o VIQueryVersion.exe -lVIKit -LVIKit
```
