################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/srtp/crypto/cipher/aes.c \
../third_party/srtp/crypto/cipher/aes_cbc.c \
../third_party/srtp/crypto/cipher/aes_icm.c \
../third_party/srtp/crypto/cipher/cipher.c \
../third_party/srtp/crypto/cipher/null_cipher.c 

OBJS += \
./third_party/srtp/crypto/cipher/aes.o \
./third_party/srtp/crypto/cipher/aes_cbc.o \
./third_party/srtp/crypto/cipher/aes_icm.o \
./third_party/srtp/crypto/cipher/cipher.o \
./third_party/srtp/crypto/cipher/null_cipher.o 

C_DEPS += \
./third_party/srtp/crypto/cipher/aes.d \
./third_party/srtp/crypto/cipher/aes_cbc.d \
./third_party/srtp/crypto/cipher/aes_icm.d \
./third_party/srtp/crypto/cipher/cipher.d \
./third_party/srtp/crypto/cipher/null_cipher.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/srtp/crypto/cipher/%.o: ../third_party/srtp/crypto/cipher/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


