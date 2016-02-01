################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/gsm/tst/cod2lin.c \
../third_party/gsm/tst/cod2txt.c \
../third_party/gsm/tst/gsm2cod.c \
../third_party/gsm/tst/lin2cod.c \
../third_party/gsm/tst/lin2txt.c 

OBJS += \
./third_party/gsm/tst/cod2lin.o \
./third_party/gsm/tst/cod2txt.o \
./third_party/gsm/tst/gsm2cod.o \
./third_party/gsm/tst/lin2cod.o \
./third_party/gsm/tst/lin2txt.o 

C_DEPS += \
./third_party/gsm/tst/cod2lin.d \
./third_party/gsm/tst/cod2txt.d \
./third_party/gsm/tst/gsm2cod.d \
./third_party/gsm/tst/lin2cod.d \
./third_party/gsm/tst/lin2txt.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/gsm/tst/%.o: ../third_party/gsm/tst/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


