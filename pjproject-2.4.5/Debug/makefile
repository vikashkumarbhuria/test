################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include third_party/srtp/test/subdir.mk
-include third_party/srtp/tables/subdir.mk
-include third_party/srtp/srtp/subdir.mk
-include third_party/srtp/pjlib/subdir.mk
-include third_party/srtp/crypto/test/subdir.mk
-include third_party/srtp/crypto/rng/subdir.mk
-include third_party/srtp/crypto/replay/subdir.mk
-include third_party/srtp/crypto/math/subdir.mk
-include third_party/srtp/crypto/kernel/subdir.mk
-include third_party/srtp/crypto/hash/subdir.mk
-include third_party/srtp/crypto/cipher/subdir.mk
-include third_party/srtp/crypto/ae_xfm/subdir.mk
-include third_party/speex/libspeex/subdir.mk
-include third_party/resample/src/subdir.mk
-include third_party/portaudio/src/os/win/subdir.mk
-include third_party/portaudio/src/os/unix/subdir.mk
-include third_party/portaudio/src/hostapi/wmme/subdir.mk
-include third_party/portaudio/src/hostapi/wdmks/subdir.mk
-include third_party/portaudio/src/hostapi/oss/subdir.mk
-include third_party/portaudio/src/hostapi/jack/subdir.mk
-include third_party/portaudio/src/hostapi/dsound/subdir.mk
-include third_party/portaudio/src/hostapi/coreaudio/subdir.mk
-include third_party/portaudio/src/hostapi/asihpi/subdir.mk
-include third_party/portaudio/src/hostapi/alsa/subdir.mk
-include third_party/portaudio/src/common/subdir.mk
-include third_party/portaudio/pablio/subdir.mk
-include third_party/mp3/subdir.mk
-include third_party/milenage/subdir.mk
-include third_party/ilbc/subdir.mk
-include third_party/gsm/tst/subdir.mk
-include third_party/gsm/tls/subdir.mk
-include third_party/gsm/src/subdir.mk
-include third_party/gsm/add-test/subdir.mk
-include third_party/g7221/encode/subdir.mk
-include third_party/g7221/decode/subdir.mk
-include third_party/g7221/common/subdir.mk
-include third_party/build/portaudio/src/subdir.mk
-include tests/pjsua/tools/subdir.mk
-include pjsip/src/test/subdir.mk
-include pjsip/src/pjsua-lib/subdir.mk
-include pjsip/src/pjsip-ua/subdir.mk
-include pjsip/src/pjsip-simple/subdir.mk
-include pjsip/src/pjsip/subdir.mk
-include pjsip-apps/src/swig/python/subdir.mk
-include pjsip-apps/src/samples/subdir.mk
-include pjsip-apps/src/python/subdir.mk
-include pjsip-apps/src/py_pjsua/subdir.mk
-include pjsip-apps/src/pjsystest/subdir.mk
-include pjsip-apps/src/pjsua/wm/subdir.mk
-include pjsip-apps/src/pjsua/subdir.mk
-include pjsip-apps/src/3rdparty_media_sample/subdir.mk
-include pjsip-apps/build/subdir.mk
-include pjnath/src/pjturn-srv/subdir.mk
-include pjnath/src/pjturn-client/subdir.mk
-include pjnath/src/pjnath-test/subdir.mk
-include pjnath/src/pjnath/subdir.mk
-include pjmedia/src/test/subdir.mk
-include pjmedia/src/pjmedia-videodev/subdir.mk
-include pjmedia/src/pjmedia-codec/g722/subdir.mk
-include pjmedia/src/pjmedia-codec/subdir.mk
-include pjmedia/src/pjmedia-audiodev/subdir.mk
-include pjmedia/src/pjmedia/subdir.mk
-include pjlib/src/pjlib-test/subdir.mk
-include pjlib/src/pjlib-samples/subdir.mk
-include pjlib/src/pj/compat/subdir.mk
-include pjlib/src/pj/subdir.mk
-include pjlib-util/src/pjlib-util-test/subdir.mk
-include pjlib-util/src/pjlib-util/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: pjsip_compress

# Tool invocations
pjsip_compress: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GCC C Linker'
	gcc  -o "pjsip_compress" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES) pjsip_compress
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
