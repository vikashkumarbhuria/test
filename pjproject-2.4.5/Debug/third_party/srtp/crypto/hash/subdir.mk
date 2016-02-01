################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/srtp/crypto/hash/auth.c \
../third_party/srtp/crypto/hash/hmac.c \
../third_party/srtp/crypto/hash/null_auth.c \
../third_party/srtp/crypto/hash/sha1.c 

OBJS += \
./third_party/srtp/crypto/hash/auth.o \
./third_party/srtp/crypto/hash/hmac.o \
./third_party/srtp/crypto/hash/null_auth.o \
./third_party/srtp/crypto/hash/sha1.o 

C_DEPS += \
./third_party/srtp/crypto/hash/auth.d \
./third_party/srtp/crypto/hash/hmac.d \
./third_party/srtp/crypto/hash/null_auth.d \
./third_party/srtp/crypto/hash/sha1.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/srtp/crypto/hash/%.o: ../third_party/srtp/crypto/hash/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


