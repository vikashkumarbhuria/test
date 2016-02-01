################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/g7221/decode/coef2sam.c \
../third_party/g7221/decode/dct4_s.c \
../third_party/g7221/decode/decoder.c 

OBJS += \
./third_party/g7221/decode/coef2sam.o \
./third_party/g7221/decode/dct4_s.o \
./third_party/g7221/decode/decoder.o 

C_DEPS += \
./third_party/g7221/decode/coef2sam.d \
./third_party/g7221/decode/dct4_s.d \
./third_party/g7221/decode/decoder.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/g7221/decode/%.o: ../third_party/g7221/decode/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


