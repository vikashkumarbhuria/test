################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjsip/src/pjsip-ua/sip_100rel.c \
../pjsip/src/pjsip-ua/sip_inv.c \
../pjsip/src/pjsip-ua/sip_reg.c \
../pjsip/src/pjsip-ua/sip_replaces.c \
../pjsip/src/pjsip-ua/sip_timer.c \
../pjsip/src/pjsip-ua/sip_xfer.c 

OBJS += \
./pjsip/src/pjsip-ua/sip_100rel.o \
./pjsip/src/pjsip-ua/sip_inv.o \
./pjsip/src/pjsip-ua/sip_reg.o \
./pjsip/src/pjsip-ua/sip_replaces.o \
./pjsip/src/pjsip-ua/sip_timer.o \
./pjsip/src/pjsip-ua/sip_xfer.o 

C_DEPS += \
./pjsip/src/pjsip-ua/sip_100rel.d \
./pjsip/src/pjsip-ua/sip_inv.d \
./pjsip/src/pjsip-ua/sip_reg.d \
./pjsip/src/pjsip-ua/sip_replaces.d \
./pjsip/src/pjsip-ua/sip_timer.d \
./pjsip/src/pjsip-ua/sip_xfer.d 


# Each subdirectory must supply rules for building sources it contributes
pjsip/src/pjsip-ua/%.o: ../pjsip/src/pjsip-ua/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


