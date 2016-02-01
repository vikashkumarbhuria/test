################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjsip-apps/src/pjsystest/main_console.c \
../pjsip-apps/src/pjsystest/main_wm.c \
../pjsip-apps/src/pjsystest/systest.c 

OBJS += \
./pjsip-apps/src/pjsystest/main_console.o \
./pjsip-apps/src/pjsystest/main_wm.o \
./pjsip-apps/src/pjsystest/systest.o 

C_DEPS += \
./pjsip-apps/src/pjsystest/main_console.d \
./pjsip-apps/src/pjsystest/main_wm.d \
./pjsip-apps/src/pjsystest/systest.d 


# Each subdirectory must supply rules for building sources it contributes
pjsip-apps/src/pjsystest/%.o: ../pjsip-apps/src/pjsystest/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


