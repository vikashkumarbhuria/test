################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjsip-apps/build/dummy.c 

OBJS += \
./pjsip-apps/build/dummy.o 

C_DEPS += \
./pjsip-apps/build/dummy.d 


# Each subdirectory must supply rules for building sources it contributes
pjsip-apps/build/%.o: ../pjsip-apps/build/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


