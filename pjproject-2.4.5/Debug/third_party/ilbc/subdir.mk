################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../third_party/ilbc/FrameClassify.c \
../third_party/ilbc/LPCdecode.c \
../third_party/ilbc/LPCencode.c \
../third_party/ilbc/StateConstructW.c \
../third_party/ilbc/StateSearchW.c \
../third_party/ilbc/anaFilter.c \
../third_party/ilbc/constants.c \
../third_party/ilbc/createCB.c \
../third_party/ilbc/doCPLC.c \
../third_party/ilbc/enhancer.c \
../third_party/ilbc/filter.c \
../third_party/ilbc/gainquant.c \
../third_party/ilbc/getCBvec.c \
../third_party/ilbc/helpfun.c \
../third_party/ilbc/hpInput.c \
../third_party/ilbc/hpOutput.c \
../third_party/ilbc/iCBConstruct.c \
../third_party/ilbc/iCBSearch.c \
../third_party/ilbc/iLBC_decode.c \
../third_party/ilbc/iLBC_encode.c \
../third_party/ilbc/iLBC_test.c \
../third_party/ilbc/lsf.c \
../third_party/ilbc/packing.c \
../third_party/ilbc/syntFilter.c 

OBJS += \
./third_party/ilbc/FrameClassify.o \
./third_party/ilbc/LPCdecode.o \
./third_party/ilbc/LPCencode.o \
./third_party/ilbc/StateConstructW.o \
./third_party/ilbc/StateSearchW.o \
./third_party/ilbc/anaFilter.o \
./third_party/ilbc/constants.o \
./third_party/ilbc/createCB.o \
./third_party/ilbc/doCPLC.o \
./third_party/ilbc/enhancer.o \
./third_party/ilbc/filter.o \
./third_party/ilbc/gainquant.o \
./third_party/ilbc/getCBvec.o \
./third_party/ilbc/helpfun.o \
./third_party/ilbc/hpInput.o \
./third_party/ilbc/hpOutput.o \
./third_party/ilbc/iCBConstruct.o \
./third_party/ilbc/iCBSearch.o \
./third_party/ilbc/iLBC_decode.o \
./third_party/ilbc/iLBC_encode.o \
./third_party/ilbc/iLBC_test.o \
./third_party/ilbc/lsf.o \
./third_party/ilbc/packing.o \
./third_party/ilbc/syntFilter.o 

C_DEPS += \
./third_party/ilbc/FrameClassify.d \
./third_party/ilbc/LPCdecode.d \
./third_party/ilbc/LPCencode.d \
./third_party/ilbc/StateConstructW.d \
./third_party/ilbc/StateSearchW.d \
./third_party/ilbc/anaFilter.d \
./third_party/ilbc/constants.d \
./third_party/ilbc/createCB.d \
./third_party/ilbc/doCPLC.d \
./third_party/ilbc/enhancer.d \
./third_party/ilbc/filter.d \
./third_party/ilbc/gainquant.d \
./third_party/ilbc/getCBvec.d \
./third_party/ilbc/helpfun.d \
./third_party/ilbc/hpInput.d \
./third_party/ilbc/hpOutput.d \
./third_party/ilbc/iCBConstruct.d \
./third_party/ilbc/iCBSearch.d \
./third_party/ilbc/iLBC_decode.d \
./third_party/ilbc/iLBC_encode.d \
./third_party/ilbc/iLBC_test.d \
./third_party/ilbc/lsf.d \
./third_party/ilbc/packing.d \
./third_party/ilbc/syntFilter.d 


# Each subdirectory must supply rules for building sources it contributes
third_party/ilbc/%.o: ../third_party/ilbc/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


