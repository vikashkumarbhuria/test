################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjmedia/src/pjmedia/alaw_ulaw.c \
../pjmedia/src/pjmedia/alaw_ulaw_table.c \
../pjmedia/src/pjmedia/avi_player.c \
../pjmedia/src/pjmedia/bidirectional.c \
../pjmedia/src/pjmedia/clock_thread.c \
../pjmedia/src/pjmedia/codec.c \
../pjmedia/src/pjmedia/conf_switch.c \
../pjmedia/src/pjmedia/conference.c \
../pjmedia/src/pjmedia/converter.c \
../pjmedia/src/pjmedia/converter_libswscale.c \
../pjmedia/src/pjmedia/converter_libyuv.c \
../pjmedia/src/pjmedia/delaybuf.c \
../pjmedia/src/pjmedia/dummy.c \
../pjmedia/src/pjmedia/echo_common.c \
../pjmedia/src/pjmedia/echo_port.c \
../pjmedia/src/pjmedia/echo_speex.c \
../pjmedia/src/pjmedia/echo_suppress.c \
../pjmedia/src/pjmedia/endpoint.c \
../pjmedia/src/pjmedia/errno.c \
../pjmedia/src/pjmedia/event.c \
../pjmedia/src/pjmedia/ffmpeg_util.c \
../pjmedia/src/pjmedia/format.c \
../pjmedia/src/pjmedia/g711.c \
../pjmedia/src/pjmedia/jbuf.c \
../pjmedia/src/pjmedia/master_port.c \
../pjmedia/src/pjmedia/mediacompressor.c \
../pjmedia/src/pjmedia/mediamngrtimer.c \
../pjmedia/src/pjmedia/mem_capture.c \
../pjmedia/src/pjmedia/mem_player.c \
../pjmedia/src/pjmedia/null_port.c \
../pjmedia/src/pjmedia/plc_common.c \
../pjmedia/src/pjmedia/port.c \
../pjmedia/src/pjmedia/resample_libsamplerate.c \
../pjmedia/src/pjmedia/resample_port.c \
../pjmedia/src/pjmedia/resample_resample.c \
../pjmedia/src/pjmedia/resample_speex.c \
../pjmedia/src/pjmedia/rtcp.c \
../pjmedia/src/pjmedia/rtcp_xr.c \
../pjmedia/src/pjmedia/rtp.c \
../pjmedia/src/pjmedia/rtphndlr.c \
../pjmedia/src/pjmedia/sdp.c \
../pjmedia/src/pjmedia/sdp_cmp.c \
../pjmedia/src/pjmedia/sdp_neg.c \
../pjmedia/src/pjmedia/session.c \
../pjmedia/src/pjmedia/silencedet.c \
../pjmedia/src/pjmedia/sound_legacy.c \
../pjmedia/src/pjmedia/sound_port.c \
../pjmedia/src/pjmedia/splitcomb.c \
../pjmedia/src/pjmedia/stereo_port.c \
../pjmedia/src/pjmedia/stream.c \
../pjmedia/src/pjmedia/stream_common.c \
../pjmedia/src/pjmedia/stream_info.c \
../pjmedia/src/pjmedia/tonegen.c \
../pjmedia/src/pjmedia/transport_adapter_sample.c \
../pjmedia/src/pjmedia/transport_ice.c \
../pjmedia/src/pjmedia/transport_loop.c \
../pjmedia/src/pjmedia/transport_srtp.c \
../pjmedia/src/pjmedia/transport_udp.c \
../pjmedia/src/pjmedia/types.c \
../pjmedia/src/pjmedia/vid_codec.c \
../pjmedia/src/pjmedia/vid_codec_util.c \
../pjmedia/src/pjmedia/vid_port.c \
../pjmedia/src/pjmedia/vid_stream.c \
../pjmedia/src/pjmedia/vid_stream_info.c \
../pjmedia/src/pjmedia/vid_tee.c \
../pjmedia/src/pjmedia/wav_player.c \
../pjmedia/src/pjmedia/wav_playlist.c \
../pjmedia/src/pjmedia/wav_writer.c \
../pjmedia/src/pjmedia/wave.c \
../pjmedia/src/pjmedia/wsola.c 

OBJS += \
./pjmedia/src/pjmedia/alaw_ulaw.o \
./pjmedia/src/pjmedia/alaw_ulaw_table.o \
./pjmedia/src/pjmedia/avi_player.o \
./pjmedia/src/pjmedia/bidirectional.o \
./pjmedia/src/pjmedia/clock_thread.o \
./pjmedia/src/pjmedia/codec.o \
./pjmedia/src/pjmedia/conf_switch.o \
./pjmedia/src/pjmedia/conference.o \
./pjmedia/src/pjmedia/converter.o \
./pjmedia/src/pjmedia/converter_libswscale.o \
./pjmedia/src/pjmedia/converter_libyuv.o \
./pjmedia/src/pjmedia/delaybuf.o \
./pjmedia/src/pjmedia/dummy.o \
./pjmedia/src/pjmedia/echo_common.o \
./pjmedia/src/pjmedia/echo_port.o \
./pjmedia/src/pjmedia/echo_speex.o \
./pjmedia/src/pjmedia/echo_suppress.o \
./pjmedia/src/pjmedia/endpoint.o \
./pjmedia/src/pjmedia/errno.o \
./pjmedia/src/pjmedia/event.o \
./pjmedia/src/pjmedia/ffmpeg_util.o \
./pjmedia/src/pjmedia/format.o \
./pjmedia/src/pjmedia/g711.o \
./pjmedia/src/pjmedia/jbuf.o \
./pjmedia/src/pjmedia/master_port.o \
./pjmedia/src/pjmedia/mediacompressor.o \
./pjmedia/src/pjmedia/mediamngrtimer.o \
./pjmedia/src/pjmedia/mem_capture.o \
./pjmedia/src/pjmedia/mem_player.o \
./pjmedia/src/pjmedia/null_port.o \
./pjmedia/src/pjmedia/plc_common.o \
./pjmedia/src/pjmedia/port.o \
./pjmedia/src/pjmedia/resample_libsamplerate.o \
./pjmedia/src/pjmedia/resample_port.o \
./pjmedia/src/pjmedia/resample_resample.o \
./pjmedia/src/pjmedia/resample_speex.o \
./pjmedia/src/pjmedia/rtcp.o \
./pjmedia/src/pjmedia/rtcp_xr.o \
./pjmedia/src/pjmedia/rtp.o \
./pjmedia/src/pjmedia/rtphndlr.o \
./pjmedia/src/pjmedia/sdp.o \
./pjmedia/src/pjmedia/sdp_cmp.o \
./pjmedia/src/pjmedia/sdp_neg.o \
./pjmedia/src/pjmedia/session.o \
./pjmedia/src/pjmedia/silencedet.o \
./pjmedia/src/pjmedia/sound_legacy.o \
./pjmedia/src/pjmedia/sound_port.o \
./pjmedia/src/pjmedia/splitcomb.o \
./pjmedia/src/pjmedia/stereo_port.o \
./pjmedia/src/pjmedia/stream.o \
./pjmedia/src/pjmedia/stream_common.o \
./pjmedia/src/pjmedia/stream_info.o \
./pjmedia/src/pjmedia/tonegen.o \
./pjmedia/src/pjmedia/transport_adapter_sample.o \
./pjmedia/src/pjmedia/transport_ice.o \
./pjmedia/src/pjmedia/transport_loop.o \
./pjmedia/src/pjmedia/transport_srtp.o \
./pjmedia/src/pjmedia/transport_udp.o \
./pjmedia/src/pjmedia/types.o \
./pjmedia/src/pjmedia/vid_codec.o \
./pjmedia/src/pjmedia/vid_codec_util.o \
./pjmedia/src/pjmedia/vid_port.o \
./pjmedia/src/pjmedia/vid_stream.o \
./pjmedia/src/pjmedia/vid_stream_info.o \
./pjmedia/src/pjmedia/vid_tee.o \
./pjmedia/src/pjmedia/wav_player.o \
./pjmedia/src/pjmedia/wav_playlist.o \
./pjmedia/src/pjmedia/wav_writer.o \
./pjmedia/src/pjmedia/wave.o \
./pjmedia/src/pjmedia/wsola.o 

C_DEPS += \
./pjmedia/src/pjmedia/alaw_ulaw.d \
./pjmedia/src/pjmedia/alaw_ulaw_table.d \
./pjmedia/src/pjmedia/avi_player.d \
./pjmedia/src/pjmedia/bidirectional.d \
./pjmedia/src/pjmedia/clock_thread.d \
./pjmedia/src/pjmedia/codec.d \
./pjmedia/src/pjmedia/conf_switch.d \
./pjmedia/src/pjmedia/conference.d \
./pjmedia/src/pjmedia/converter.d \
./pjmedia/src/pjmedia/converter_libswscale.d \
./pjmedia/src/pjmedia/converter_libyuv.d \
./pjmedia/src/pjmedia/delaybuf.d \
./pjmedia/src/pjmedia/dummy.d \
./pjmedia/src/pjmedia/echo_common.d \
./pjmedia/src/pjmedia/echo_port.d \
./pjmedia/src/pjmedia/echo_speex.d \
./pjmedia/src/pjmedia/echo_suppress.d \
./pjmedia/src/pjmedia/endpoint.d \
./pjmedia/src/pjmedia/errno.d \
./pjmedia/src/pjmedia/event.d \
./pjmedia/src/pjmedia/ffmpeg_util.d \
./pjmedia/src/pjmedia/format.d \
./pjmedia/src/pjmedia/g711.d \
./pjmedia/src/pjmedia/jbuf.d \
./pjmedia/src/pjmedia/master_port.d \
./pjmedia/src/pjmedia/mediacompressor.d \
./pjmedia/src/pjmedia/mediamngrtimer.d \
./pjmedia/src/pjmedia/mem_capture.d \
./pjmedia/src/pjmedia/mem_player.d \
./pjmedia/src/pjmedia/null_port.d \
./pjmedia/src/pjmedia/plc_common.d \
./pjmedia/src/pjmedia/port.d \
./pjmedia/src/pjmedia/resample_libsamplerate.d \
./pjmedia/src/pjmedia/resample_port.d \
./pjmedia/src/pjmedia/resample_resample.d \
./pjmedia/src/pjmedia/resample_speex.d \
./pjmedia/src/pjmedia/rtcp.d \
./pjmedia/src/pjmedia/rtcp_xr.d \
./pjmedia/src/pjmedia/rtp.d \
./pjmedia/src/pjmedia/rtphndlr.d \
./pjmedia/src/pjmedia/sdp.d \
./pjmedia/src/pjmedia/sdp_cmp.d \
./pjmedia/src/pjmedia/sdp_neg.d \
./pjmedia/src/pjmedia/session.d \
./pjmedia/src/pjmedia/silencedet.d \
./pjmedia/src/pjmedia/sound_legacy.d \
./pjmedia/src/pjmedia/sound_port.d \
./pjmedia/src/pjmedia/splitcomb.d \
./pjmedia/src/pjmedia/stereo_port.d \
./pjmedia/src/pjmedia/stream.d \
./pjmedia/src/pjmedia/stream_common.d \
./pjmedia/src/pjmedia/stream_info.d \
./pjmedia/src/pjmedia/tonegen.d \
./pjmedia/src/pjmedia/transport_adapter_sample.d \
./pjmedia/src/pjmedia/transport_ice.d \
./pjmedia/src/pjmedia/transport_loop.d \
./pjmedia/src/pjmedia/transport_srtp.d \
./pjmedia/src/pjmedia/transport_udp.d \
./pjmedia/src/pjmedia/types.d \
./pjmedia/src/pjmedia/vid_codec.d \
./pjmedia/src/pjmedia/vid_codec_util.d \
./pjmedia/src/pjmedia/vid_port.d \
./pjmedia/src/pjmedia/vid_stream.d \
./pjmedia/src/pjmedia/vid_stream_info.d \
./pjmedia/src/pjmedia/vid_tee.d \
./pjmedia/src/pjmedia/wav_player.d \
./pjmedia/src/pjmedia/wav_playlist.d \
./pjmedia/src/pjmedia/wav_writer.d \
./pjmedia/src/pjmedia/wave.d \
./pjmedia/src/pjmedia/wsola.d 


# Each subdirectory must supply rules for building sources it contributes
pjmedia/src/pjmedia/%.o: ../pjmedia/src/pjmedia/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


