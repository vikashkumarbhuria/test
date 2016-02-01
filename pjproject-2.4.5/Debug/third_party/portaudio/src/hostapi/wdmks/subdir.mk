################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/portaudio/src/hostapi/wdmks/pa_win_wdmks.c 

OBJS += \
./third_party/portaudio/src/hostapi/wdmks/pa_win_wdmks.o 

C_DEPS += \
./third_party/portaudio/src/hostapi/wdmks/pa_win_wdmks.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/portaudio/src/hostapi/wdmks/%.o: ../third_party/portaudio/src/hostapi/wdmks/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


