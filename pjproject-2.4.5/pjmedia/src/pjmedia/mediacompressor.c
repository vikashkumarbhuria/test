#include <pjmedia/mediacompressor.h>
//#include <pjmedia/rtp.h>
#include <pjmedia/rtphndlr.h>
#include <pjmedia/mediamngrtimer.h>


/******************  MACROS *************************************/
#define THIS_FILE "MediaCompressor.c"
#define MAX_IR_PKT_INTERVAL 20
#define F_MAX_PERIOD 64
#define F_MAX_IRREGULAR_PERIOD 32
#define F_MAX_TIME 4
#define FO_PKT_INTERVAL 8

/****************** GLOBALS ***************************/
compCommonInfo *mediaCompSsnInfo = NULL;
comp_uint32_t temp_timestamp ;
#define ASSERT_NULL_CHECK(obj,str) {\
	if (obj == NULL) {\
			PJ_LOG(5, (THIS_FILE, " Reason: %s failed",str));\
			return MEDIACOMP_FAILURE;\
	}\	
}	

#define ASSERT_RETURNTYPE_CHECK(rtnType) {\
if (rtnType  !=MEDIACOMP_SUCCESS)\
{\
	 PJ_LOG(5, (THIS_FILE, "MediaComp_generateRTP: Modecmndhndlr returned failed current Mode [%d] State [%d]",\
			 Comp_Mode, Comp_State));\
	 return MEDIACOMP_FAILURE;\
}else{\
	return MEDIACOMP_SUCCESS;\
}\
}
#define MIN(val1,val2,pkt_period) {\
if(val1 < val2){\
	pkt_period = val1;\
}else{\
	pkt_period = val2;\
}\
}

#define SET_MEDIACOMP_MODE_STATE(mode,state){\
		mediaCompSsnInfo->Comp_Mode = mode; \
		mediaCompSsnInfo->Comp_State = state;\
}
#define SET_MEDIADECOMP_STATE(state){\
		mediaCompSsnInfo->DeComp_State = state;\
}


void  Set_Codec_Parameters( char *name , unsigned clock_rate)
{
	const char *codec_name = (const char *)name;
	switch(clock_rate)
	{
	   case 8000:
	   {
   		   if(!(strcmp(codec_name,"AMR"))){
			   mediaCompSsnInfo->Codec.sampling_rate = 160; }
		   else if(!(strcmp(codec_name,"G729"))){
			   mediaCompSsnInfo->Codec.sampling_rate = 80;}
		}    
		break;
		case 16000: 
		 {
		 	if(!(strcmp(codec_name,"AMR-WB"))){
				mediaCompSsnInfo->Codec.sampling_rate = 320; }
			else if(!(strcmp(codec_name,"speex"))){
				 mediaCompSsnInfo->Codec.sampling_rate = 320;}
		}
		break;
		case 32000:
		default :
		{
			PJ_LOG(5,(THIS_FILE, "Currently not supported codec %s",codec_name));
			      break;
		}
    }
}

void MediaCompSetCmdHndlrInit(compCommonInfo *rtpCompSsn)
{
	/* initialization of the modes and states */
	rtpCompSsn->fptrModeFSM[COMP_FLOW_MODE_UNIDIRECTIONAL]= MediaComp_Mode_U;
	rtpCompSsn->fptrModeFSM[COMP_FLOW_MODE_BIDIRECTIONAL] = MediaComp_Mode_B;
	rtpCompSsn->fptrStateFSM[COMP_STATE_IR] = MediaComp_State_IR;
	rtpCompSsn->fptrStateFSM[COMP_STATE_FO] = MediaComp_State_FO;
	rtpCompSsn->fptrStateFSM[COMP_STATE_SO] = MediaComp_State_SO;
	rtpCompSsn->fptrDLStateFSM[COMP_DECOMP_STATE_NOCONTEXT] =  MediaDeComp_State_NoContext;
	rtpCompSsn->fptrDLStateFSM[COMP_DECOMP_STATE_STATICCONTEXT] = MediaDeComp_State_StaticContext ;
	rtpCompSsn->fptrDLStateFSM[COMP_DECOMP_STATE_FULLCONTEXT] = MediaDeComp_State_FullContext;
    printf(" THIS_FILE ,success Modecmndhndlrinit");
}


//In session define your structure
TransportRtnType MediaComp_DeComp_init( comp_pool_t *pool,compmedia_rtp_session *ses, pjmedia_dir dir)
{
	TransportRtnType  rtnType = MEDIACOMP_SUCCESS;
	if(!mediaCompSsnInfo){
		mediaCompSsnInfo = PJ_POOL_ZALLOC_T(pool,compCommonInfo);
		PJ_ASSERT_RETURN(mediaCompSsnInfo != NULL, PJ_ENOMEM);
		if (mediaCompSsnInfo){
			mediaCompSsnInfo->fbPktInfo.errType = RTP_HDR_NONE;
			mediaCompSsnInfo->Comp_Mode = COMP_FLOW_MODE_NONE;
			mediaCompSsnInfo->Comp_State = COMP_STATE_NONE;
			mediaCompSsnInfo->DeComp_State = COMP_DECOMP_STATE_NONE;
			mediaCompSsnInfo->DLfbPktTyp = COMP_PKT_FB_TYPE_NONE;
			mediaCompSsnInfo->fbPktInfo.fbPktType = COMP_PKT_TYPE_MAX;
			mediaCompSsnInfo->isUModeTimerExpired = 0;
			mediaCompSsnInfo->uModeSOPktPeriod = 1;
			MediaCompSetCmdHndlrInit(mediaCompSsnInfo);
		}
	}
	ses->mediaCompSsn = (void *)PJ_POOL_ZALLOC_T(pool, compmedia_rtpcomp_session);
    PJ_ASSERT_RETURN(ses->mediaCompSsn != NULL, PJ_ENOMEM);
    ses->mediaCompSsn->comp_rtp_hdr =(void *) PJ_POOL_ZALLOC_T(pool, compmedia_rtp_hdr);
    PJ_ASSERT_RETURN(ses->mediaCompSsn->comp_rtp_hdr != NULL, PJ_ENOMEM);
    ses->mediaCompSsn->fbPkt = (void *)PJ_POOL_ZALLOC_T(pool, compmedia_rtp_hdr);
    PJ_ASSERT_RETURN(ses->mediaCompSsn->fbPkt != NULL, PJ_ENOMEM);

	ses->mediaCompSsn->sendFB = MEDIACOMP_FALSE;
	ses->mediaCompSsn->dropkt = MEDIACOMP_FALSE;
	ses->mediaCompSsn->pktSentRecvCnt = 0;
	ses->mediaCompSsn->pktSentRecvStatus = MEDIACOMP_FALSE;
	if(dir==PJMEDIA_DIR_DECODING)
	{
		mediaCompSsnInfo->streamDir = ( mediaCompSsnInfo->streamDir | dir );
		mediaCompSsnInfo->DeComp_State = COMP_DECOMP_STATE_NOCONTEXT;
	}
	if(dir==PJMEDIA_DIR_ENCODING)
	{
		mediaCompSsnInfo->streamDir = ( mediaCompSsnInfo->streamDir | dir );
		mediaCompSsnInfo->Comp_Mode = COMP_FLOW_MODE_UNIDIRECTIONAL;
		mediaCompSsnInfo->Comp_State = COMP_STATE_IR;
	}
    // Call to Initialise Seq and Timestamp Cal
	Seq_Time_Cal_Init_DeInit();
	if(!mediaCompSsnInfo->threadId){
		rtnType = pj_thread_create(pool, "compthread", (pj_thread_proc*)&timer,
		MEDIACOMP_TRUE,
		PJ_THREAD_DEFAULT_STACK_SIZE,
		0,
		&mediaCompSsnInfo->threadId);
		if (rtnType != PJ_SUCCESS) {
			PJ_LOG(5, (THIS_FILE, "TX:ERROR; return code from pthread_create() is %d\n", rtnType));
			 return rtnType;
		}
		PJ_LOG(5,(THIS_FILE," rtnType %d threadID %u process_ID %u",rtnType,mediaCompSsnInfo->threadId, pj_getpid()));
	}


	PJ_LOG(5,(THIS_FILE," success return from init streamDir %u",mediaCompSsnInfo->streamDir));
    return rtnType;
}

void MediaComp_DeComp_deInit()
{
	if(mediaCompSsnInfo != NULL)
	{
		mediaCompSsnInfo = NULL;
		PJ_LOG(5,(THIS_FILE, "CommonssnInfo structure cleared %d", mediaCompSsnInfo));
	}
	timer_destroy(0);
	// Call to Reinitialise Seq and Timestamp Cal
	Seq_Time_Cal_Init_DeInit();
}
TransportRtnType MediaComp_generateRTP(compmedia_rtp_session *ses,
					     int pt, int m,
					     int payload_len, int ts_len,
					     const void **rtphdr, 
					     int *hdrlen)
{
	TransportRtnType  rtnType;
	//update the details in the session context structure.
//	PJ_LOG(5, (THIS_FILE, "ses %p dir %d MediaComp_generateRTP PT [%d]  Marker [%d]",ses,mediaCompSsnInfo->streamDir, pt, m));

	*rtphdr = &(ses->mediaCompSsn->comp_rtp_hdr);
	/* Update timestamp */
	ses->out_hdr.ts = pj_htonl(pj_ntohl(ses->out_hdr.ts)+ts_len);
	/* If payload_len is zero, bail out.
	* This is a clock frame; we're not really transmitting anything.
	*/
	if (payload_len == 0){
		return MEDIACOMP_SUCCESS;
	}

	/* Update session. */
	ses->out_extseq++;
	ses->out_hdr.pt = (comp_uint8_t) ((pt == -1) ? ses->out_pt : pt);
	/* Create outgoing header. */
	ses->out_hdr.m = (comp_uint16_t) m;
	ses->out_hdr.seq = pj_htons( (comp_uint16_t) ses->out_extseq);
	if(!ses->mediaCompSsn->pktSentRecvStatus)
	{
		if(!((ses->out_extseq)%F_MAX_PERIOD))
		{
			SET_MEDIACOMP_MODE_STATE(mediaCompSsnInfo->Comp_Mode,COMP_STATE_IR);
			ses->mediaCompSsn->pktSentRecvStatus = MEDIACOMP_TRUE;
		}
	}
	// Send IR Packet if Max Sequence is reached
	if(ses->out_extseq==0)
		{
		SET_MEDIACOMP_MODE_STATE(mediaCompSsnInfo->Comp_Mode,COMP_STATE_IR);
		}
    // Switch to IR and reset feedback variables If high jump in timestamp due to silence pkt
	if((pj_ntohl(ses->out_hdr.ts) - ses->last_sent_timestamp) > ts_len) {
		//reset ACk and NACK
			mediaCompSsnInfo->DLfbPktTyp = COMP_PKT_FB_TYPE_NONE;
			SET_MEDIACOMP_MODE_STATE(mediaCompSsnInfo->Comp_Mode,COMP_STATE_IR);
		}
	// Make record of last sent timestamp of a payload packet
		ses->last_sent_timestamp = pj_ntohl(ses->out_hdr.ts);

	if (mediaCompSsnInfo->sendFB){
	generateRTPPkt(mediaCompSsnInfo->fbPktInfo.fbPktType,ses,mediaCompSsnInfo,&ses->mediaCompSsn->fdPktLen);
	ses->mediaCompSsn->sendFB = MEDIACOMP_TRUE;
	mediaCompSsnInfo->sendFB =MEDIACOMP_FALSE;
	mediaCompSsnInfo->fbPktInfo.fbPktType = COMP_PKT_TYPE_MAX;
	}
	//ASSERT_NULL_CHECK(rtphdr, "MediaComp: Memory allocation check");
	/*PJ_LOG(5, (THIS_FILE, "MediaComp_generateRTP:calling Modecmndhndlr current Mode [%d] State [%d]",
			mediaCompSsnInfo->Comp_Mode, mediaCompSsnInfo->Comp_State));*/
	rtnType = mediaCompSsnInfo->fptrModeFSM[mediaCompSsnInfo->Comp_Mode](ses,hdrlen);
	PJ_LOG(5, (THIS_FILE, "TX:generateRTP: rtnTyp[%d] hdrlen %d sendFB %d fb type %d",rtnType,*hdrlen,
			mediaCompSsnInfo->sendFB, mediaCompSsnInfo->fbPktInfo.fbPktType));
	return rtnType;
}

void modifyContextOnpktLoss(TransportPktType rtpPktType,errType errStatus){
	PJ_LOG(5, (THIS_FILE, "modifyContextOnpktLoss:pktLoss observed, Modecmndhndlr current Mode [%d] State [%d]",
		       mediaCompSsnInfo->Comp_Mode, mediaCompSsnInfo->Comp_State));
	mediaCompSsnInfo->Comp_Mode = rtpPktType;
	mediaCompSsnInfo->DeComp_State = COMP_DECOMP_STATE_NOCONTEXT;
}
//Handles scenario related to U mode, will be U Mode, sending packet in irregular timer interval.
TransportRtnType MediaComp_Mode_U(compmedia_rtp_session *ses, int *hdrlen )
{
	
	TransportRtnType  rtnType =MEDIACOMP_FAILURE;
	rtnType = mediaCompSsnInfo->fptrStateFSM[mediaCompSsnInfo->Comp_State](ses, hdrlen);
	return rtnType;
}
TransportRtnType MediaComp_Mode_B(compmedia_rtp_session *ses, int *hdrlen )
{

	comp_uint16_t  rtnType = MEDIACOMP_SUCCESS;
	rtnType = mediaCompSsnInfo->fptrStateFSM[mediaCompSsnInfo->Comp_State](ses, hdrlen);
	return rtnType;
}

//Handles scenario related to IR state, will send uncompress packets.
TransportRtnType MediaComp_State_IR(compmedia_rtp_session *ses, int *hdrlen)
{
	TransportRtnType  rtnType;
	if (mediaCompSsnInfo->DLfbPktTyp & COMP_PKT_FB_TYPE_NACK){
		SET_MEDIACOMP_MODE_STATE(COMP_FLOW_MODE_BIDIRECTIONAL,COMP_STATE_IR);
		generateRTPPkt(COMP_PKT_TYPE_UNCOMPRESSED,ses,mediaCompSsnInfo,hdrlen);
		ses->mediaCompSsn->pktSentRecvCnt = 0;
		mediaCompSsnInfo->DLfbPktTyp = mediaCompSsnInfo->DLfbPktTyp ^ COMP_PKT_FB_TYPE_NACK;
		rtnType = MEDIACOMP_SUCCESS;
	}else if(mediaCompSsnInfo->DLfbPktTyp & COMP_PKT_FB_TYPE_ACK){
			SET_MEDIACOMP_MODE_STATE(COMP_FLOW_MODE_BIDIRECTIONAL,COMP_STATE_SO);
			mediaCompSsnInfo->DLfbPktTyp = mediaCompSsnInfo->DLfbPktTyp ^ COMP_PKT_FB_TYPE_ACK;
			ses->mediaCompSsn->pktSentRecvCnt = 0;
			rtnType = mediaCompSsnInfo->fptrStateFSM[mediaCompSsnInfo->Comp_State](ses,hdrlen);
	}else{
		if (ses->mediaCompSsn->pktSentRecvCnt < MAX_IR_PKT_INTERVAL){
			ses->mediaCompSsn->pktSentRecvCnt++;
		}else{
			SET_MEDIACOMP_MODE_STATE(COMP_FLOW_MODE_UNIDIRECTIONAL,COMP_STATE_SO);
			ses->mediaCompSsn->pktSentRecvCnt = 0;
		}
		generateRTPPkt(COMP_PKT_TYPE_UNCOMPRESSED,ses,mediaCompSsnInfo,hdrlen);
		rtnType = MEDIACOMP_SUCCESS;
	}
	return rtnType;
}

//Handles scenario related to FO state, will send partially compress packets.
TransportRtnType MediaComp_State_FO(compmedia_rtp_session *ses, int *hdrlen)
{
	TransportRtnType  rtnType;
	if(mediaCompSsnInfo->Comp_Mode == COMP_FLOW_MODE_UNIDIRECTIONAL &&
				mediaCompSsnInfo->DLfbPktTyp == COMP_PKT_FB_TYPE_NONE){
		SET_MEDIACOMP_MODE_STATE(mediaCompSsnInfo->Comp_Mode,COMP_STATE_SO);
	}else {
		if(mediaCompSsnInfo->DLfbPktTyp & COMP_PKT_TYPE_NACK){
			mediaCompSsnInfo->DLfbPktTyp = mediaCompSsnInfo->DLfbPktTyp ^ COMP_PKT_TYPE_NACK;
			ses->mediaCompSsn->pktSentRecvCnt =0;
			SET_MEDIACOMP_MODE_STATE(mediaCompSsnInfo->Comp_Mode,COMP_STATE_IR);
			rtnType = mediaCompSsnInfo->fptrStateFSM[mediaCompSsnInfo->Comp_State](ses,hdrlen);
			return rtnType;
		}else if ((mediaCompSsnInfo->DLfbPktTyp & COMP_PKT_TYPE_ACK)){
			mediaCompSsnInfo->DLfbPktTyp = mediaCompSsnInfo->DLfbPktTyp ^ COMP_PKT_TYPE_ACK;
			ses->mediaCompSsn->pktSentRecvCnt =0;
			SET_MEDIACOMP_MODE_STATE(mediaCompSsnInfo->Comp_Mode,COMP_STATE_SO);
			rtnType = mediaCompSsnInfo->fptrStateFSM[mediaCompSsnInfo->Comp_State](ses,hdrlen);
			return rtnType;
		}else{
			if (ses->mediaCompSsn->pktSentRecvCnt <= FO_PKT_INTERVAL){
				ses->mediaCompSsn->pktSentRecvCnt++;
			}else{
				ses->mediaCompSsn->pktSentRecvCnt =0;
				SET_MEDIACOMP_MODE_STATE(COMP_FLOW_MODE_UNIDIRECTIONAL,COMP_STATE_IR);
			}
		}	
	}
	generateRTPPkt(COMP_PKT_TYPE_COMPRESSED_FO,ses,mediaCompSsnInfo,hdrlen);
	return MEDIACOMP_SUCCESS;
}

//Handles scenario related to SO state, will send compress packets.
TransportRtnType MediaComp_State_SO(compmedia_rtp_session *ses, int *hdrlen)
{
	TransportRtnType  rtnType;
	if (ses == NULL){
		PJ_LOG(5,(THIS_FILE,"SO timer expired"));
		mediaCompSsnInfo->isUModeTimerExpired = MEDIACOMP_TRUE;
		return MEDIACOMP_SUCCESS;
	}
	if(mediaCompSsnInfo->Comp_Mode == COMP_FLOW_MODE_UNIDIRECTIONAL &&
			mediaCompSsnInfo->DLfbPktTyp == COMP_PKT_FB_TYPE_NONE){
		if (!(ses->out_extseq % F_MAX_PERIOD)){
				SET_MEDIACOMP_MODE_STATE(mediaCompSsnInfo->Comp_Mode,COMP_STATE_IR);
				ses->mediaCompSsn->pktSentRecvCnt = 0;
				rtnType = mediaCompSsnInfo->fptrStateFSM[mediaCompSsnInfo->Comp_State](ses,hdrlen);
				return rtnType;
			}
		if(!(ses->mediaCompSsn->timer_hndl)){
			ses->mediaCompSsn->timer_hndl = create_timer("UMODE_PKTSENT_TIMER");
			if(!timer_start(ses->mediaCompSsn->timer_hndl, &MediaComp_State_SO, NULL, NULL, F_MAX_TIME)){
				PJ_LOG(5, (THIS_FILE, "Timer start failed"));
			}
		/*	if(!mediaCompSsnInfo->threadId){
				PJ_LOG(5,(THIS_FILE,"thread creating inSO"));
			rtnType = pthread_create(&mediaCompSsnInfo->threadId, NULL,&timer, NULL);
			if (rtnType){
				PJ_LOG(5, (THIS_FILE, "TX:ERROR; return code from pthread_create() is %d\n", rtnType));
			  return rtnType;
			}
			} */
		}
		//If so pkts sent for more then F_MAX_TIME ,then send IR pkt
		if(mediaCompSsnInfo->isUModeTimerExpired){
			ses->mediaCompSsn->pktSentRecvCnt= 0;
			mediaCompSsnInfo->uModeSOPktPeriod =1;
			SET_MEDIACOMP_MODE_STATE(mediaCompSsnInfo->Comp_Mode,COMP_STATE_IR);
			if(!timer_start(ses->mediaCompSsn->timer_hndl, &MediaComp_State_SO, NULL, NULL, F_MAX_TIME)){
						PJ_LOG(5, (THIS_FILE, "Timer start failed"));
			}
			mediaCompSsnInfo->isUModeTimerExpired = MEDIACOMP_FALSE;
		}else if (ses->mediaCompSsn->pktSentRecvCnt < mediaCompSsnInfo->uModeSOPktPeriod){
			ses->mediaCompSsn->pktSentRecvCnt++; //Ensures the so pkt count should be of pkt_period times.
		}else{
			MIN(2* mediaCompSsnInfo->uModeSOPktPeriod, F_MAX_PERIOD/2, mediaCompSsnInfo->uModeSOPktPeriod);
			ses->mediaCompSsn->pktSentRecvCnt = 0;
			SET_MEDIACOMP_MODE_STATE(mediaCompSsnInfo->Comp_Mode,COMP_STATE_FO);
		}
	}else{
		ses->mediaCompSsn->pktSentRecvCnt = 0;
		mediaCompSsnInfo->uModeSOPktPeriod = 1;
		if (!(ses->out_extseq % F_MAX_PERIOD)){
			SET_MEDIACOMP_MODE_STATE(mediaCompSsnInfo->Comp_Mode,COMP_STATE_FO);
		}else if (mediaCompSsnInfo->DLfbPktTyp & COMP_PKT_TYPE_NACK ){
			mediaCompSsnInfo->DLfbPktTyp = mediaCompSsnInfo->DLfbPktTyp ^ COMP_PKT_TYPE_NACK;
			SET_MEDIACOMP_MODE_STATE(mediaCompSsnInfo->Comp_Mode,COMP_STATE_IR);
		}
		if(mediaCompSsnInfo->Comp_State != COMP_STATE_SO){
			rtnType = mediaCompSsnInfo->fptrStateFSM[mediaCompSsnInfo->Comp_State](ses,hdrlen);
			return rtnType;
		}
	}
	generateRTPPkt(COMP_PKT_TYPE_COMPRESSED_SO,ses,mediaCompSsnInfo,hdrlen);
	return MEDIACOMP_SUCCESS;
}


// on every packet arrival, , need to call this function to decompress and find the pttype
TransportRtnType MediaComp_processInRTPpkt( compmedia_rtp_session *ses,
					    const void *pkt, int pkt_len,
					    const compmedia_rtp_hdr **hdr,
					    const void **payload,
					    unsigned *payloadlen)
{
	comp_uint16_t rtpHdrLen;
	TransportRtnType rtnType;
	TransportPktType pktType;
	pktType=	getRTPPktType(pkt);
	*hdr = &(ses->mediaCompSsn->comp_rtp_hdr);
	/*pktSentRecvStatus usuge :drop the initial any other pkts, till recv of full header pkt*/
	if (!ses->mediaCompSsn->pktSentRecvStatus){
		if (pktType == COMP_PKT_TYPE_UNCOMPRESSED){
			PJ_LOG(5, (THIS_FILE, "Thread creation Success, start the timer"));
			ses->mediaCompSsn->timer_hndl = create_timer("NACK_TRIGGER_TIMER");
			if(!timer_start(ses->mediaCompSsn->timer_hndl, &generateFBPktOnNWStatus, (void *)ses, (void *)mediaCompSsnInfo, NW_STATUS_TIMER)){
				PJ_LOG(5, (THIS_FILE, "Timer start failed"));
			}
		/*	if(!mediaCompSsnInfo->threadId){
				PJ_LOG(5,(THIS_FILE,"thread creating"));
				rtnType = pthread_create(&mediaCompSsnInfo->threadId, NULL,&timer, NULL);
				if (rtnType){
					PJ_LOG(5, (THIS_FILE, "TX:ERROR; return code from pthread_create() is %d\n", rtnType));
				  return rtnType;
				}
			} */
			ses->mediaCompSsn->pktSentRecvStatus = MEDIACOMP_TRUE;
			ses->mediaCompSsn->pktSentRecvCnt = 0;
		}else{
			ses->mediaCompSsn->dropkt  = MEDIACOMP_TRUE;
			ses->mediaCompSsn->pktSentRecvCnt++;
			if (ses->mediaCompSsn->pktSentRecvCnt > F_MAX_IRREGULAR_PERIOD/4){
				ses->mediaCompSsn->pktSentRecvCnt =0;
				mediaCompSsnInfo->sendFB= MEDIACOMP_TRUE;
				mediaCompSsnInfo->fbPktInfo.fbPktType = COMP_PKT_TYPE_NACK;
			}
			return MEDIACOMP_SUCCESS;
		}
	}
	parseRTP(pktType,ses,mediaCompSsnInfo,pkt,&rtpHdrLen);
	rtnType = mediaCompSsnInfo->fptrDLStateFSM[mediaCompSsnInfo->DeComp_State](ses, pktType);
	if (rtnType  != MEDIACOMP_SUCCESS)
	{
		 PJ_LOG(5, (THIS_FILE, "MediaComp_processInRTPpkt:  Decomp State hndlr returned fail"));
		 return MEDIACOMP_FAILURE;
	}
    /* Find and set payload. */
	*payload = ((pj_uint8_t*)pkt) + rtpHdrLen;
	*payloadlen = pkt_len - rtpHdrLen;

	/* Remove payload padding if any */
	if ((*hdr)->p && *payloadlen > 0) {
	comp_uint8_t pad_len;

	pad_len = ((comp_uint8_t*)(*payload))[*payloadlen - 1];
	if (pad_len <= *payloadlen)
	*payloadlen -= pad_len;
	}	
	PJ_LOG(5, (THIS_FILE," RX:Incoming Pkt [State %d rtpHdrLen %d]", mediaCompSsnInfo->DeComp_State,
				rtpHdrLen));
	return MEDIACOMP_SUCCESS;
}
TransportRtnType MediaDeComp_State_NoContext(compmedia_rtp_session *ses,TransportPktType pktType)
{
	if(pktType ==COMP_PKT_TYPE_UNCOMPRESSED){
		if ((mediaCompSsnInfo->streamDir & PJMEDIA_DIR_ENCODING) &&
				(mediaCompSsnInfo->fbPktInfo.errType == RTP_HDR_DECONSTRUCT_SUCCESS)){
			//set sendFB, and type of feedback packet to be sent */
			mediaCompSsnInfo->sendFB= MEDIACOMP_TRUE;
			mediaCompSsnInfo->fbPktInfo.fbPktType = COMP_PKT_TYPE_ACK;
		}else if(mediaCompSsnInfo->fbPktInfo.errType == RTP_HDR_PARSING_ERROR){
			mediaCompSsnInfo->sendFB= MEDIACOMP_TRUE;
			mediaCompSsnInfo->fbPktInfo.fbPktType = COMP_PKT_TYPE_NACK;
			ses->mediaCompSsn->dropkt  = MEDIACOMP_TRUE;
			ses->mediaCompSsn->pktSentRecvCnt = 0;
			return MEDIACOMP_FAILURE;
		}
		SET_MEDIADECOMP_STATE(COMP_DECOMP_STATE_FULLCONTEXT);
		mediaCompSsnInfo->fbPktInfo.errType = MEDIACOMP_NONE;
		ses->mediaCompSsn->pktSentRecvCnt = 0;
		mediaCompSsnInfo->recvPktStatus.isReqHdrPktRecvd = MEDIACOMP_TRUE;
	}else{
		ses->mediaCompSsn->dropkt  = MEDIACOMP_TRUE;
		ses->mediaCompSsn->pktSentRecvCnt++;
		if(ses->mediaCompSsn->pktSentRecvCnt > F_MAX_IRREGULAR_PERIOD / 8){
			PJ_LOG(5,(THIS_FILE, "expecting IR pkt, not received sending NACK"));
			mediaCompSsnInfo->sendFB= MEDIACOMP_TRUE;
			mediaCompSsnInfo->fbPktInfo.fbPktType = COMP_PKT_TYPE_NACK;
			ses->mediaCompSsn->pktSentRecvCnt = 0;
		}
		PJ_LOG(5, (THIS_FILE,"Drop the pkt,in NoContext state recv pktType %d dropCnt %d",pktType,ses->mediaCompSsn->pktSentRecvCnt));
		return MEDIACOMP_FAILURE;
	}
	return MEDIACOMP_SUCCESS;
}

TransportRtnType MediaDeComp_State_StaticContext(compmedia_rtp_session *ses,TransportPktType pktType)
{
	comp_int16_t rtnType = MEDIACOMP_FAILURE;
	if (pktType == COMP_PKT_TYPE_COMPRESSED_FO){
		PJ_LOG(5,(THIS_FILE,"Static contxt :errType %d streamdir %d decompstate %d",
				mediaCompSsnInfo->fbPktInfo.errType,mediaCompSsnInfo->streamDir,
				mediaCompSsnInfo->DeComp_State));
	if(mediaCompSsnInfo->fbPktInfo.errType == RTP_HDR_DECONSTRUCT_SUCCESS){
		if (mediaCompSsnInfo->streamDir & PJMEDIA_DIR_ENCODING){
			mediaCompSsnInfo->sendFB= MEDIACOMP_TRUE;
			mediaCompSsnInfo->fbPktInfo.fbPktType = COMP_PKT_TYPE_ACK;
		}
		SET_MEDIADECOMP_STATE(COMP_DECOMP_STATE_FULLCONTEXT);
		mediaCompSsnInfo->fbPktInfo.errType = RTP_HDR_NONE;
		mediaCompSsnInfo->recvPktStatus.isReqHdrPktRecvd = MEDIACOMP_TRUE;
		ses->mediaCompSsn->pktSentRecvCnt =0;
	}else if(mediaCompSsnInfo->fbPktInfo.errType == RTP_HDR_PARSING_ERROR){
		ses->mediaCompSsn->dropkt  = MEDIACOMP_TRUE;
		ses->mediaCompSsn->pktSentRecvCnt++;
		if (ses->mediaCompSsn->pktSentRecvCnt > F_MAX_IRREGULAR_PERIOD/8){
					goto SEND_NACK_SWITCH_CONTEXT;
			}
		}
	}else{
		if (pktType == COMP_PKT_TYPE_ACK ||
				pktType == COMP_PKT_TYPE_NACK)
		{
			ses->mediaCompSsn->dropkt = MEDIACOMP_TRUE;
			return MEDIACOMP_SUCCESS;
		}
		if(pktType == COMP_PKT_TYPE_COMPRESSED_SO){
			ses->mediaCompSsn->dropkt  = MEDIACOMP_TRUE;
			ses->mediaCompSsn->pktSentRecvCnt++;
			if (ses->mediaCompSsn->pktSentRecvCnt > F_MAX_IRREGULAR_PERIOD/8){
					goto SEND_NACK_SWITCH_CONTEXT;
				}
			}
		if(pktType == COMP_PKT_TYPE_UNCOMPRESSED){
			SET_MEDIADECOMP_STATE(COMP_DECOMP_STATE_NOCONTEXT);
			ses->mediaCompSsn->pktSentRecvCnt = 0;
			rtnType = mediaCompSsnInfo->fptrDLStateFSM[mediaCompSsnInfo->DeComp_State](ses, pktType);
			if (rtnType  != MEDIACOMP_SUCCESS)
			{
				 PJ_LOG(5, (THIS_FILE, "MediaComp_processInRTPpkt:  Decomp State hndlr returned fail"));
				 return MEDIACOMP_FAILURE;
			}
		}
	}
	return MEDIACOMP_SUCCESS;
SEND_NACK_SWITCH_CONTEXT:
{
	if (mediaCompSsnInfo->streamDir & PJMEDIA_DIR_ENCODING ){
	mediaCompSsnInfo->fbPktInfo.fbPktType = COMP_PKT_TYPE_NACK;
	mediaCompSsnInfo->recvPktStatus.isReqHdrPktRecvd = MEDIACOMP_FALSE;
	}
	ses->mediaCompSsn->pktSentRecvCnt =0;
	SET_MEDIADECOMP_STATE(COMP_DECOMP_STATE_NOCONTEXT);
	return MEDIACOMP_SUCCESS;
}
}


TransportRtnType MediaDeComp_State_FullContext(compmedia_rtp_session *ses,TransportPktType pktType)
{
	comp_int16_t rtnType = MEDIACOMP_FAILURE;
	if(pktType == COMP_PKT_TYPE_COMPRESSED_SO){
	if(mediaCompSsnInfo->fbPktInfo.errType == RTP_HDR_DECONSTRUCT_SUCCESS &&
			mediaCompSsnInfo->recvPktStatus.isReqHdrPktRecvd){
		ses->mediaCompSsn->pktSentRecvCnt =0;
		/* if pkt received properly, then 64th packet should be */
	/*	if(so_pkt_count == (F_MAX_PERIOD * 2) - 1){
			so_pkt_count = 0;
			ses->mediaCompSsn.recvPktStatus.isUnCompPktReceived = MEDIACOMP_FALSE;
			SET_MEDIADECOMP_STATE(COMP_DECOMP_STATE_STATICCONTEXT);
		}*/
	}else if (mediaCompSsnInfo->fbPktInfo.errType == RTP_HDR_PARSING_ERROR ||
			!(mediaCompSsnInfo->recvPktStatus.isReqHdrPktRecvd)){
		ses->mediaCompSsn->dropkt  = MEDIACOMP_TRUE;
		ses->mediaCompSsn->pktSentRecvCnt++;
		/* In case of only receiving SO pkt without any uncompress pkt */
		if (ses->mediaCompSsn->pktSentRecvCnt > F_MAX_IRREGULAR_PERIOD/8){
				goto SEND_NACK_SWITCH_CONTEXT;
		}
		goto SEND_NACK_SWITCH_CONTEXT;
	}
	}else{
		 PJ_LOG(5, (THIS_FILE, "MediaComp_processInRTPpkt: falling in else case, pkttype %d decomp state %d",
				 pktType,mediaCompSsnInfo->DeComp_State));
		if (pktType == COMP_PKT_TYPE_ACK ||
				pktType == COMP_PKT_TYPE_NACK)
		{
			ses->mediaCompSsn->dropkt = MEDIACOMP_TRUE;
			return MEDIACOMP_SUCCESS;
		}
		if(pktType == COMP_PKT_TYPE_COMPRESSED_FO){
			SET_MEDIADECOMP_STATE(COMP_DECOMP_STATE_STATICCONTEXT);
		}
		if(pktType == COMP_PKT_TYPE_UNCOMPRESSED){
			SET_MEDIADECOMP_STATE(COMP_DECOMP_STATE_NOCONTEXT);
		}
		mediaCompSsnInfo->recvPktStatus.isReqHdrPktRecvd = MEDIACOMP_FALSE;
		rtnType = mediaCompSsnInfo->fptrDLStateFSM[mediaCompSsnInfo->DeComp_State](ses, pktType);
		if (rtnType  != MEDIACOMP_SUCCESS)
		{
			 PJ_LOG(5, (THIS_FILE, "MediaComp_processInRTPpkt:  Decomp State hndlr returned fail"));
			 return MEDIACOMP_FAILURE;
		}

	}
	return MEDIACOMP_SUCCESS;
SEND_NACK_SWITCH_CONTEXT:
{
	if (mediaCompSsnInfo->streamDir & PJMEDIA_DIR_ENCODING ){
	mediaCompSsnInfo->fbPktInfo.fbPktType = COMP_PKT_TYPE_NACK;
	mediaCompSsnInfo->recvPktStatus.isReqHdrPktRecvd = MEDIACOMP_FALSE;
	}
	ses->mediaCompSsn->pktSentRecvCnt =0;
	SET_MEDIADECOMP_STATE(COMP_DECOMP_STATE_NOCONTEXT);
	return MEDIACOMP_SUCCESS;
}
}
