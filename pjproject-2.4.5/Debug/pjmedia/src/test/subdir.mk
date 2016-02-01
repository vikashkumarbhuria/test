################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjmedia/src/test/audio_tool.c \
../pjmedia/src/test/codec_vectors.c \
../pjmedia/src/test/jbuf_test.c \
../pjmedia/src/test/main.c \
../pjmedia/src/test/mips_test.c \
../pjmedia/src/test/rtp_test.c \
../pjmedia/src/test/sdp_neg_test.c \
../pjmedia/src/test/sdptest.c \
../pjmedia/src/test/session_test.c \
../pjmedia/src/test/test.c \
../pjmedia/src/test/vid_codec_test.c \
../pjmedia/src/test/vid_dev_test.c \
../pjmedia/src/test/vid_port_test.c \
../pjmedia/src/test/wince_main.c \
../pjmedia/src/test/wsola_test.c 

OBJS += \
./pjmedia/src/test/audio_tool.o \
./pjmedia/src/test/codec_vectors.o \
./pjmedia/src/test/jbuf_test.o \
./pjmedia/src/test/main.o \
./pjmedia/src/test/mips_test.o \
./pjmedia/src/test/rtp_test.o \
./pjmedia/src/test/sdp_neg_test.o \
./pjmedia/src/test/sdptest.o \
./pjmedia/src/test/session_test.o \
./pjmedia/src/test/test.o \
./pjmedia/src/test/vid_codec_test.o \
./pjmedia/src/test/vid_dev_test.o \
./pjmedia/src/test/vid_port_test.o \
./pjmedia/src/test/wince_main.o \
./pjmedia/src/test/wsola_test.o 

C_DEPS += \
./pjmedia/src/test/audio_tool.d \
./pjmedia/src/test/codec_vectors.d \
./pjmedia/src/test/jbuf_test.d \
./pjmedia/src/test/main.d \
./pjmedia/src/test/mips_test.d \
./pjmedia/src/test/rtp_test.d \
./pjmedia/src/test/sdp_neg_test.d \
./pjmedia/src/test/sdptest.d \
./pjmedia/src/test/session_test.d \
./pjmedia/src/test/test.d \
./pjmedia/src/test/vid_codec_test.d \
./pjmedia/src/test/vid_dev_test.d \
./pjmedia/src/test/vid_port_test.d \
./pjmedia/src/test/wince_main.d \
./pjmedia/src/test/wsola_test.d 


# Each subdirectory must supply rules for building sources it contributes
pjmedia/src/test/%.o: ../pjmedia/src/test/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


