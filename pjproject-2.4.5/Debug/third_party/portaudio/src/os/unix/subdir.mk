################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/portaudio/src/os/unix/pa_unix_hostapis.c \
../third_party/portaudio/src/os/unix/pa_unix_util.c 

OBJS += \
./third_party/portaudio/src/os/unix/pa_unix_hostapis.o \
./third_party/portaudio/src/os/unix/pa_unix_util.o 

C_DEPS += \
./third_party/portaudio/src/os/unix/pa_unix_hostapis.d \
./third_party/portaudio/src/os/unix/pa_unix_util.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/portaudio/src/os/unix/%.o: ../third_party/portaudio/src/os/unix/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


