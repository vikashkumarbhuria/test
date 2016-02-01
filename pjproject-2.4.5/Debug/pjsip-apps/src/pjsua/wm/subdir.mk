################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjsip-apps/src/pjsua/wm/main_wm.c 

OBJS += \
./pjsip-apps/src/pjsua/wm/main_wm.o 

C_DEPS += \
./pjsip-apps/src/pjsua/wm/main_wm.d 


# Each subdirectory must supply rules for building sources it contributes
pjsip-apps/src/pjsua/wm/%.o: ../pjsip-apps/src/pjsua/wm/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


