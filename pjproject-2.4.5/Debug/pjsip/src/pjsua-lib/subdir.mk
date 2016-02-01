################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjsip/src/pjsua-lib/pjsua_acc.c \
../pjsip/src/pjsua-lib/pjsua_aud.c \
../pjsip/src/pjsua-lib/pjsua_call.c \
../pjsip/src/pjsua-lib/pjsua_core.c \
../pjsip/src/pjsua-lib/pjsua_dump.c \
../pjsip/src/pjsua-lib/pjsua_im.c \
../pjsip/src/pjsua-lib/pjsua_media.c \
../pjsip/src/pjsua-lib/pjsua_pres.c \
../pjsip/src/pjsua-lib/pjsua_vid.c 

OBJS += \
./pjsip/src/pjsua-lib/pjsua_acc.o \
./pjsip/src/pjsua-lib/pjsua_aud.o \
./pjsip/src/pjsua-lib/pjsua_call.o \
./pjsip/src/pjsua-lib/pjsua_core.o \
./pjsip/src/pjsua-lib/pjsua_dump.o \
./pjsip/src/pjsua-lib/pjsua_im.o \
./pjsip/src/pjsua-lib/pjsua_media.o \
./pjsip/src/pjsua-lib/pjsua_pres.o \
./pjsip/src/pjsua-lib/pjsua_vid.o 

C_DEPS += \
./pjsip/src/pjsua-lib/pjsua_acc.d \
./pjsip/src/pjsua-lib/pjsua_aud.d \
./pjsip/src/pjsua-lib/pjsua_call.d \
./pjsip/src/pjsua-lib/pjsua_core.d \
./pjsip/src/pjsua-lib/pjsua_dump.d \
./pjsip/src/pjsua-lib/pjsua_im.d \
./pjsip/src/pjsua-lib/pjsua_media.d \
./pjsip/src/pjsua-lib/pjsua_pres.d \
./pjsip/src/pjsua-lib/pjsua_vid.d 


# Each subdirectory must supply rules for building sources it contributes
pjsip/src/pjsua-lib/%.o: ../pjsip/src/pjsua-lib/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


