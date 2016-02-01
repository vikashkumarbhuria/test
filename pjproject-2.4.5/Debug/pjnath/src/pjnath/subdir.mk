################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjnath/src/pjnath/errno.c \
../pjnath/src/pjnath/ice_session.c \
../pjnath/src/pjnath/ice_strans.c \
../pjnath/src/pjnath/nat_detect.c \
../pjnath/src/pjnath/stun_auth.c \
../pjnath/src/pjnath/stun_msg.c \
../pjnath/src/pjnath/stun_msg_dump.c \
../pjnath/src/pjnath/stun_session.c \
../pjnath/src/pjnath/stun_sock.c \
../pjnath/src/pjnath/stun_transaction.c \
../pjnath/src/pjnath/turn_session.c \
../pjnath/src/pjnath/turn_sock.c 

OBJS += \
./pjnath/src/pjnath/errno.o \
./pjnath/src/pjnath/ice_session.o \
./pjnath/src/pjnath/ice_strans.o \
./pjnath/src/pjnath/nat_detect.o \
./pjnath/src/pjnath/stun_auth.o \
./pjnath/src/pjnath/stun_msg.o \
./pjnath/src/pjnath/stun_msg_dump.o \
./pjnath/src/pjnath/stun_session.o \
./pjnath/src/pjnath/stun_sock.o \
./pjnath/src/pjnath/stun_transaction.o \
./pjnath/src/pjnath/turn_session.o \
./pjnath/src/pjnath/turn_sock.o 

C_DEPS += \
./pjnath/src/pjnath/errno.d \
./pjnath/src/pjnath/ice_session.d \
./pjnath/src/pjnath/ice_strans.d \
./pjnath/src/pjnath/nat_detect.d \
./pjnath/src/pjnath/stun_auth.d \
./pjnath/src/pjnath/stun_msg.d \
./pjnath/src/pjnath/stun_msg_dump.d \
./pjnath/src/pjnath/stun_session.d \
./pjnath/src/pjnath/stun_sock.d \
./pjnath/src/pjnath/stun_transaction.d \
./pjnath/src/pjnath/turn_session.d \
./pjnath/src/pjnath/turn_sock.d 


# Each subdirectory must supply rules for building sources it contributes
pjnath/src/pjnath/%.o: ../pjnath/src/pjnath/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


