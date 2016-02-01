################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/g7221/common/basic_op.c \
../third_party/g7221/common/common.c \
../third_party/g7221/common/huff_tab.c \
../third_party/g7221/common/tables.c 

OBJS += \
./third_party/g7221/common/basic_op.o \
./third_party/g7221/common/common.o \
./third_party/g7221/common/huff_tab.o \
./third_party/g7221/common/tables.o 

C_DEPS += \
./third_party/g7221/common/basic_op.d \
./third_party/g7221/common/common.d \
./third_party/g7221/common/huff_tab.d \
./third_party/g7221/common/tables.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/g7221/common/%.o: ../third_party/g7221/common/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


