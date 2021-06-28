[![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/eap-sql2xlsx)
[![GitHub all releases](https://img.shields.io/badge/Available%20on-GitHub-black)](https://github.com/SergeyMi37/eap-sql2xlsx)

[![](https://img.shields.io/badge/InterSystems-IRIS-blue.svg)](https://www.intersystems.com/products/intersystems-iris/)
[![license](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

ZAPM is a shell - extends the ZPM shell and adds any other commands.
Python openxl

A simple example of using the python openxl library to export a request to an excel file

# Requirements
`IRIS for Windows (x86-64) 2021.1.0PYTHON (Build 237U) Wed Jun 2 2021 10:38:20 EDT`

# Setup
1. Clone repo
```
cd /tmp
git clone https://github.com/SergeyMi37/eap-sql2xlsx.git
cd eap-sql2xlsx
```

2. Load source code into IRIS.
```
zn "USER"
do $system.OBJ.LoadDir("/tmp/eap-sql2xlsx/src", "ck")
```

or
```
zn "USER"
zpm "install eap-sql2xlsx"
```

# Let's prepare a table for testing
```
USER>zpm "install csvgen"
USER>d ##class(community.csvgen).GenerateFromURL("https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv",",","Data.Titanic")

Class name: Data.Titanic
Header: PassengerId INTEGER,Survived INTEGER,Pclass INTEGER,Name VARCHAR(250),Sex VARCHAR(250),Age INTEGER,SibSp INTEGER,Parch INTEGER,Ticket VARCHAR(250),Fare MONEY,Cabin VARCHAR(250),Embarked VARCHAR(250)
Records imported: 891
```
# Test
```
do ##class(dc.msw.py.xlsx).sql2xlsx("select * FROM Data.Titanic","","/tmp/titanic.xlsx")
 
Save into /tmp/titanic.xlsx rows: 891
```
