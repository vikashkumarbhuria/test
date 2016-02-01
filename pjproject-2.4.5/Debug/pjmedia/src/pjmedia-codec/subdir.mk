################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjmedia/src/pjmedia-codec/amr_sdp_match.c \
../pjmedia/src/pjmedia-codec/audio_codecs.c \
../pjmedia/src/pjmedia-codec/ffmpeg_vid_codecs.c \
../pjmedia/src/pjmedia-codec/g722.c \
../pjmedia/src/pjmedia-codec/g7221.c \
../pjmedia/src/pjmedia-codec/g7221_sdp_match.c \
../pjmedia/src/pjmedia-codec/gsm.c \
../pjmedia/src/pjmedia-codec/h263_packetizer.c \
../pjmedia/src/pjmedia-codec/h264_packetizer.c \
../pjmedia/src/pjmedia-codec/ilbc.c \
../pjmedia/src/pjmedia-codec/ipp_codecs.c \
../pjmedia/src/pjmedia-codec/l16.c \
../pjmedia/src/pjmedia-codec/opencore_amr.c \
../pjmedia/src/pjmedia-codec/passthrough.c \
../pjmedia/src/pjmedia-codec/silk.c \
../pjmedia/src/pjmedia-codec/speex_codec.c 

OBJS += \
./pjmedia/src/pjmedia-codec/amr_sdp_match.o \
./pjmedia/src/pjmedia-codec/audio_codecs.o \
./pjmedia/src/pjmedia-codec/ffmpeg_vid_codecs.o \
./pjmedia/src/pjmedia-codec/g722.o \
./pjmedia/src/pjmedia-codec/g7221.o \
./pjmedia/src/pjmedia-codec/g7221_sdp_match.o \
./pjmedia/src/pjmedia-codec/gsm.o \
./pjmedia/src/pjmedia-codec/h263_packetizer.o \
./pjmedia/src/pjmedia-codec/h264_packetizer.o \
./pjmedia/src/pjmedia-codec/ilbc.o \
./pjmedia/src/pjmedia-codec/ipp_codecs.o \
./pjmedia/src/pjmedia-codec/l16.o \
./pjmedia/src/pjmedia-codec/opencore_amr.o \
./pjmedia/src/pjmedia-codec/passthrough.o \
./pjmedia/src/pjmedia-codec/silk.o \
./pjmedia/src/pjmedia-codec/speex_codec.o 

C_DEPS += \
./pjmedia/src/pjmedia-codec/amr_sdp_match.d \
./pjmedia/src/pjmedia-codec/audio_codecs.d \
./pjmedia/src/pjmedia-codec/ffmpeg_vid_codecs.d \
./pjmedia/src/pjmedia-codec/g722.d \
./pjmedia/src/pjmedia-codec/g7221.d \
./pjmedia/src/pjmedia-codec/g7221_sdp_match.d \
./pjmedia/src/pjmedia-codec/gsm.d \
./pjmedia/src/pjmedia-codec/h263_packetizer.d \
./pjmedia/src/pjmedia-codec/h264_packetizer.d \
./pjmedia/src/pjmedia-codec/ilbc.d \
./pjmedia/src/pjmedia-codec/ipp_codecs.d \
./pjmedia/src/pjmedia-codec/l16.d \
./pjmedia/src/pjmedia-codec/opencore_amr.d \
./pjmedia/src/pjmedia-codec/passthrough.d \
./pjmedia/src/pjmedia-codec/silk.d \
./pjmedia/src/pjmedia-codec/speex_codec.d 


# Each subdirectory must supply rules for building sources it contributes
pjmedia/src/pjmedia-codec/%.o: ../pjmedia/src/pjmedia-codec/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


