TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord

# Install xxxSupport.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Build an IOC support library
LIBRARY_IOC += rfMonitorSupport

# Compile and add the code to the support library
rfMonitorSupport_SRCS += xxxRecord.c
rfMonitorSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
# This is required for Windows DLL builds.
rfMonitorSupport_SRCS += dbSubExample.c
rfMonitorSupport_SRCS += rfMonitorHello.c
rfMonitorSupport_SRCS += initTrace.c

rfMonitorSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

# Build the IOC application
PROD_IOC = rfMonitor

# rfMonitor.dbd will be created and installed
DBD += rfMonitor.dbd

# rfMonitor.dbd will include these files:
rfMonitor_DBD += base.dbd
rfMonitor_DBD += xxxSupport.dbd
rfMonitor_DBD += dbSubExample.dbd
rfMonitor_DBD += rfMonitorHello.dbd
rfMonitor_DBD += initTrace.dbd

# rfMonitor_registerRecordDeviceDriver.cpp derives from rfMonitor.dbd
rfMonitor_SRCS += rfMonitor_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
rfMonitor_SRCS_DEFAULT += rfMonitorMain.cpp
rfMonitor_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#rfMonitor_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from our support library
rfMonitor_LIBS += rfMonitorSupport

# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into rfMonitorSupport
    sncExample_SNCFLAGS += +r
    rfMonitor_DBD += sncExample.dbd
    rfMonitorSupport_SRCS += sncExample.stt
    rfMonitorSupport_LIBS += seq pv
    rfMonitor_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link IOC to the EPICS Base libraries
rfMonitor_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

