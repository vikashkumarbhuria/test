################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/portaudio/src/os/win/pa_win_hostapis.c \
../third_party/portaudio/src/os/win/pa_win_util.c \
../third_party/portaudio/src/os/win/pa_win_waveformat.c \
../third_party/portaudio/src/os/win/pa_win_wdmks_utils.c \
../third_party/portaudio/src/os/win/pa_x86_plain_converters.c 

OBJS += \
./third_party/portaudio/src/os/win/pa_win_hostapis.o \
./third_party/portaudio/src/os/win/pa_win_util.o \
./third_party/portaudio/src/os/win/pa_win_waveformat.o \
./third_party/portaudio/src/os/win/pa_win_wdmks_utils.o \
./third_party/portaudio/src/os/win/pa_x86_plain_converters.o 

C_DEPS += \
./third_party/portaudio/src/os/win/pa_win_hostapis.d \
./third_party/portaudio/src/os/win/pa_win_util.d \
./third_party/portaudio/src/os/win/pa_win_waveformat.d \
./third_party/portaudio/src/os/win/pa_win_wdmks_utils.d \
./third_party/portaudio/src/os/win/pa_x86_plain_converters.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/portaudio/src/os/win/%.o: ../third_party/portaudio/src/os/win/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


