#ifndef __MEDIAMNGR_TIMER_H__
#define __MEDIAMNGR_TIMER_H__

#include <sys/time.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include "mediacompressor.h"
#include <pjlib.h>

typedef void (*fun_callback)();

typedef struct timer_info
{
	comp_uint16_t status;
	comp_uint32_t duration;
	comp_uint32_t expiry_time;
	comp_uint8_t timerName[256];
	comp_uint16_t timer_hndl;
	fun_callback funCB;
	void *funCB_param1;
	void *funCB_param2;
	struct timer_info *next;
}timerInfo;


comp_uint16_t createLink(comp_uint8_t *sTimername);
comp_uint16_t create_timer(char *sTimername);

comp_uint16_t timer_start(comp_uint16_t timerHndl, void *funCb , void *cb_param1,void *cb_param2, comp_uint32_t duration);

comp_uint16_t timer_stop(comp_uint16_t timerHndl);

comp_uint16_t timer_destroy(comp_uint16_t timerHndl);

void check_expire_timer();


void *timer(comp_uint16_t timerStatus);

#endif
