################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjnath/src/pjturn-srv/allocation.c \
../pjnath/src/pjturn-srv/auth.c \
../pjnath/src/pjturn-srv/listener_tcp.c \
../pjnath/src/pjturn-srv/listener_udp.c \
../pjnath/src/pjturn-srv/main.c \
../pjnath/src/pjturn-srv/server.c 

OBJS += \
./pjnath/src/pjturn-srv/allocation.o \
./pjnath/src/pjturn-srv/auth.o \
./pjnath/src/pjturn-srv/listener_tcp.o \
./pjnath/src/pjturn-srv/listener_udp.o \
./pjnath/src/pjturn-srv/main.o \
./pjnath/src/pjturn-srv/server.o 

C_DEPS += \
./pjnath/src/pjturn-srv/allocation.d \
./pjnath/src/pjturn-srv/auth.d \
./pjnath/src/pjturn-srv/listener_tcp.d \
./pjnath/src/pjturn-srv/listener_udp.d \
./pjnath/src/pjturn-srv/main.d \
./pjnath/src/pjturn-srv/server.d 


# Each subdirectory must supply rules for building sources it contributes
pjnath/src/pjturn-srv/%.o: ../pjnath/src/pjturn-srv/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


