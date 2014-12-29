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
.
.
.
```
* Install the tools:
```
$ make install DEST='/path/to/your/bin'
```
* Enable VI auto-snippets-on-git-commit for a repository ([like VIKit has](http://github.com/wireddown/VIKit/tree/master/source/lv-snippet)):
```
$ cd /path/to/your/git/repository
$ VIPreCommitSnipDiagram.sh install "relative/path/to/labview/source" "relative/path/to/snippet/mirror"
$ VISnipDiagram.sh --vi 'C:\full\path\to\labview\source' --png 'C:\full\path\to\snippet\mirror' --lv-version 2014
$ git add 'C:\full\path\to\snippet\mirror'
$ git commit -m "Adding VI snippet mirror"
```

