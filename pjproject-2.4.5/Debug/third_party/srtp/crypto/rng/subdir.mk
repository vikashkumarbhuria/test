################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/srtp/crypto/rng/ctr_prng.c \
../third_party/srtp/crypto/rng/prng.c \
../third_party/srtp/crypto/rng/rand_linux_kernel.c \
../third_party/srtp/crypto/rng/rand_source.c 

OBJS += \
./third_party/srtp/crypto/rng/ctr_prng.o \
./third_party/srtp/crypto/rng/prng.o \
./third_party/srtp/crypto/rng/rand_linux_kernel.o \
./third_party/srtp/crypto/rng/rand_source.o 

C_DEPS += \
./third_party/srtp/crypto/rng/ctr_prng.d \
./third_party/srtp/crypto/rng/prng.d \
./third_party/srtp/crypto/rng/rand_linux_kernel.d \
./third_party/srtp/crypto/rng/rand_source.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/srtp/crypto/rng/%.o: ../third_party/srtp/crypto/rng/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


