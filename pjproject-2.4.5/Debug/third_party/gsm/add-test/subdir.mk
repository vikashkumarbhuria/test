################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/gsm/add-test/add_test.c 

OBJS += \
./third_party/gsm/add-test/add_test.o 

C_DEPS += \
./third_party/gsm/add-test/add_test.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/gsm/add-test/%.o: ../third_party/gsm/add-test/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


