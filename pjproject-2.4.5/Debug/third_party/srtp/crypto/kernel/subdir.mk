################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/srtp/crypto/kernel/alloc.c \
../third_party/srtp/crypto/kernel/crypto_kernel.c \
../third_party/srtp/crypto/kernel/err.c \
../third_party/srtp/crypto/kernel/key.c 

OBJS += \
./third_party/srtp/crypto/kernel/alloc.o \
./third_party/srtp/crypto/kernel/crypto_kernel.o \
./third_party/srtp/crypto/kernel/err.o \
./third_party/srtp/crypto/kernel/key.o 

C_DEPS += \
./third_party/srtp/crypto/kernel/alloc.d \
./third_party/srtp/crypto/kernel/crypto_kernel.d \
./third_party/srtp/crypto/kernel/err.d \
./third_party/srtp/crypto/kernel/key.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/srtp/crypto/kernel/%.o: ../third_party/srtp/crypto/kernel/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


