################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/portaudio/src/hostapi/oss/pa_unix_oss.c \
../third_party/portaudio/src/hostapi/oss/recplay.c 

OBJS += \
./third_party/portaudio/src/hostapi/oss/pa_unix_oss.o \
./third_party/portaudio/src/hostapi/oss/recplay.o 

C_DEPS += \
./third_party/portaudio/src/hostapi/oss/pa_unix_oss.d \
./third_party/portaudio/src/hostapi/oss/recplay.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/portaudio/src/hostapi/oss/%.o: ../third_party/portaudio/src/hostapi/oss/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


