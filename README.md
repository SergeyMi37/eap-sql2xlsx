Python openxl

A simple example of using the python openxl library to export a request to an excel file

# Requirements
`IRIS for Windows (x86-64) 2021.1.0PYTHON (Build 237U) Wed Jun 2 2021 10:38:20 EDT`

# Setup
1. Clone repo
```
cd /tmp
git clone https://github.com/SergeyMi37/eap-sql2xlsx.git
cd iris-eap-pypoc
```

2. Load source code into IRIS.
```
zn "USER"
do $system.OBJ.LoadDir("/tmp/eap-sql2xlsx/src", "ck")
do ##class(dc.msw.py.xlsx).sql2xlsx("select * from apptools_core.Log order by id desc","n,,,,,n,,,,d",/tmp/eap-sql2xlsx/test.xlsx","Title")
```

