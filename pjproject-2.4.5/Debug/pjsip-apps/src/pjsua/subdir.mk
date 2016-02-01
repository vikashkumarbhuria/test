################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjsip-apps/src/pjsua/main.c \
../pjsip-apps/src/pjsua/main_rtems.c \
../pjsip-apps/src/pjsua/pjsua_app.c \
../pjsip-apps/src/pjsua/pjsua_app_cli.c \
../pjsip-apps/src/pjsua/pjsua_app_common.c \
../pjsip-apps/src/pjsua/pjsua_app_config.c \
../pjsip-apps/src/pjsua/pjsua_app_legacy.c 

OBJS += \
./pjsip-apps/src/pjsua/main.o \
./pjsip-apps/src/pjsua/main_rtems.o \
./pjsip-apps/src/pjsua/pjsua_app.o \
./pjsip-apps/src/pjsua/pjsua_app_cli.o \
./pjsip-apps/src/pjsua/pjsua_app_common.o \
./pjsip-apps/src/pjsua/pjsua_app_config.o \
./pjsip-apps/src/pjsua/pjsua_app_legacy.o 

C_DEPS += \
./pjsip-apps/src/pjsua/main.d \
./pjsip-apps/src/pjsua/main_rtems.d \
./pjsip-apps/src/pjsua/pjsua_app.d \
./pjsip-apps/src/pjsua/pjsua_app_cli.d \
./pjsip-apps/src/pjsua/pjsua_app_common.d \
./pjsip-apps/src/pjsua/pjsua_app_config.d \
./pjsip-apps/src/pjsua/pjsua_app_legacy.d 


# Each subdirectory must supply rules for building sources it contributes
pjsip-apps/src/pjsua/%.o: ../pjsip-apps/src/pjsua/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


