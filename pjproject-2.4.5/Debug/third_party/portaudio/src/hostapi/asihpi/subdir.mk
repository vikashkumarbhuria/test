################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/portaudio/src/hostapi/asihpi/pa_linux_asihpi.c 

OBJS += \
./third_party/portaudio/src/hostapi/asihpi/pa_linux_asihpi.o 

C_DEPS += \
./third_party/portaudio/src/hostapi/asihpi/pa_linux_asihpi.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/portaudio/src/hostapi/asihpi/%.o: ../third_party/portaudio/src/hostapi/asihpi/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


