################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/portaudio/src/common/pa_allocation.c \
../third_party/portaudio/src/common/pa_converters.c \
../third_party/portaudio/src/common/pa_cpuload.c \
../third_party/portaudio/src/common/pa_debugprint.c \
../third_party/portaudio/src/common/pa_dither.c \
../third_party/portaudio/src/common/pa_front.c \
../third_party/portaudio/src/common/pa_process.c \
../third_party/portaudio/src/common/pa_ringbuffer.c \
../third_party/portaudio/src/common/pa_skeleton.c \
../third_party/portaudio/src/common/pa_stream.c \
../third_party/portaudio/src/common/pa_trace.c 

OBJS += \
./third_party/portaudio/src/common/pa_allocation.o \
./third_party/portaudio/src/common/pa_converters.o \
./third_party/portaudio/src/common/pa_cpuload.o \
./third_party/portaudio/src/common/pa_debugprint.o \
./third_party/portaudio/src/common/pa_dither.o \
./third_party/portaudio/src/common/pa_front.o \
./third_party/portaudio/src/common/pa_process.o \
./third_party/portaudio/src/common/pa_ringbuffer.o \
./third_party/portaudio/src/common/pa_skeleton.o \
./third_party/portaudio/src/common/pa_stream.o \
./third_party/portaudio/src/common/pa_trace.o 

C_DEPS += \
./third_party/portaudio/src/common/pa_allocation.d \
./third_party/portaudio/src/common/pa_converters.d \
./third_party/portaudio/src/common/pa_cpuload.d \
./third_party/portaudio/src/common/pa_debugprint.d \
./third_party/portaudio/src/common/pa_dither.d \
./third_party/portaudio/src/common/pa_front.d \
./third_party/portaudio/src/common/pa_process.d \
./third_party/portaudio/src/common/pa_ringbuffer.d \
./third_party/portaudio/src/common/pa_skeleton.d \
./third_party/portaudio/src/common/pa_stream.d \
./third_party/portaudio/src/common/pa_trace.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/portaudio/src/common/%.o: ../third_party/portaudio/src/common/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


