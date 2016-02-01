################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjnath/src/pjnath-test/concur_test.c \
../pjnath/src/pjnath-test/ice_test.c \
../pjnath/src/pjnath-test/main.c \
../pjnath/src/pjnath-test/main_win32.c \
../pjnath/src/pjnath-test/server.c \
../pjnath/src/pjnath-test/sess_auth.c \
../pjnath/src/pjnath-test/stun.c \
../pjnath/src/pjnath-test/stun_sock_test.c \
../pjnath/src/pjnath-test/test.c \
../pjnath/src/pjnath-test/turn_sock_test.c 

OBJS += \
./pjnath/src/pjnath-test/concur_test.o \
./pjnath/src/pjnath-test/ice_test.o \
./pjnath/src/pjnath-test/main.o \
./pjnath/src/pjnath-test/main_win32.o \
./pjnath/src/pjnath-test/server.o \
./pjnath/src/pjnath-test/sess_auth.o \
./pjnath/src/pjnath-test/stun.o \
./pjnath/src/pjnath-test/stun_sock_test.o \
./pjnath/src/pjnath-test/test.o \
./pjnath/src/pjnath-test/turn_sock_test.o 

C_DEPS += \
./pjnath/src/pjnath-test/concur_test.d \
./pjnath/src/pjnath-test/ice_test.d \
./pjnath/src/pjnath-test/main.d \
./pjnath/src/pjnath-test/main_win32.d \
./pjnath/src/pjnath-test/server.d \
./pjnath/src/pjnath-test/sess_auth.d \
./pjnath/src/pjnath-test/stun.d \
./pjnath/src/pjnath-test/stun_sock_test.d \
./pjnath/src/pjnath-test/test.d \
./pjnath/src/pjnath-test/turn_sock_test.d 


# Each subdirectory must supply rules for building sources it contributes
pjnath/src/pjnath-test/%.o: ../pjnath/src/pjnath-test/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


