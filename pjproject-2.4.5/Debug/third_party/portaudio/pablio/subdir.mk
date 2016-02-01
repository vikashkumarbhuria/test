################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/portaudio/pablio/pablio.c \
../third_party/portaudio/pablio/test_rw.c \
../third_party/portaudio/pablio/test_rw_echo.c \
../third_party/portaudio/pablio/test_w_saw.c \
../third_party/portaudio/pablio/test_w_saw8.c 

OBJS += \
./third_party/portaudio/pablio/pablio.o \
./third_party/portaudio/pablio/test_rw.o \
./third_party/portaudio/pablio/test_rw_echo.o \
./third_party/portaudio/pablio/test_w_saw.o \
./third_party/portaudio/pablio/test_w_saw8.o 

C_DEPS += \
./third_party/portaudio/pablio/pablio.d \
./third_party/portaudio/pablio/test_rw.d \
./third_party/portaudio/pablio/test_rw_echo.d \
./third_party/portaudio/pablio/test_w_saw.d \
./third_party/portaudio/pablio/test_w_saw8.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/portaudio/pablio/%.o: ../third_party/portaudio/pablio/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


