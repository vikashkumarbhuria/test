################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjlib/src/pj/compat/sigjmp.c \
../pjlib/src/pj/compat/string.c \
../pjlib/src/pj/compat/string_compat.c 

S_UPPER_SRCS += \
../pjlib/src/pj/compat/longjmp_i386.S \
../pjlib/src/pj/compat/setjmp_i386.S 

OBJS += \
./pjlib/src/pj/compat/longjmp_i386.o \
./pjlib/src/pj/compat/setjmp_i386.o \
./pjlib/src/pj/compat/sigjmp.o \
./pjlib/src/pj/compat/string.o \
./pjlib/src/pj/compat/string_compat.o 

C_DEPS += \
./pjlib/src/pj/compat/sigjmp.d \
./pjlib/src/pj/compat/string.d \
./pjlib/src/pj/compat/string_compat.d 


# Each subdirectory must supply rules for building sources it contributes
pjlib/src/pj/compat/%.o: ../pjlib/src/pj/compat/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

pjlib/src/pj/compat/%.o: ../pjlib/src/pj/compat/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


