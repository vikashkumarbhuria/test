################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjsip/src/pjsip/sip_auth_aka.c \
../pjsip/src/pjsip/sip_auth_client.c \
../pjsip/src/pjsip/sip_auth_msg.c \
../pjsip/src/pjsip/sip_auth_parser.c \
../pjsip/src/pjsip/sip_auth_server.c \
../pjsip/src/pjsip/sip_config.c \
../pjsip/src/pjsip/sip_dialog.c \
../pjsip/src/pjsip/sip_endpoint.c \
../pjsip/src/pjsip/sip_errno.c \
../pjsip/src/pjsip/sip_msg.c \
../pjsip/src/pjsip/sip_multipart.c \
../pjsip/src/pjsip/sip_parser.c \
../pjsip/src/pjsip/sip_resolve.c \
../pjsip/src/pjsip/sip_tel_uri.c \
../pjsip/src/pjsip/sip_transaction.c \
../pjsip/src/pjsip/sip_transport.c \
../pjsip/src/pjsip/sip_transport_loop.c \
../pjsip/src/pjsip/sip_transport_tcp.c \
../pjsip/src/pjsip/sip_transport_tls.c \
../pjsip/src/pjsip/sip_transport_udp.c \
../pjsip/src/pjsip/sip_ua_layer.c \
../pjsip/src/pjsip/sip_uri.c \
../pjsip/src/pjsip/sip_util.c \
../pjsip/src/pjsip/sip_util_proxy.c \
../pjsip/src/pjsip/sip_util_statefull.c 

OBJS += \
./pjsip/src/pjsip/sip_auth_aka.o \
./pjsip/src/pjsip/sip_auth_client.o \
./pjsip/src/pjsip/sip_auth_msg.o \
./pjsip/src/pjsip/sip_auth_parser.o \
./pjsip/src/pjsip/sip_auth_server.o \
./pjsip/src/pjsip/sip_config.o \
./pjsip/src/pjsip/sip_dialog.o \
./pjsip/src/pjsip/sip_endpoint.o \
./pjsip/src/pjsip/sip_errno.o \
./pjsip/src/pjsip/sip_msg.o \
./pjsip/src/pjsip/sip_multipart.o \
./pjsip/src/pjsip/sip_parser.o \
./pjsip/src/pjsip/sip_resolve.o \
./pjsip/src/pjsip/sip_tel_uri.o \
./pjsip/src/pjsip/sip_transaction.o \
./pjsip/src/pjsip/sip_transport.o \
./pjsip/src/pjsip/sip_transport_loop.o \
./pjsip/src/pjsip/sip_transport_tcp.o \
./pjsip/src/pjsip/sip_transport_tls.o \
./pjsip/src/pjsip/sip_transport_udp.o \
./pjsip/src/pjsip/sip_ua_layer.o \
./pjsip/src/pjsip/sip_uri.o \
./pjsip/src/pjsip/sip_util.o \
./pjsip/src/pjsip/sip_util_proxy.o \
./pjsip/src/pjsip/sip_util_statefull.o 

C_DEPS += \
./pjsip/src/pjsip/sip_auth_aka.d \
./pjsip/src/pjsip/sip_auth_client.d \
./pjsip/src/pjsip/sip_auth_msg.d \
./pjsip/src/pjsip/sip_auth_parser.d \
./pjsip/src/pjsip/sip_auth_server.d \
./pjsip/src/pjsip/sip_config.d \
./pjsip/src/pjsip/sip_dialog.d \
./pjsip/src/pjsip/sip_endpoint.d \
./pjsip/src/pjsip/sip_errno.d \
./pjsip/src/pjsip/sip_msg.d \
./pjsip/src/pjsip/sip_multipart.d \
./pjsip/src/pjsip/sip_parser.d \
./pjsip/src/pjsip/sip_resolve.d \
./pjsip/src/pjsip/sip_tel_uri.d \
./pjsip/src/pjsip/sip_transaction.d \
./pjsip/src/pjsip/sip_transport.d \
./pjsip/src/pjsip/sip_transport_loop.d \
./pjsip/src/pjsip/sip_transport_tcp.d \
./pjsip/src/pjsip/sip_transport_tls.d \
./pjsip/src/pjsip/sip_transport_udp.d \
./pjsip/src/pjsip/sip_ua_layer.d \
./pjsip/src/pjsip/sip_uri.d \
./pjsip/src/pjsip/sip_util.d \
./pjsip/src/pjsip/sip_util_proxy.d \
./pjsip/src/pjsip/sip_util_statefull.d 


# Each subdirectory must supply rules for building sources it contributes
pjsip/src/pjsip/%.o: ../pjsip/src/pjsip/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


