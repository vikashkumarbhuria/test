################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjsip/src/test/dlg_core_test.c \
../pjsip/src/test/dns_test.c \
../pjsip/src/test/inv_offer_answer_test.c \
../pjsip/src/test/main.c \
../pjsip/src/test/main_rtems.c \
../pjsip/src/test/main_win32.c \
../pjsip/src/test/msg_err_test.c \
../pjsip/src/test/msg_logger.c \
../pjsip/src/test/msg_test.c \
../pjsip/src/test/multipart_test.c \
../pjsip/src/test/regc_test.c \
../pjsip/src/test/test.c \
../pjsip/src/test/transport_loop_test.c \
../pjsip/src/test/transport_tcp_test.c \
../pjsip/src/test/transport_test.c \
../pjsip/src/test/transport_udp_test.c \
../pjsip/src/test/tsx_basic_test.c \
../pjsip/src/test/tsx_bench.c \
../pjsip/src/test/tsx_uac_test.c \
../pjsip/src/test/tsx_uas_test.c \
../pjsip/src/test/txdata_test.c \
../pjsip/src/test/uri_test.c 

OBJS += \
./pjsip/src/test/dlg_core_test.o \
./pjsip/src/test/dns_test.o \
./pjsip/src/test/inv_offer_answer_test.o \
./pjsip/src/test/main.o \
./pjsip/src/test/main_rtems.o \
./pjsip/src/test/main_win32.o \
./pjsip/src/test/msg_err_test.o \
./pjsip/src/test/msg_logger.o \
./pjsip/src/test/msg_test.o \
./pjsip/src/test/multipart_test.o \
./pjsip/src/test/regc_test.o \
./pjsip/src/test/test.o \
./pjsip/src/test/transport_loop_test.o \
./pjsip/src/test/transport_tcp_test.o \
./pjsip/src/test/transport_test.o \
./pjsip/src/test/transport_udp_test.o \
./pjsip/src/test/tsx_basic_test.o \
./pjsip/src/test/tsx_bench.o \
./pjsip/src/test/tsx_uac_test.o \
./pjsip/src/test/tsx_uas_test.o \
./pjsip/src/test/txdata_test.o \
./pjsip/src/test/uri_test.o 

C_DEPS += \
./pjsip/src/test/dlg_core_test.d \
./pjsip/src/test/dns_test.d \
./pjsip/src/test/inv_offer_answer_test.d \
./pjsip/src/test/main.d \
./pjsip/src/test/main_rtems.d \
./pjsip/src/test/main_win32.d \
./pjsip/src/test/msg_err_test.d \
./pjsip/src/test/msg_logger.d \
./pjsip/src/test/msg_test.d \
./pjsip/src/test/multipart_test.d \
./pjsip/src/test/regc_test.d \
./pjsip/src/test/test.d \
./pjsip/src/test/transport_loop_test.d \
./pjsip/src/test/transport_tcp_test.d \
./pjsip/src/test/transport_test.d \
./pjsip/src/test/transport_udp_test.d \
./pjsip/src/test/tsx_basic_test.d \
./pjsip/src/test/tsx_bench.d \
./pjsip/src/test/tsx_uac_test.d \
./pjsip/src/test/tsx_uas_test.d \
./pjsip/src/test/txdata_test.d \
./pjsip/src/test/uri_test.d 


# Each subdirectory must supply rules for building sources it contributes
pjsip/src/test/%.o: ../pjsip/src/test/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


