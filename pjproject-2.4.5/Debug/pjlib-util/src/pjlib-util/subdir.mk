################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../pjlib-util/src/pjlib-util/base64.c \
../pjlib-util/src/pjlib-util/cli.c \
../pjlib-util/src/pjlib-util/cli_console.c \
../pjlib-util/src/pjlib-util/cli_telnet.c \
../pjlib-util/src/pjlib-util/crc32.c \
../pjlib-util/src/pjlib-util/dns.c \
../pjlib-util/src/pjlib-util/dns_dump.c \
../pjlib-util/src/pjlib-util/dns_server.c \
../pjlib-util/src/pjlib-util/errno.c \
../pjlib-util/src/pjlib-util/getopt.c \
../pjlib-util/src/pjlib-util/hmac_md5.c \
../pjlib-util/src/pjlib-util/hmac_sha1.c \
../pjlib-util/src/pjlib-util/http_client.c \
../pjlib-util/src/pjlib-util/json.c \
../pjlib-util/src/pjlib-util/md5.c \
../pjlib-util/src/pjlib-util/pcap.c \
../pjlib-util/src/pjlib-util/resolver.c \
../pjlib-util/src/pjlib-util/scanner.c \
../pjlib-util/src/pjlib-util/scanner_cis_bitwise.c \
../pjlib-util/src/pjlib-util/scanner_cis_uint.c \
../pjlib-util/src/pjlib-util/sha1.c \
../pjlib-util/src/pjlib-util/srv_resolver.c \
../pjlib-util/src/pjlib-util/string.c \
../pjlib-util/src/pjlib-util/stun_simple.c \
../pjlib-util/src/pjlib-util/stun_simple_client.c \
../pjlib-util/src/pjlib-util/symbols.c \
../pjlib-util/src/pjlib-util/xml.c 

OBJS += \
./pjlib-util/src/pjlib-util/base64.o \
./pjlib-util/src/pjlib-util/cli.o \
./pjlib-util/src/pjlib-util/cli_console.o \
./pjlib-util/src/pjlib-util/cli_telnet.o \
./pjlib-util/src/pjlib-util/crc32.o \
./pjlib-util/src/pjlib-util/dns.o \
./pjlib-util/src/pjlib-util/dns_dump.o \
./pjlib-util/src/pjlib-util/dns_server.o \
./pjlib-util/src/pjlib-util/errno.o \
./pjlib-util/src/pjlib-util/getopt.o \
./pjlib-util/src/pjlib-util/hmac_md5.o \
./pjlib-util/src/pjlib-util/hmac_sha1.o \
./pjlib-util/src/pjlib-util/http_client.o \
./pjlib-util/src/pjlib-util/json.o \
./pjlib-util/src/pjlib-util/md5.o \
./pjlib-util/src/pjlib-util/pcap.o \
./pjlib-util/src/pjlib-util/resolver.o \
./pjlib-util/src/pjlib-util/scanner.o \
./pjlib-util/src/pjlib-util/scanner_cis_bitwise.o \
./pjlib-util/src/pjlib-util/scanner_cis_uint.o \
./pjlib-util/src/pjlib-util/sha1.o \
./pjlib-util/src/pjlib-util/srv_resolver.o \
./pjlib-util/src/pjlib-util/string.o \
./pjlib-util/src/pjlib-util/stun_simple.o \
./pjlib-util/src/pjlib-util/stun_simple_client.o \
./pjlib-util/src/pjlib-util/symbols.o \
./pjlib-util/src/pjlib-util/xml.o 

C_DEPS += \
./pjlib-util/src/pjlib-util/base64.d \
./pjlib-util/src/pjlib-util/cli.d \
./pjlib-util/src/pjlib-util/cli_console.d \
./pjlib-util/src/pjlib-util/cli_telnet.d \
./pjlib-util/src/pjlib-util/crc32.d \
./pjlib-util/src/pjlib-util/dns.d \
./pjlib-util/src/pjlib-util/dns_dump.d \
./pjlib-util/src/pjlib-util/dns_server.d \
./pjlib-util/src/pjlib-util/errno.d \
./pjlib-util/src/pjlib-util/getopt.d \
./pjlib-util/src/pjlib-util/hmac_md5.d \
./pjlib-util/src/pjlib-util/hmac_sha1.d \
./pjlib-util/src/pjlib-util/http_client.d \
./pjlib-util/src/pjlib-util/json.d \
./pjlib-util/src/pjlib-util/md5.d \
./pjlib-util/src/pjlib-util/pcap.d \
./pjlib-util/src/pjlib-util/resolver.d \
./pjlib-util/src/pjlib-util/scanner.d \
./pjlib-util/src/pjlib-util/scanner_cis_bitwise.d \
./pjlib-util/src/pjlib-util/scanner_cis_uint.d \
./pjlib-util/src/pjlib-util/sha1.d \
./pjlib-util/src/pjlib-util/srv_resolver.d \
./pjlib-util/src/pjlib-util/string.d \
./pjlib-util/src/pjlib-util/stun_simple.d \
./pjlib-util/src/pjlib-util/stun_simple_client.d \
./pjlib-util/src/pjlib-util/symbols.d \
./pjlib-util/src/pjlib-util/xml.d 


# Each subdirectory must supply rules for building sources it contributes
pjlib-util/src/pjlib-util/%.o: ../pjlib-util/src/pjlib-util/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


