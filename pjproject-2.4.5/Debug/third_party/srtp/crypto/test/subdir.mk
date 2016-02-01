################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/srtp/crypto/test/aes_calc.c \
../third_party/srtp/crypto/test/auth_driver.c \
../third_party/srtp/crypto/test/cipher_driver.c \
../third_party/srtp/crypto/test/datatypes_driver.c \
../third_party/srtp/crypto/test/env.c \
../third_party/srtp/crypto/test/kernel_driver.c \
../third_party/srtp/crypto/test/rand_gen.c \
../third_party/srtp/crypto/test/sha1_driver.c \
../third_party/srtp/crypto/test/stat_driver.c 

OBJS += \
./third_party/srtp/crypto/test/aes_calc.o \
./third_party/srtp/crypto/test/auth_driver.o \
./third_party/srtp/crypto/test/cipher_driver.o \
./third_party/srtp/crypto/test/datatypes_driver.o \
./third_party/srtp/crypto/test/env.o \
./third_party/srtp/crypto/test/kernel_driver.o \
./third_party/srtp/crypto/test/rand_gen.o \
./third_party/srtp/crypto/test/sha1_driver.o \
./third_party/srtp/crypto/test/stat_driver.o 

C_DEPS += \
./third_party/srtp/crypto/test/aes_calc.d \
./third_party/srtp/crypto/test/auth_driver.d \
./third_party/srtp/crypto/test/cipher_driver.d \
./third_party/srtp/crypto/test/datatypes_driver.d \
./third_party/srtp/crypto/test/env.d \
./third_party/srtp/crypto/test/kernel_driver.d \
./third_party/srtp/crypto/test/rand_gen.d \
./third_party/srtp/crypto/test/sha1_driver.d \
./third_party/srtp/crypto/test/stat_driver.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/srtp/crypto/test/%.o: ../third_party/srtp/crypto/test/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


