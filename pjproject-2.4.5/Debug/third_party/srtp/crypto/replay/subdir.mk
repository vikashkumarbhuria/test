################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/srtp/crypto/replay/rdb.c \
../third_party/srtp/crypto/replay/rdbx.c \
../third_party/srtp/crypto/replay/ut_sim.c 

OBJS += \
./third_party/srtp/crypto/replay/rdb.o \
./third_party/srtp/crypto/replay/rdbx.o \
./third_party/srtp/crypto/replay/ut_sim.o 

C_DEPS += \
./third_party/srtp/crypto/replay/rdb.d \
./third_party/srtp/crypto/replay/rdbx.d \
./third_party/srtp/crypto/replay/ut_sim.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/srtp/crypto/replay/%.o: ../third_party/srtp/crypto/replay/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


