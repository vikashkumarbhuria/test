################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjmedia/src/pjmedia-audiodev/alsa_dev.c \
../pjmedia/src/pjmedia-audiodev/android_jni_dev.c \
../pjmedia/src/pjmedia-audiodev/audiodev.c \
../pjmedia/src/pjmedia-audiodev/audiotest.c \
../pjmedia/src/pjmedia-audiodev/bb10_dev.c \
../pjmedia/src/pjmedia-audiodev/bdimad_dev.c \
../pjmedia/src/pjmedia-audiodev/errno.c \
../pjmedia/src/pjmedia-audiodev/legacy_dev.c \
../pjmedia/src/pjmedia-audiodev/null_dev.c \
../pjmedia/src/pjmedia-audiodev/opensl_dev.c \
../pjmedia/src/pjmedia-audiodev/pa_dev.c \
../pjmedia/src/pjmedia-audiodev/wmme_dev.c 

OBJS += \
./pjmedia/src/pjmedia-audiodev/alsa_dev.o \
./pjmedia/src/pjmedia-audiodev/android_jni_dev.o \
./pjmedia/src/pjmedia-audiodev/audiodev.o \
./pjmedia/src/pjmedia-audiodev/audiotest.o \
./pjmedia/src/pjmedia-audiodev/bb10_dev.o \
./pjmedia/src/pjmedia-audiodev/bdimad_dev.o \
./pjmedia/src/pjmedia-audiodev/errno.o \
./pjmedia/src/pjmedia-audiodev/legacy_dev.o \
./pjmedia/src/pjmedia-audiodev/null_dev.o \
./pjmedia/src/pjmedia-audiodev/opensl_dev.o \
./pjmedia/src/pjmedia-audiodev/pa_dev.o \
./pjmedia/src/pjmedia-audiodev/wmme_dev.o 

C_DEPS += \
./pjmedia/src/pjmedia-audiodev/alsa_dev.d \
./pjmedia/src/pjmedia-audiodev/android_jni_dev.d \
./pjmedia/src/pjmedia-audiodev/audiodev.d \
./pjmedia/src/pjmedia-audiodev/audiotest.d \
./pjmedia/src/pjmedia-audiodev/bb10_dev.d \
./pjmedia/src/pjmedia-audiodev/bdimad_dev.d \
./pjmedia/src/pjmedia-audiodev/errno.d \
./pjmedia/src/pjmedia-audiodev/legacy_dev.d \
./pjmedia/src/pjmedia-audiodev/null_dev.d \
./pjmedia/src/pjmedia-audiodev/opensl_dev.d \
./pjmedia/src/pjmedia-audiodev/pa_dev.d \
./pjmedia/src/pjmedia-audiodev/wmme_dev.d 


# Each subdirectory must supply rules for building sources it contributes
pjmedia/src/pjmedia-audiodev/%.o: ../pjmedia/src/pjmedia-audiodev/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


