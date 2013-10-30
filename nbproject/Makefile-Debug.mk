#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Generic
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/chunk_signaling.o \
	${OBJECTDIR}/input.o \
	${OBJECTDIR}/loop.o \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/net_helpers.o \
	${OBJECTDIR}/out-stream.o \
	${OBJECTDIR}/output.o \
	${OBJECTDIR}/streaming.o \
	${OBJECTDIR}/topology.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L/home/tobias/dev/GRAPES/dist/Debug/GNU-Generic -Wl,-rpath,. -lGRAPES -lpthread

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/streamerclient

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/streamerclient: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/streamerclient ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/chunk_signaling.o: nbproject/Makefile-${CND_CONF}.mk chunk_signaling.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.c) -g -I/home/tobias/dev/GRAPES/include -MMD -MP -MF $@.d -o ${OBJECTDIR}/chunk_signaling.o chunk_signaling.c

${OBJECTDIR}/input.o: nbproject/Makefile-${CND_CONF}.mk input.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.c) -g -I/home/tobias/dev/GRAPES/include -MMD -MP -MF $@.d -o ${OBJECTDIR}/input.o input.c

${OBJECTDIR}/loop.o: nbproject/Makefile-${CND_CONF}.mk loop.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.c) -g -I/home/tobias/dev/GRAPES/include -MMD -MP -MF $@.d -o ${OBJECTDIR}/loop.o loop.c

${OBJECTDIR}/main.o: nbproject/Makefile-${CND_CONF}.mk main.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.c) -g -I/home/tobias/dev/GRAPES/include -MMD -MP -MF $@.d -o ${OBJECTDIR}/main.o main.c

${OBJECTDIR}/net_helpers.o: nbproject/Makefile-${CND_CONF}.mk net_helpers.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.c) -g -I/home/tobias/dev/GRAPES/include -MMD -MP -MF $@.d -o ${OBJECTDIR}/net_helpers.o net_helpers.c

${OBJECTDIR}/out-stream.o: nbproject/Makefile-${CND_CONF}.mk out-stream.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.c) -g -I/home/tobias/dev/GRAPES/include -MMD -MP -MF $@.d -o ${OBJECTDIR}/out-stream.o out-stream.c

${OBJECTDIR}/output.o: nbproject/Makefile-${CND_CONF}.mk output.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.c) -g -I/home/tobias/dev/GRAPES/include -MMD -MP -MF $@.d -o ${OBJECTDIR}/output.o output.c

${OBJECTDIR}/streaming.o: nbproject/Makefile-${CND_CONF}.mk streaming.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.c) -g -I/home/tobias/dev/GRAPES/include -MMD -MP -MF $@.d -o ${OBJECTDIR}/streaming.o streaming.c

${OBJECTDIR}/topology.o: nbproject/Makefile-${CND_CONF}.mk topology.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.c) -g -I/home/tobias/dev/GRAPES/include -MMD -MP -MF $@.d -o ${OBJECTDIR}/topology.o topology.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/streamerclient

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
