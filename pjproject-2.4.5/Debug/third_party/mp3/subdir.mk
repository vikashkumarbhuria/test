################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/mp3/mp3_writer.c 

OBJS += \
./third_party/mp3/mp3_writer.o 

C_DEPS += \
./third_party/mp3/mp3_writer.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/mp3/%.o: ../third_party/mp3/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


