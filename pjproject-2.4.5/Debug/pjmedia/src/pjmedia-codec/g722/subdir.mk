################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjmedia/src/pjmedia-codec/g722/g722_dec.c \
../pjmedia/src/pjmedia-codec/g722/g722_enc.c 

OBJS += \
./pjmedia/src/pjmedia-codec/g722/g722_dec.o \
./pjmedia/src/pjmedia-codec/g722/g722_enc.o 

C_DEPS += \
./pjmedia/src/pjmedia-codec/g722/g722_dec.d \
./pjmedia/src/pjmedia-codec/g722/g722_enc.d 


# Each subdirectory must supply rules for building sources it contributes
pjmedia/src/pjmedia-codec/g722/%.o: ../pjmedia/src/pjmedia-codec/g722/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


