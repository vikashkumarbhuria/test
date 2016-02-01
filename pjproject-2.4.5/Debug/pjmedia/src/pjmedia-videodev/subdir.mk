################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjmedia/src/pjmedia-videodev/android_dev.c \
../pjmedia/src/pjmedia-videodev/android_opengl.c \
../pjmedia/src/pjmedia-videodev/avi_dev.c \
../pjmedia/src/pjmedia-videodev/colorbar_dev.c \
../pjmedia/src/pjmedia-videodev/dshow_dev.c \
../pjmedia/src/pjmedia-videodev/errno.c \
../pjmedia/src/pjmedia-videodev/ffmpeg_dev.c \
../pjmedia/src/pjmedia-videodev/opengl_dev.c \
../pjmedia/src/pjmedia-videodev/sdl_dev.c \
../pjmedia/src/pjmedia-videodev/util.c \
../pjmedia/src/pjmedia-videodev/v4l2_dev.c \
../pjmedia/src/pjmedia-videodev/videodev.c 

OBJS += \
./pjmedia/src/pjmedia-videodev/android_dev.o \
./pjmedia/src/pjmedia-videodev/android_opengl.o \
./pjmedia/src/pjmedia-videodev/avi_dev.o \
./pjmedia/src/pjmedia-videodev/colorbar_dev.o \
./pjmedia/src/pjmedia-videodev/dshow_dev.o \
./pjmedia/src/pjmedia-videodev/errno.o \
./pjmedia/src/pjmedia-videodev/ffmpeg_dev.o \
./pjmedia/src/pjmedia-videodev/opengl_dev.o \
./pjmedia/src/pjmedia-videodev/sdl_dev.o \
./pjmedia/src/pjmedia-videodev/util.o \
./pjmedia/src/pjmedia-videodev/v4l2_dev.o \
./pjmedia/src/pjmedia-videodev/videodev.o 

C_DEPS += \
./pjmedia/src/pjmedia-videodev/android_dev.d \
./pjmedia/src/pjmedia-videodev/android_opengl.d \
./pjmedia/src/pjmedia-videodev/avi_dev.d \
./pjmedia/src/pjmedia-videodev/colorbar_dev.d \
./pjmedia/src/pjmedia-videodev/dshow_dev.d \
./pjmedia/src/pjmedia-videodev/errno.d \
./pjmedia/src/pjmedia-videodev/ffmpeg_dev.d \
./pjmedia/src/pjmedia-videodev/opengl_dev.d \
./pjmedia/src/pjmedia-videodev/sdl_dev.d \
./pjmedia/src/pjmedia-videodev/util.d \
./pjmedia/src/pjmedia-videodev/v4l2_dev.d \
./pjmedia/src/pjmedia-videodev/videodev.d 


# Each subdirectory must supply rules for building sources it contributes
pjmedia/src/pjmedia-videodev/%.o: ../pjmedia/src/pjmedia-videodev/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


