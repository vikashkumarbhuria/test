################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/portaudio/src/hostapi/coreaudio/pa_mac_core.c \
../third_party/portaudio/src/hostapi/coreaudio/pa_mac_core_blocking.c \
../third_party/portaudio/src/hostapi/coreaudio/pa_mac_core_old.c \
../third_party/portaudio/src/hostapi/coreaudio/pa_mac_core_utilities.c 

OBJS += \
./third_party/portaudio/src/hostapi/coreaudio/pa_mac_core.o \
./third_party/portaudio/src/hostapi/coreaudio/pa_mac_core_blocking.o \
./third_party/portaudio/src/hostapi/coreaudio/pa_mac_core_old.o \
./third_party/portaudio/src/hostapi/coreaudio/pa_mac_core_utilities.o 

C_DEPS += \
./third_party/portaudio/src/hostapi/coreaudio/pa_mac_core.d \
./third_party/portaudio/src/hostapi/coreaudio/pa_mac_core_blocking.d \
./third_party/portaudio/src/hostapi/coreaudio/pa_mac_core_old.d \
./third_party/portaudio/src/hostapi/coreaudio/pa_mac_core_utilities.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/portaudio/src/hostapi/coreaudio/%.o: ../third_party/portaudio/src/hostapi/coreaudio/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


