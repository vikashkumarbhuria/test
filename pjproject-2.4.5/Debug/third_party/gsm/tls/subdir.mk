################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/gsm/tls/bitter.c \
../third_party/gsm/tls/ginger.c \
../third_party/gsm/tls/sour.c \
../third_party/gsm/tls/sweet.c \
../third_party/gsm/tls/taste.c 

OBJS += \
./third_party/gsm/tls/bitter.o \
./third_party/gsm/tls/ginger.o \
./third_party/gsm/tls/sour.o \
./third_party/gsm/tls/sweet.o \
./third_party/gsm/tls/taste.o 

C_DEPS += \
./third_party/gsm/tls/bitter.d \
./third_party/gsm/tls/ginger.d \
./third_party/gsm/tls/sour.d \
./third_party/gsm/tls/sweet.d \
./third_party/gsm/tls/taste.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/gsm/tls/%.o: ../third_party/gsm/tls/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


