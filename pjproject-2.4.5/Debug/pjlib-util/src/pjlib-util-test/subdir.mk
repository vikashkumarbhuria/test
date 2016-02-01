################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjlib-util/src/pjlib-util-test/encryption.c \
../pjlib-util/src/pjlib-util-test/http_client.c \
../pjlib-util/src/pjlib-util-test/json_test.c \
../pjlib-util/src/pjlib-util-test/main.c \
../pjlib-util/src/pjlib-util-test/main_rtems.c \
../pjlib-util/src/pjlib-util-test/main_win32.c \
../pjlib-util/src/pjlib-util-test/resolver_test.c \
../pjlib-util/src/pjlib-util-test/stun.c \
../pjlib-util/src/pjlib-util-test/test.c \
../pjlib-util/src/pjlib-util-test/xml.c 

OBJS += \
./pjlib-util/src/pjlib-util-test/encryption.o \
./pjlib-util/src/pjlib-util-test/http_client.o \
./pjlib-util/src/pjlib-util-test/json_test.o \
./pjlib-util/src/pjlib-util-test/main.o \
./pjlib-util/src/pjlib-util-test/main_rtems.o \
./pjlib-util/src/pjlib-util-test/main_win32.o \
./pjlib-util/src/pjlib-util-test/resolver_test.o \
./pjlib-util/src/pjlib-util-test/stun.o \
./pjlib-util/src/pjlib-util-test/test.o \
./pjlib-util/src/pjlib-util-test/xml.o 

C_DEPS += \
./pjlib-util/src/pjlib-util-test/encryption.d \
./pjlib-util/src/pjlib-util-test/http_client.d \
./pjlib-util/src/pjlib-util-test/json_test.d \
./pjlib-util/src/pjlib-util-test/main.d \
./pjlib-util/src/pjlib-util-test/main_rtems.d \
./pjlib-util/src/pjlib-util-test/main_win32.d \
./pjlib-util/src/pjlib-util-test/resolver_test.d \
./pjlib-util/src/pjlib-util-test/stun.d \
./pjlib-util/src/pjlib-util-test/test.d \
./pjlib-util/src/pjlib-util-test/xml.d 


# Each subdirectory must supply rules for building sources it contributes
pjlib-util/src/pjlib-util-test/%.o: ../pjlib-util/src/pjlib-util-test/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


