################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/build/portaudio/src/pa_allocation.c \
../third_party/build/portaudio/src/pa_converters.c \
../third_party/build/portaudio/src/pa_cpuload.c \
../third_party/build/portaudio/src/pa_debugprint.c \
../third_party/build/portaudio/src/pa_dither.c \
../third_party/build/portaudio/src/pa_front.c \
../third_party/build/portaudio/src/pa_linux_alsa.c \
../third_party/build/portaudio/src/pa_mac_core.c \
../third_party/build/portaudio/src/pa_mac_core_blocking.c \
../third_party/build/portaudio/src/pa_mac_core_old.c \
../third_party/build/portaudio/src/pa_mac_core_utilities.c \
../third_party/build/portaudio/src/pa_mac_hostapis.c \
../third_party/build/portaudio/src/pa_process.c \
../third_party/build/portaudio/src/pa_ringbuffer.c \
../third_party/build/portaudio/src/pa_skeleton.c \
../third_party/build/portaudio/src/pa_stream.c \
../third_party/build/portaudio/src/pa_trace.c \
../third_party/build/portaudio/src/pa_unix_hostapis.c \
../third_party/build/portaudio/src/pa_unix_oss.c \
../third_party/build/portaudio/src/pa_unix_util.c \
../third_party/build/portaudio/src/pa_win_hostapis.c \
../third_party/build/portaudio/src/pa_win_util.c \
../third_party/build/portaudio/src/pa_win_waveformat.c \
../third_party/build/portaudio/src/pa_win_wmme.c 

OBJS += \
./third_party/build/portaudio/src/pa_allocation.o \
./third_party/build/portaudio/src/pa_converters.o \
./third_party/build/portaudio/src/pa_cpuload.o \
./third_party/build/portaudio/src/pa_debugprint.o \
./third_party/build/portaudio/src/pa_dither.o \
./third_party/build/portaudio/src/pa_front.o \
./third_party/build/portaudio/src/pa_linux_alsa.o \
./third_party/build/portaudio/src/pa_mac_core.o \
./third_party/build/portaudio/src/pa_mac_core_blocking.o \
./third_party/build/portaudio/src/pa_mac_core_old.o \
./third_party/build/portaudio/src/pa_mac_core_utilities.o \
./third_party/build/portaudio/src/pa_mac_hostapis.o \
./third_party/build/portaudio/src/pa_process.o \
./third_party/build/portaudio/src/pa_ringbuffer.o \
./third_party/build/portaudio/src/pa_skeleton.o \
./third_party/build/portaudio/src/pa_stream.o \
./third_party/build/portaudio/src/pa_trace.o \
./third_party/build/portaudio/src/pa_unix_hostapis.o \
./third_party/build/portaudio/src/pa_unix_oss.o \
./third_party/build/portaudio/src/pa_unix_util.o \
./third_party/build/portaudio/src/pa_win_hostapis.o \
./third_party/build/portaudio/src/pa_win_util.o \
./third_party/build/portaudio/src/pa_win_waveformat.o \
./third_party/build/portaudio/src/pa_win_wmme.o 

C_DEPS += \
./third_party/build/portaudio/src/pa_allocation.d \
./third_party/build/portaudio/src/pa_converters.d \
./third_party/build/portaudio/src/pa_cpuload.d \
./third_party/build/portaudio/src/pa_debugprint.d \
./third_party/build/portaudio/src/pa_dither.d \
./third_party/build/portaudio/src/pa_front.d \
./third_party/build/portaudio/src/pa_linux_alsa.d \
./third_party/build/portaudio/src/pa_mac_core.d \
./third_party/build/portaudio/src/pa_mac_core_blocking.d \
./third_party/build/portaudio/src/pa_mac_core_old.d \
./third_party/build/portaudio/src/pa_mac_core_utilities.d \
./third_party/build/portaudio/src/pa_mac_hostapis.d \
./third_party/build/portaudio/src/pa_process.d \
./third_party/build/portaudio/src/pa_ringbuffer.d \
./third_party/build/portaudio/src/pa_skeleton.d \
./third_party/build/portaudio/src/pa_stream.d \
./third_party/build/portaudio/src/pa_trace.d \
./third_party/build/portaudio/src/pa_unix_hostapis.d \
./third_party/build/portaudio/src/pa_unix_oss.d \
./third_party/build/portaudio/src/pa_unix_util.d \
./third_party/build/portaudio/src/pa_win_hostapis.d \
./third_party/build/portaudio/src/pa_win_util.d \
./third_party/build/portaudio/src/pa_win_waveformat.d \
./third_party/build/portaudio/src/pa_win_wmme.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/build/portaudio/src/%.o: ../third_party/build/portaudio/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


