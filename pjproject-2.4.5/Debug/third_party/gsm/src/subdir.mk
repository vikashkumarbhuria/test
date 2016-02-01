################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/gsm/src/add.c \
../third_party/gsm/src/code.c \
../third_party/gsm/src/debug.c \
../third_party/gsm/src/decode.c \
../third_party/gsm/src/gsm_create.c \
../third_party/gsm/src/gsm_decode.c \
../third_party/gsm/src/gsm_destroy.c \
../third_party/gsm/src/gsm_encode.c \
../third_party/gsm/src/gsm_explode.c \
../third_party/gsm/src/gsm_implode.c \
../third_party/gsm/src/gsm_option.c \
../third_party/gsm/src/gsm_print.c \
../third_party/gsm/src/long_term.c \
../third_party/gsm/src/lpc.c \
../third_party/gsm/src/preprocess.c \
../third_party/gsm/src/rpe.c \
../third_party/gsm/src/short_term.c \
../third_party/gsm/src/table.c \
../third_party/gsm/src/toast.c \
../third_party/gsm/src/toast_alaw.c \
../third_party/gsm/src/toast_audio.c \
../third_party/gsm/src/toast_lin.c \
../third_party/gsm/src/toast_ulaw.c 

OBJS += \
./third_party/gsm/src/add.o \
./third_party/gsm/src/code.o \
./third_party/gsm/src/debug.o \
./third_party/gsm/src/decode.o \
./third_party/gsm/src/gsm_create.o \
./third_party/gsm/src/gsm_decode.o \
./third_party/gsm/src/gsm_destroy.o \
./third_party/gsm/src/gsm_encode.o \
./third_party/gsm/src/gsm_explode.o \
./third_party/gsm/src/gsm_implode.o \
./third_party/gsm/src/gsm_option.o \
./third_party/gsm/src/gsm_print.o \
./third_party/gsm/src/long_term.o \
./third_party/gsm/src/lpc.o \
./third_party/gsm/src/preprocess.o \
./third_party/gsm/src/rpe.o \
./third_party/gsm/src/short_term.o \
./third_party/gsm/src/table.o \
./third_party/gsm/src/toast.o \
./third_party/gsm/src/toast_alaw.o \
./third_party/gsm/src/toast_audio.o \
./third_party/gsm/src/toast_lin.o \
./third_party/gsm/src/toast_ulaw.o 

C_DEPS += \
./third_party/gsm/src/add.d \
./third_party/gsm/src/code.d \
./third_party/gsm/src/debug.d \
./third_party/gsm/src/decode.d \
./third_party/gsm/src/gsm_create.d \
./third_party/gsm/src/gsm_decode.d \
./third_party/gsm/src/gsm_destroy.d \
./third_party/gsm/src/gsm_encode.d \
./third_party/gsm/src/gsm_explode.d \
./third_party/gsm/src/gsm_implode.d \
./third_party/gsm/src/gsm_option.d \
./third_party/gsm/src/gsm_print.d \
./third_party/gsm/src/long_term.d \
./third_party/gsm/src/lpc.d \
./third_party/gsm/src/preprocess.d \
./third_party/gsm/src/rpe.d \
./third_party/gsm/src/short_term.d \
./third_party/gsm/src/table.d \
./third_party/gsm/src/toast.d \
./third_party/gsm/src/toast_alaw.d \
./third_party/gsm/src/toast_audio.d \
./third_party/gsm/src/toast_lin.d \
./third_party/gsm/src/toast_ulaw.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/gsm/src/%.o: ../third_party/gsm/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


