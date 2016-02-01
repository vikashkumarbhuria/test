################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjsip-apps/src/python/_pjsua.c 

OBJS += \
./pjsip-apps/src/python/_pjsua.o 

C_DEPS += \
./pjsip-apps/src/python/_pjsua.d 


# Each subdirectory must supply rules for building sources it contributes
pjsip-apps/src/python/%.o: ../pjsip-apps/src/python/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


