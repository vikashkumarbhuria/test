################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/srtp/test/dtls_srtp_driver.c \
../third_party/srtp/test/getopt_s.c \
../third_party/srtp/test/lfsr.c \
../third_party/srtp/test/rdbx_driver.c \
../third_party/srtp/test/replay_driver.c \
../third_party/srtp/test/roc_driver.c \
../third_party/srtp/test/rtp.c \
../third_party/srtp/test/rtpw.c \
../third_party/srtp/test/srtp_driver.c 

OBJS += \
./third_party/srtp/test/dtls_srtp_driver.o \
./third_party/srtp/test/getopt_s.o \
./third_party/srtp/test/lfsr.o \
./third_party/srtp/test/rdbx_driver.o \
./third_party/srtp/test/replay_driver.o \
./third_party/srtp/test/roc_driver.o \
./third_party/srtp/test/rtp.o \
./third_party/srtp/test/rtpw.o \
./third_party/srtp/test/srtp_driver.o 

C_DEPS += \
./third_party/srtp/test/dtls_srtp_driver.d \
./third_party/srtp/test/getopt_s.d \
./third_party/srtp/test/lfsr.d \
./third_party/srtp/test/rdbx_driver.d \
./third_party/srtp/test/replay_driver.d \
./third_party/srtp/test/roc_driver.d \
./third_party/srtp/test/rtp.d \
./third_party/srtp/test/rtpw.d \
./third_party/srtp/test/srtp_driver.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/srtp/test/%.o: ../third_party/srtp/test/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


