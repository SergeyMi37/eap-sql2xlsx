[![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/eap-sql2xlsx)
[![GitHub all releases](https://img.shields.io/badge/Available%20on-GitHub-black)](https://github.com/SergeyMi37/eap-sql2xlsx)

[![](https://img.shields.io/badge/InterSystems-IRIS-blue.svg)](https://www.intersystems.com/products/intersystems-iris/)
[![license](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Demo](https://img.shields.io/badge/Demo%20on-GCR-black)](https://sql2xlsx.demo.community.intersystems.com/fileserver/files)

## What's new

Added use of the fileserver project to demonstrate how to get a generated xlsx file

## eap-sql2xlsx

A simple example of using the python openxl library to export a request to an excel file

## Requirements
`IRIS for UNIX (Ubuntu Server LTS for x86-64 Containers) 2021.2 (Build 649U) Thu Jan 20 2022 08:53:15 EST`

## Installation with ZPM

If ZPM the current instance is not installed, then in one line you can install the latest version of ZPM.
```
zn "%SYS" d ##class(Security.SSLConfigs).Create("z") s r=##class(%Net.HttpRequest).%New(),r.Server="pm.community.intersystems.com",r.SSLConfiguration="z" d r.Get("/packages/zpm/latest/installer"),$system.OBJ.LoadStream(r.HttpResponse.Data,"c")
```
If ZPM is installed, then ZPM can be set with the command
```
zpm:USER>install eap-sql2xlsx
```
## Installation with Docker

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation 
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/SergeyMi37/eap-sql2xlsx
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
...
$ docker-compose exec iris iris session iris
```


## The following commands will be executed during the installation process

```
USER>zpm "install csvgen"
...
USER>do ##class(community.csvgen).GenerateFromURL("https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv",",","Data.Titanic")

Class name: Data.Titanic
Header: PassengerId INTEGER,Survived INTEGER,Pclass INTEGER,Name VARCHAR(250),Sex VARCHAR(250),Age INTEGER,SibSp INTEGER,Parch INTEGER,Ticket VARCHAR(250),Fare MONEY,Cabin VARCHAR(250),Embarked VARCHAR(250)
Records imported: 891

USER>do ##class(dc.msw.py.xlsx).sql2xlsx("select * FROM Data.Titanic","","/usr/irissys/mgr/Temp/titanic.xlsx")

Save into /usr/irissys/mgr/Temp/titanic.xlsx rows: 891

USER>zpm "install fileserver"
...
USER>do ##class(Fileserver.File).AddFile("/usr/irissys/mgr/Temp/titanic.xlsx")

```

## The generated file can be obtained from the interface via the link

http://localhost:52663/fileserver/files

## Container for this project deployed to the cloud for demonstration

[![Demo](https://img.shields.io/badge/Demo%20on-GCR-black)](https://sql2xlsx.demo.community.intersystems.com/fileserver/files)