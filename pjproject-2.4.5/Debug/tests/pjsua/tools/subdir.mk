################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../tests/pjsua/tools/cmp_wav.c 

OBJS += \
./tests/pjsua/tools/cmp_wav.o 

C_DEPS += \
./tests/pjsua/tools/cmp_wav.d 


# Each subdirectory must supply rules for building sources it contributes
tests/pjsua/tools/%.o: ../tests/pjsua/tools/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


