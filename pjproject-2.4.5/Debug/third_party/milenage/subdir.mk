################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/milenage/milenage.c \
../third_party/milenage/rijndael.c 

OBJS += \
./third_party/milenage/milenage.o \
./third_party/milenage/rijndael.o 

C_DEPS += \
./third_party/milenage/milenage.d \
./third_party/milenage/rijndael.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/milenage/%.o: ../third_party/milenage/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


