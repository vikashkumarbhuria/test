################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjsip/src/pjsip-simple/errno.c \
../pjsip/src/pjsip-simple/evsub.c \
../pjsip/src/pjsip-simple/evsub_msg.c \
../pjsip/src/pjsip-simple/iscomposing.c \
../pjsip/src/pjsip-simple/mwi.c \
../pjsip/src/pjsip-simple/pidf.c \
../pjsip/src/pjsip-simple/presence.c \
../pjsip/src/pjsip-simple/presence_body.c \
../pjsip/src/pjsip-simple/publishc.c \
../pjsip/src/pjsip-simple/rpid.c \
../pjsip/src/pjsip-simple/xpidf.c 

OBJS += \
./pjsip/src/pjsip-simple/errno.o \
./pjsip/src/pjsip-simple/evsub.o \
./pjsip/src/pjsip-simple/evsub_msg.o \
./pjsip/src/pjsip-simple/iscomposing.o \
./pjsip/src/pjsip-simple/mwi.o \
./pjsip/src/pjsip-simple/pidf.o \
./pjsip/src/pjsip-simple/presence.o \
./pjsip/src/pjsip-simple/presence_body.o \
./pjsip/src/pjsip-simple/publishc.o \
./pjsip/src/pjsip-simple/rpid.o \
./pjsip/src/pjsip-simple/xpidf.o 

C_DEPS += \
./pjsip/src/pjsip-simple/errno.d \
./pjsip/src/pjsip-simple/evsub.d \
./pjsip/src/pjsip-simple/evsub_msg.d \
./pjsip/src/pjsip-simple/iscomposing.d \
./pjsip/src/pjsip-simple/mwi.d \
./pjsip/src/pjsip-simple/pidf.d \
./pjsip/src/pjsip-simple/presence.d \
./pjsip/src/pjsip-simple/presence_body.d \
./pjsip/src/pjsip-simple/publishc.d \
./pjsip/src/pjsip-simple/rpid.d \
./pjsip/src/pjsip-simple/xpidf.d 


# Each subdirectory must supply rules for building sources it contributes
pjsip/src/pjsip-simple/%.o: ../pjsip/src/pjsip-simple/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


