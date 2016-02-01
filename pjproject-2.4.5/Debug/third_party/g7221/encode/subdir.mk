################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/g7221/encode/dct4_a.c \
../third_party/g7221/encode/encoder.c \
../third_party/g7221/encode/sam2coef.c 

OBJS += \
./third_party/g7221/encode/dct4_a.o \
./third_party/g7221/encode/encoder.o \
./third_party/g7221/encode/sam2coef.o 

C_DEPS += \
./third_party/g7221/encode/dct4_a.d \
./third_party/g7221/encode/encoder.d \
./third_party/g7221/encode/sam2coef.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/g7221/encode/%.o: ../third_party/g7221/encode/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


