#!../../bin/linux-x86/rfMonitor

## You may have to change rfMonitor to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/rfMonitor.dbd"
rfMonitor_registerRecordDeviceDriver pdbbase

## Load record instances
## dbLoadTemplate "db/userHost.substitutions"
## dbLoadRecords "db/dbSubExample.db", "user=longHost"
dbLoadRecords "db/rfMonitor1.db"
dbLoadRecords "db/rfMonitor2.db"
dbLoadRecords "db/rfMonitor3.db"
dbLoadRecords "db/rfMonitor4.db"
dbLoadRecords "db/rfMonitor5.db"
dbLoadRecords "db/rfMonitor6.db"
dbLoadRecords "db/rfMonitor7.db"
dbLoadRecords "db/rfMonitor8.db"

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=longHost"
