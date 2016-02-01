################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/srtp/crypto/math/datatypes.c \
../third_party/srtp/crypto/math/gf2_8.c \
../third_party/srtp/crypto/math/math.c \
../third_party/srtp/crypto/math/stat.c 

OBJS += \
./third_party/srtp/crypto/math/datatypes.o \
./third_party/srtp/crypto/math/gf2_8.o \
./third_party/srtp/crypto/math/math.o \
./third_party/srtp/crypto/math/stat.o 

C_DEPS += \
./third_party/srtp/crypto/math/datatypes.d \
./third_party/srtp/crypto/math/gf2_8.d \
./third_party/srtp/crypto/math/math.d \
./third_party/srtp/crypto/math/stat.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/srtp/crypto/math/%.o: ../third_party/srtp/crypto/math/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


