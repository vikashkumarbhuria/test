################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjsip-apps/src/3rdparty_media_sample/alt_pjsua_aud.c \
../pjsip-apps/src/3rdparty_media_sample/alt_pjsua_vid.c 

OBJS += \
./pjsip-apps/src/3rdparty_media_sample/alt_pjsua_aud.o \
./pjsip-apps/src/3rdparty_media_sample/alt_pjsua_vid.o 

C_DEPS += \
./pjsip-apps/src/3rdparty_media_sample/alt_pjsua_aud.d \
./pjsip-apps/src/3rdparty_media_sample/alt_pjsua_vid.d 


# Each subdirectory must supply rules for building sources it contributes
pjsip-apps/src/3rdparty_media_sample/%.o: ../pjsip-apps/src/3rdparty_media_sample/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


