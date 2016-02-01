#include <pjmedia/mediamngrtimer.h>
//#include <pjmedia/rtp.h>
#include <pjmedia/mediacompressor.h>



#define THIS_FILE "mediamngrtimer.c"

timerInfo *head = NULL;
static comp_uint16_t timerhndlCnt= 1;
comp_uint16_t threadExitStatus = MEDIACOMP_FALSE;


comp_uint16_t createLink(comp_uint8_t *sTimername)
{
	timerInfo *new_timer;
	timerInfo *nxt_node = head;
	new_timer = (timerInfo *)malloc(sizeof(timerInfo));
	if (new_timer == NULL)
	{
      //  PJ_LOG(5, (THIS_FILE, "createLink: memory allocation failed"));
		return 0;
	}
	strcpy(new_timer->timerName,sTimername);
	new_timer->timer_hndl = timerhndlCnt;
	new_timer->next = NULL;
	if (head == NULL)
	{
		head = new_timer;
	}else if (nxt_node->next == NULL){
		head->next = new_timer;
	}else {
	do{
		if (nxt_node->next == NULL){
			nxt_node->next = new_timer;
		}else{
			nxt_node = nxt_node->next;
		}

	}while(nxt_node != NULL);
	}
	timerhndlCnt++;
	PJ_LOG(5,(THIS_FILE,"create a new timer hndl %d", new_timer->timer_hndl));
	return (new_timer->timer_hndl);
}


comp_uint16_t create_timer(char *sTimername)
{
	comp_uint16_t timerHndl;
	timerHndl = createLink((comp_uint8_t *)sTimername);
	//PJ_LOG(5, (THIS_FILE, "create_timer: Timer creation success , hdnlesTimername %u",timerHndl));
	//creattimerhndlCnte a link with the timer name
	return timerHndl;
}


comp_uint16_t timer_start(comp_uint16_t timerHndl, void *funCb , void *cb_param1,void *cb_param2, comp_uint32_t duration)
{
	timerInfo *matchedNode = head;
    PJ_LOG(5, (THIS_FILE, "timer_start : timerhndle %d duration %d", timerHndl, duration));
	if (matchedNode == NULL){
        PJ_LOG(5, (THIS_FILE, "timer_start: No timer is present"));
		return MEDIACOMP_FALSE;
	}else if (matchedNode->next == NULL){
		if (matchedNode->timer_hndl == timerHndl){
		PJ_LOG(5, (THIS_FILE, "timer_start: matching node 1 %p found START TIMER %u ",matchedNode, matchedNode->timer_hndl));
		matchedNode->status = MEDIACOMP_TRUE;
		matchedNode->funCB = funCb;
		matchedNode->duration = duration;
		matchedNode->expiry_time = 0;
		matchedNode->funCB_param1 = cb_param1;
		matchedNode->funCB_param2 = cb_param2;
		}
	}else{
	//for(;matchedNode != NULL && matchedNode->next != NULL; matchedNode = matchedNode->next){
	do{
	if (matchedNode->timer_hndl == timerHndl){
        PJ_LOG(5, (THIS_FILE, "timer_start: matching node %p found START TIMER %u", matchedNode, matchedNode->timer_hndl));
		matchedNode->status = MEDIACOMP_TRUE;
		matchedNode->funCB = funCb;
		matchedNode->duration = duration;
		matchedNode->expiry_time = 0;
		matchedNode->funCB_param1 = cb_param1;
		matchedNode->funCB_param2 = cb_param2;
		break;

	}
	if (matchedNode->next != NULL){
		matchedNode = matchedNode->next;
	}else{
		break;
	}

	}while(matchedNode != NULL);
}
	if (matchedNode != NULL && matchedNode->status == MEDIACOMP_FALSE)
	{
        PJ_LOG(5, (THIS_FILE, "timer_start: no matched node found"));
	return MEDIACOMP_FALSE;
	}
	threadExitStatus = MEDIACOMP_TRUE;
	return MEDIACOMP_TRUE;

}


comp_uint16_t timer_stop(comp_uint16_t timerHndl)
{
	timerInfo *matchedNode = head;
	if (matchedNode == NULL){
	//	PJ_LOG(5, (THIS_FILE, "timer_stop: No timer is present"));
		return MEDIACOMP_FALSE;
	}else if(matchedNode->next == NULL){
		if (matchedNode->timer_hndl == timerHndl){
	//	PJ_LOG(5, (THIS_FILE, "timer_stop: matching node found STOP TIMER %u", timerHndl));
		matchedNode->status = MEDIACOMP_FALSE;
		matchedNode->expiry_time = 0;
		}else{
    //        PJ_LOG(5, (THIS_FILE, "timer_stop: no node found"));
        }

	} else{
	do{
		if (matchedNode->timer_hndl == timerHndl){
	//	PJ_LOG(5, (THIS_FILE, "timer_stop: matching node found STOP TIMER %u", timerHndl));
		matchedNode->status = MEDIACOMP_FALSE;
		matchedNode->expiry_time = 0;
		break;
	}
	if(matchedNode->next != NULL){
		matchedNode = matchedNode->next;
	}else{
		break;
	}
	}while(matchedNode != NULL);
	}
	if (matchedNode != NULL && matchedNode->status == MEDIACOMP_TRUE)
	{
   //      PJ_LOG(5, (THIS_FILE, "timer_stop: no matched node found"));
	return MEDIACOMP_FALSE;
	}
	return MEDIACOMP_TRUE;
}

comp_uint16_t timer_destroy(comp_uint16_t timerHndl)
{
	timerInfo *matchedNode = head;
	timerInfo *prevNode = head;
	PJ_LOG(5,(THIS_FILE,"destroy all the timer"));
	while(matchedNode != NULL){
		matchedNode = matchedNode->next;
		free(prevNode);
		prevNode = NULL;
		prevNode = matchedNode;
	}
	head = NULL;
	threadExitStatus = MEDIACOMP_FALSE;
#if 0
	if (matchedNode == NULL){
		timerhndlCnt = 1;
    //    PJ_LOG(5, (THIS_FILE, "timer_destory: No timer is present"));
		return MEDIACOMP_FALSE;
	}else if (matchedNode->timer_hndl == timerHndl && matchedNode->next == NULL){
   //     PJ_LOG(5, (THIS_FILE, "timer_destory: first node matched DESTROY TIMER %u", timerHndl));
		if (matchedNode->next == NULL){
			free(matchedNode);
			head = NULL;
			timerhndlCnt = 1;
		}
	}else{
	do{
	if (matchedNode->timer_hndl == timerHndl){
    //    PJ_LOG(5, (THIS_FILE, "timer_destory: matching node found DESTORY TIMER %u", timerHndl));
		if (matchedNode == head){
			head = matchedNode->next;
		}else{
			prevNode->next = matchedNode->next;
		}
		free(matchedNode);
		matchedNode = NULL;
		break;
	}
	if(matchedNode->next != NULL){
		prevNode=matchedNode;
		matchedNode = matchedNode->next;
	}else{
    //    PJ_LOG(5, (THIS_FILE, "timer_destory: no node found"));
		break;
	}
	}while(matchedNode != NULL);
	}
#endif
	return MEDIACOMP_TRUE;
}


void check_expire_timer()
{
	timerInfo *findNode = head;
    PJ_LOG(5, (THIS_FILE, "check_expire_timer: time of 1 sec expired"));
	if(findNode == NULL){
        PJ_LOG(5, (THIS_FILE, "check_expire_timer: No node is present"));

	}else if(findNode->next == NULL){
		findNode->expiry_time++;
	if (findNode->expiry_time == findNode->duration){
		PJ_LOG(5, (THIS_FILE, "check_expire_timer:match timer [%p] abt to expire hndle %d status %d BEFORE",findNode,findNode->timer_hndl,findNode->status));
		if (findNode->status == MEDIACOMP_TRUE){
			PJ_LOG(5, (THIS_FILE, "check_expire_timer:match timer [%p] abt to expire hndle %d AFTER",findNode,findNode->timer_hndl));
			findNode->expiry_time =0;
			findNode->status = MEDIACOMP_FALSE;
			findNode->funCB(findNode->funCB_param1,findNode->funCB_param2);

			//timer_stop(findNode->timer_hndl);
			//timer_destroy(findNode->timer_hndl);

		}
	}
	}else{
	do
	{
	findNode->expiry_time++;
	if (findNode->expiry_time == findNode->duration){
	    PJ_LOG(5, (THIS_FILE, "check_expire_timer 2:match timer [%p] abt  to expire hndle %d",findNode, findNode->timer_hndl));
		if(findNode->status == MEDIACOMP_TRUE){
			findNode->expiry_time =0;
			findNode->status = MEDIACOMP_FALSE;
			findNode->funCB(findNode->funCB_param1,findNode->funCB_param2);
	//	timer_stop(findNode->timer_hndl);
		//timer_destroy(findNode->timer_hndl);
		}
	}
	if(findNode->next != NULL){
		findNode = findNode->next;
	}else{
		break;
	}
	}while(findNode != NULL);
	}
}

void *timer(comp_uint16_t timerStatus)
{
	static comp_uint8_t onThreadCreation = MEDIACOMP_TRUE;
	if (onThreadCreation){
		pj_thread_desc desc;
		pj_thread_t *this_thread;
		TransportRtnType rc;
		pj_bzero(desc, sizeof(desc));
		rc = pj_thread_register("thread", desc, &this_thread);
		if (rc != MEDIACOMP_SUCCESS) {
		PJ_LOG(5,(THIS_FILE,"Erorr:pj_thread_register failed %d", rc));
		}
	}
	if(timerStatus)
		threadExitStatus = MEDIACOMP_TRUE;

	PJ_LOG(5,(THIS_FILE,"threadExitStatus %d",threadExitStatus));
	while(threadExitStatus){
	//PJ_LOG(5,(THIS_FILE,"Thread is running, abot to sleep for 1 sec"));
	pj_thread_sleep(1000);
	PJ_LOG(5,(THIS_FILE,"wake up from sleep after 1 sec"));
	check_expire_timer();
	}
	threadExitStatus = MEDIACOMP_FALSE;
	PJ_LOG(5,(THIS_FILE,"timer thread exitiing"));
#if 0
	static struct timeval  end;
	struct timeval start;

	long mtime, seconds, useconds;
	//int index =0;
	//gettimeofday(&start, NULL);
	sleep(1);

	gettimeofday(&end, NULL);
		seconds  = end.tv_sec  - start.tv_sec;
	useconds = end.tv_usec - start.tv_usec;
	mtime = ((seconds) * 1000 + useconds/1000.0);
	//PJ_LOG(5, (THIS_FILE, "timer: second %ld Elapsed time: %ld milliseconds\n",seconds, mtime));
#endif
	//check_expire_timer();
	//seconds  = end.tv_sec  - start.tv_sec;
	//useconds = end.tv_usec - start.tv_usec;

	//mtime = ((seconds) * 1000 + useconds/1000.0);

	//printf("second %ld Elapsed time: %ld milliseconds\n",seconds, mtime);
//	timer_destory(0);
	//timer_destory(1);
	// return 0;
}

