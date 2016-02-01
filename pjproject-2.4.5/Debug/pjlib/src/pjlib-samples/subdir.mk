################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjlib/src/pjlib-samples/except.c \
../pjlib/src/pjlib-samples/list.c \
../pjlib/src/pjlib-samples/log.c 

OBJS += \
./pjlib/src/pjlib-samples/except.o \
./pjlib/src/pjlib-samples/list.o \
./pjlib/src/pjlib-samples/log.o 

C_DEPS += \
./pjlib/src/pjlib-samples/except.d \
./pjlib/src/pjlib-samples/list.d \
./pjlib/src/pjlib-samples/log.d 


# Each subdirectory must supply rules for building sources it contributes
pjlib/src/pjlib-samples/%.o: ../pjlib/src/pjlib-samples/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


