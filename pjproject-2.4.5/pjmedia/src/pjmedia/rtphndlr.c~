#include <pjmedia/mediacompressor.h>
//#include <pjmedia/rtp.h>
#include <pjmedia/rtphndlr.h>
#include <pjmedia/mediamngrtimer.h>
#define THIS_FILE "rtphndlr"

#define MAX_BUF_SIZE 64
#define MAX_NACK_SENT_INTV 8
#define WINDOW_SIZE 63
#define MAX_DROP_COUNT 3
#define MAX_SEQNUM_INTERVAL 64
#define MAX_DIFF_PKT_ALLOWED MAX_SEQNUM_INTERVAL/2
#define VALIDATE_INCOMING_RTP_PKT(ses, fullPkt) \
 ((ses->peer_ssrc == pj_ntohl(fullPkt->ssrc))&& (ses->out_pt == fullPkt->pt))

comp_uint16_t pktStatus=0;
comp_uint16_t mxSeqNum=0;

struct comp_rtpHdrGen_info rtpHdrInfo;
TransportPktType PktType;

int buff[256];
comp_uint16_t WINDOW_MIN , WINDOW_MAX , current , pkts_since_lastFO=0;

// Initialisation of Variables related to calculation of sequence Number and timestamp

void Seq_Time_Cal_Init_DeInit()
{
    comp_uint16_t index;
    for(index =0 ; index < 256 ; index++)
    	{
    		buff[index] = -1;
    	}

    WINDOW_MIN = WINDOW_MAX = current=pkts_since_lastFO=0;
    rtpHdrInfo.pktArrvInfo.pktLoss_Intv = 0;
    rtpHdrInfo.pktArrvInfo.expectedPkt_Intv = 0;
    rtpHdrInfo.SsnPktRecvd=0;
    rtpHdrInfo.SsnPktLoss = 0;

}

// Called incase of Full Header and will make base for further calculation

void setStaticDynamicRTPContext(comp_uint16_t uncomp_seq, comp_uint32_t uncomp_ts,comp_uint16_t samp_freq )
{
	 
	 comp_uint16_t index =0;
	 // Initialize Everything
	  rtpHdrInfo.base_ts = uncomp_ts;
	 pkts_since_lastFO=1;				// In case more than 1 Full packet are coming then last will be the base
	 rtpHdrInfo.SsnPktRecvd++;
	 buff[current] = uncomp_seq;
	 rtpHdrInfo.pktArrvInfo.expectedPkt_Intv = 0;
	 rtpHdrInfo.base_seq = uncomp_seq;
	 rtpHdrInfo.pktArrvInfo.lastPktSeq = rtpHdrInfo.base_seq ;
	 rtpHdrInfo.pktArrvInfo.pktLoss_Intv = 0;
	 WINDOW_MIN = current;
	 WINDOW_MAX = WINDOW_MIN + WINDOW_SIZE;
	 // Initialise by -1 Values less than WINDOW_MIN
	 for(index=0;index<WINDOW_MIN;index++){
		 buff[index]=-1;
	 }
	 current++;
	 // Set the codec parameter
	 rtpHdrInfo.codec_freq = samp_freq;
}

comp_uint32_t getTimestamp(comp_uint16_t full_seq_SO)
{
	comp_uint32_t full_timestamp;
	// If seq is higher than base_seq then timestamp will be higher than base timestamp
	if(full_seq_SO > rtpHdrInfo.base_seq){
	full_timestamp = rtpHdrInfo.base_ts + (full_seq_SO - rtpHdrInfo.base_seq) * rtpHdrInfo.codec_freq;
	}
	//If seq is less than the base seq then timestamp will be less than base timestamp
	else if(full_seq_SO < rtpHdrInfo.base_seq){
		full_timestamp = rtpHdrInfo.base_ts - ((rtpHdrInfo.base_seq - full_seq_SO) * rtpHdrInfo.codec_freq);
	}
	return full_timestamp;
}


comp_uint16_t generateTimestamp(comp_uint16_t FO_timestamp , errType *status)
{
	comp_uint32_t calculated_timestamp , full_timestamp;
	comp_uint16_t index =0;
	// If the FO TS is before cycle of 2 byte
	if(FO_timestamp > (rtpHdrInfo.base_ts & 0xFFFF)){
	full_timestamp = rtpHdrInfo.base_ts + (FO_timestamp - (rtpHdrInfo.base_ts & 0xFFFF));
	}
	// If FO is after the cycle of 2 byte
	else if(FO_timestamp <= (rtpHdrInfo.base_ts & 0xFFFF)){
		full_timestamp = rtpHdrInfo.base_ts + ((0xFFFF + 1) - (rtpHdrInfo.base_ts & 0xFFFF)) + FO_timestamp ;
	}
	calculated_timestamp = rtpHdrInfo.base_ts + (rtpHdrInfo.codec_freq * (pkts_since_lastFO));
	rtpHdrInfo.pktArrvInfo.pktLoss_Intv = 0;
	rtpHdrInfo.pktArrvInfo.pktLoss_Intv = (full_timestamp-calculated_timestamp)/rtpHdrInfo.codec_freq;
	PJ_LOG(5, (THIS_FILE, "FULL_TIMESTAMP %u CALCULATED_TIMESTAMP %u BASE_TIMESTAMP %u pkts_since_lastFO %hu ",full_timestamp,calculated_timestamp,rtpHdrInfo.base_ts,pkts_since_lastFO));
	rtpHdrInfo.base_ts = full_timestamp;
	if (full_timestamp == calculated_timestamp) // It means NO loss in the last timestamped Interval
	{
		 current = 0;
		 pkts_since_lastFO=0;
		 rtpHdrInfo.pktArrvInfo.expectedPkt_Intv = 0;
		 rtpHdrInfo.pktArrvInfo.pktLoss_Intv = 0;
		 WINDOW_MIN = current;
		 WINDOW_MAX = WINDOW_MIN + WINDOW_SIZE;
		 current++;
		*status = RTP_HDR_DECONSTRUCT_SUCCESS;
	}
 	else if (calculated_timestamp < full_timestamp)
 	{
 		rtpHdrInfo.SsnPktLoss = rtpHdrInfo.SsnPktLoss + rtpHdrInfo.pktArrvInfo.pktLoss_Intv;
 		

		*status = RTP_HDR_DECONSTRUCT_SUCCESS;
	}
	else if (calculated_timestamp > full_timestamp)
	{
		*status = RTP_HDR_PARSING_ERROR;
	}

	PJ_LOG(5, (THIS_FILE, "Pkt Loss in This Session is %hu",rtpHdrInfo.pktArrvInfo.pktLoss_Intv));
	PJ_LOG(5, (THIS_FILE, "Total Pkt Loss in Complete Session is %hu",rtpHdrInfo.SsnPktLoss));
	PJ_LOG(5, (THIS_FILE, "Packet Received Uptil Now is %llu ",rtpHdrInfo.SsnPktRecvd));
	return full_timestamp;
}

comp_uint16_t generateSequence(TransportPktType Pkt_Type , comp_uint16_t seq,errType *status)
{

	comp_uint16_t full_seq =0, index =0;
	errType check ;
	// Calculating full_seq for SO Packet
	if(Pkt_Type==COMP_PKT_TYPE_COMPRESSED_SO){

		// Decide full seq on the basis of pkt loss  since last base packet and current seq pattern like
        // Conditions to be checked for pkt to be before timestamp packet
		if((seq - (buff[current -1] & 0x3F )) > 32 &&
				(rtpHdrInfo.pktArrvInfo.pktLoss_Intv > 0) && seq > (buff[WINDOW_MIN] & 0x3F)){
			full_seq = rtpHdrInfo.base_seq - ((rtpHdrInfo.base_seq & 0x3F ) + (64 - seq ));
		}
		// Otherwise it is in this range of 64
		else{
		full_seq = rtpHdrInfo.base_seq + (seq - (rtpHdrInfo.base_seq & 0x3F )) ;
		}
	}
	else if(Pkt_Type==COMP_PKT_TYPE_COMPRESSED_FO){
				// If seq received is after 64 pkts
				if (((rtpHdrInfo.base_seq & 0x3F )-seq)==0)
				{
					full_seq = rtpHdrInfo.base_seq + (64 -(rtpHdrInfo.base_seq & 0x3F ) ) + seq;
				}
				// If FO pkt is already received before this pkt in this interval of 64
				else if((rtpHdrInfo.base_seq & 0x3F ) < seq)
				{
					full_seq = rtpHdrInfo.base_seq + (seq -(rtpHdrInfo.base_seq & 0x3F));
				}
				// If FO pkt is received before after interval of 64
				else if ((rtpHdrInfo.base_seq & 0x3F ) > seq ){
					full_seq = rtpHdrInfo.base_seq + (64 -(rtpHdrInfo.base_seq & 0x3F ) ) + seq;
				}

	}
	rtphndlr_check_Old_PKt(full_seq,&check);	// Will check for old pkts and reset the WINDOW_MIN < MAX and current pointers
	if(!(check == RTP_HDR_PARSING_DROP_PACKET)){
	buff[current] = full_seq;
	current++;
	rtpHdrInfo.pktArrvInfo.lastPktSeq = full_seq;
	pkts_since_lastFO++;
	if(Pkt_Type==COMP_PKT_TYPE_COMPRESSED_FO){
		rtpHdrInfo.base_seq = full_seq;
		pkts_since_lastFO = 1;
	}
	*status = RTP_HDR_DECONSTRUCT_SUCCESS;
	}
	else{
		*status = RTP_HDR_PARSING_DROP_PACKET;
	}
	rtpHdrInfo.SsnPktRecvd++;
	return full_seq;

}

void rtphndlr_check_Old_PKt(comp_uint16_t full_seq , errType *status)
{
	comp_uint16_t index = 0;
	PJ_LOG(5,(THIS_FILE,"VALUE AT WINDOW_MIN IS %hu",buff[WINDOW_MIN]));
	*status = RTP_HDR_DECONSTRUCT_SUCCESS;
	 // First check whether it is old packet
	if(full_seq > buff[WINDOW_MIN])
	{
	 // 	Case of packet in between Window Min and Previous Received Packet

	if( ( full_seq < rtpHdrInfo.pktArrvInfo.lastPktSeq) && rtpHdrInfo.pktArrvInfo.expectedPkt_Intv > 0 )
		{
		rtpHdrInfo.pktArrvInfo.expectedPkt_Intv--;
		unsigned char temp = current + 1;
		// Swap the given sequence into right place using Insertion sorting

		while (full_seq > buff[WINDOW_MIN] && full_seq < buff[current-1])
				{
				  buff[current] = buff[current - 1];
				  current--;
				 }
		 buff[current]= full_seq;
		 rtpHdrInfo.pktArrvInfo.lastPktSeq = full_seq ;

		// Used to handle if due to swaping WINDOW_MIN can be moved
		 while((buff[WINDOW_MIN+1] - buff[WINDOW_MIN])==1)
				{
					WINDOW_MIN++;
					buff[WINDOW_MIN-1] = -1;
				}
		 WINDOW_MAX = WINDOW_MIN + WINDOW_SIZE;
			current = temp;

		 }

	   // 	Case to handle if Expected packets are greater than 32
	else if ( ((full_seq - rtpHdrInfo.pktArrvInfo.lastPktSeq) > 1) && (rtpHdrInfo.pktArrvInfo.expectedPkt_Intv > 15) )
		{
		 rtpHdrInfo.pktArrvInfo.expectedPkt_Intv = rtpHdrInfo.pktArrvInfo.expectedPkt_Intv + (full_seq - rtpHdrInfo.pktArrvInfo.lastPktSeq - 1);
		 buff[current]=full_seq;
		 for(index = 0 ; index < 7 ; index++)
			{
				if((buff[WINDOW_MIN + 1 ] > buff[WINDOW_MIN]) && (buff[current] >=buff[WINDOW_MIN]))
							 WINDOW_MIN ++;

				rtpHdrInfo.pktArrvInfo.expectedPkt_Intv--;
				buff[WINDOW_MIN - 1]=-1;
			}
		 current++;
		 rtpHdrInfo.pktArrvInfo.lastPktSeq = full_seq;
		}

	   //	Case to handle if Packet received is just one greater than the last packet but
	   //	expecting no. of packets are more than 1
	else if (((full_seq - rtpHdrInfo.pktArrvInfo.lastPktSeq) == 1) && (rtpHdrInfo.pktArrvInfo.expectedPkt_Intv >= 0) )
	 {
		 buff[current] = full_seq;
		 current++;
		 rtpHdrInfo.pktArrvInfo.lastPktSeq = full_seq;

	 }
	   //Case to handle if Current Packet and last packet's Sequence is greater than 1 but diff is less than 15
	else if (((full_seq - rtpHdrInfo.pktArrvInfo.lastPktSeq) > 1) && (rtpHdrInfo.pktArrvInfo.expectedPkt_Intv < 15 ))
	 {
		rtpHdrInfo.pktArrvInfo.expectedPkt_Intv = rtpHdrInfo.pktArrvInfo.expectedPkt_Intv + (full_seq - rtpHdrInfo.pktArrvInfo.lastPktSeq - 1);
		 buff[current] = full_seq;
		 current++;
		 rtpHdrInfo.pktArrvInfo.lastPktSeq = full_seq;
	 }
	}
	else if (full_seq < buff[WINDOW_MIN]){
	    *status = RTP_HDR_PARSING_DROP_PACKET;
	}
	WINDOW_MAX = WINDOW_MIN + WINDOW_SIZE;
}

comp_uint16_t getPktStatus(comp_uint16_t seqNum)
{
	comp_int16_t diff = mxSeqNum-seqNum;
	comp_uint16_t fb_buff;
	if(diff>=0)
	   fb_buff=((pktStatus >>(diff)) & 0x0FFFF);
	return fb_buff;
}

TransportRtnType setPktStatus(comp_uint16_t seqNum,comp_uint32_t *total_pkt_loss)
{
	if(mxSeqNum==0)
		mxSeqNum=seqNum;
	comp_int16_t diff = seqNum-mxSeqNum;

	if(diff>=0 && diff<(MAX_BUF_SIZE/2))
	{
		*total_pkt_loss+=diff-1;
		mxSeqNum=seqNum;
		pktStatus=((pktStatus<<diff) | 0x01);
	}else if(diff<0 && diff>(-1*(MAX_BUF_SIZE/2)))
	{
		*total_pkt_loss-=1;
		pktStatus=pktStatus | (0x01<<(-1*diff));
	}
	else if(diff>=(MAX_BUF_SIZE/2)|| diff<(-1*(MAX_BUF_SIZE/2)))
	{
		return MEDIACOMP_FAILURE;
	}
	return MEDIACOMP_SUCCESS;
}



TransportRtnType generateRTPPkt(TransportPktType pktType,compmedia_rtp_session *ses,compCommonInfo *sesInfo, int *hdrlen)
{   
	PJ_LOG(5,(THIS_FILE,"TX: Comp Mode %d Comp State %d", sesInfo->Comp_Mode, sesInfo->Comp_State));
	switch(pktType)
	{
		case COMP_PKT_TYPE_ACK :
			{
				if (ses->mediaCompSsn->fbPkt){
				compFBACKPkt *fbACKPkt= &(ses->mediaCompSsn->fbPkt);
				fbACKPkt->pkt_typ = COMP_PKT_TYPE_ACK;
				fbACKPkt->status_bit = 0;  //No need to to set,
				fbACKPkt->length = sizeof(compFBACKPkt) -1;
				fbACKPkt->seq = pj_htons(sesInfo->fbPktInfo.lastUpdatedSeqNum);
				fbACKPkt->ts = pj_htonl(sesInfo->fbPktInfo.lastUpdatedTS);
				*hdrlen =sizeof(compFBACKPkt);
				PJ_LOG(5,(THIS_FILE,"TX:(ACK pkt)[V:%d seqNo:%d, Ts %d len: %d]",
						fbACKPkt->pkt_typ,pj_ntohs(fbACKPkt->seq),pj_ntohl(fbACKPkt->ts),fbACKPkt->length));
				}else{
					PJ_LOG(5, (THIS_FILE, "fbpkt memory is not allocated "));
				}
			}
			break;
		case COMP_PKT_TYPE_NACK :
			{
				if (ses->mediaCompSsn->fbPkt){
				compFBNACKPkt *fbNACKPkt= &(ses->mediaCompSsn->fbPkt);
				fbNACKPkt->pkt_typ = COMP_PKT_TYPE_NACK;  //4 //4 bits(1111= 0x0F) represents NACK packet type
				if (sesInfo->fbPktInfo.errType == RTP_HDR_PARSING_ERROR){
					fbNACKPkt->status_bit = 0;  //pkt type is nack, and status bit suggest it contains sequence number and timestamp of last success packet
					fbNACKPkt->u.ts = pj_htonl(sesInfo->fbPktInfo.lastUpdatedTS);
				}else if(sesInfo->fbPktInfo.errType == RTP_HDR_STATUS_UPDATE){
					fbNACKPkt->status_bit = 1;
					fbNACKPkt->u.pkt_arrv_status = pj_htons(getPktStatus(sesInfo->fbPktInfo.lastUpdatedSeqNum));
				}
				fbNACKPkt->length = sizeof(compFBNACKPkt) -1;
				fbNACKPkt->seq = pj_htons(sesInfo->fbPktInfo.lastUpdatedSeqNum);
				*hdrlen =sizeof(compFBNACKPkt);
				PJ_LOG(5,(THIS_FILE,"TX:(NACK pkt)[V:%d seqNo:%u len: %d]",
						fbNACKPkt->pkt_typ,pj_htons(fbNACKPkt->seq),fbNACKPkt->length));
				}else{
							PJ_LOG(5, (THIS_FILE, "fbpkt memory is not allocated "));
				}

			}
			break;
		case COMP_PKT_TYPE_UNCOMPRESSED :
			{
				compmedia_rtp_hdr *uncompPkt =  &(ses->mediaCompSsn->comp_rtp_hdr);
				pj_memcpy(uncompPkt,&ses->out_hdr, sizeof(compmedia_rtp_hdr));
				*hdrlen =  sizeof(compmedia_rtp_hdr);
				PJ_LOG(5,(THIS_FILE,"TX:(Uncompress pkt)[V:%d seqNo:%d, Ts %d M: %d pt %d]",
						uncompPkt->v,pj_ntohs(uncompPkt->seq),pj_ntohl(uncompPkt->ts), uncompPkt->m, uncompPkt->pt));
			}
			break;
		case COMP_PKT_TYPE_COMPRESSED_SO :
			{
				compSOPkt *soPkt  =&(ses->mediaCompSsn->comp_rtp_hdr);
				soPkt->pkt_typ = COMP_PKT_TYPE_COMPRESSED_SO;
				soPkt->marker_bit= ses->out_hdr.m;
				soPkt->seqNum = (comp_uint8_t)(ses->out_extseq & 0x3F);
				*hdrlen =sizeof(compSOPkt);
				PJ_LOG(5,(THIS_FILE,"TX:(SO pkt)[V:%d seqNo:%d M: %d]",
						soPkt->pkt_typ,soPkt->seqNum,soPkt->marker_bit));
			}
			break;
		case COMP_PKT_TYPE_COMPRESSED_FO :
			{
				compFOPkt *foPkt = &(ses->mediaCompSsn->comp_rtp_hdr);
				foPkt->pkt_typ = COMP_PKT_TYPE_COMPRESSED_FO;
				foPkt->marker_bit=   ses->out_hdr.m;
				foPkt->length = sizeof(compFOPkt)-1;
				foPkt->seq=  (comp_uint8_t)(ses->out_extseq & 0x3F);
				foPkt->ts = pj_htons((pj_ntohl(ses->out_hdr.ts)) & 0xFFFF);
				*hdrlen =sizeof(compFOPkt);
				PJ_LOG(5,(THIS_FILE,"TX:(FO pkt)[V:%d seqNo:%d ts:%ld M: %d]",
						foPkt->pkt_typ,foPkt->seq,pj_ntohs(foPkt->ts),foPkt->marker_bit));
			}
			break;
		default	:
			{
				PJ_LOG(5, (THIS_FILE, "generateRTPPkt Default case %d",pktType));
				return MEDIACOMP_FAILURE;
			}
	}
	return MEDIACOMP_SUCCESS;
}

void generateFBPktOnNWStatus(compmedia_rtp_session *ses, compCommonInfo *ssnInfo)
{
	static comp_uint32_t max_nack_pktIntv = 0;
	comp_uint32_t duration =0;
	//int hdrlen =0;

	//struct fbNACK_info fbNACKInfo = ssnInfo->fbPktInfo.fbNACKInfo;
	comp_uint32_t pktLoss_cntIntv = (ssnInfo->fbPktInfo.total_PktLoss -
			ssnInfo->fbPktInfo.fbNACKInfo.pktLoss_LastUpdSN );
	PJ_LOG(5, (THIS_FILE, "generateFBPktOnNWStatus total_PktLoss %u pktLoss_LastUpdSN %u ",ssnInfo->fbPktInfo.total_PktLoss,ssnInfo->fbPktInfo.fbNACKInfo.pktLoss_LastUpdSN));
	comp_uint32_t expected_pktIntv = ssnInfo->fbPktInfo.lastUpdatedSeqNum-ssnInfo->fbPktInfo.fbNACKInfo.lastUpd_fullHdrSeqNum;
	PJ_LOG(5, (THIS_FILE, "generateFBPktOnNWStatus Expected Pkt %d  Total pkt loss %d  pkt loss in current interval [ %d ]",
			expected_pktIntv, ssnInfo->fbPktInfo.total_PktLoss,pktLoss_cntIntv));

	max_nack_pktIntv +=1;
	if(pktLoss_cntIntv > (0.20 * expected_pktIntv ) ||
			(max_nack_pktIntv >= MAX_NACK_SENT_INTV /* && fbNACKInfo.nackSentCount ==0 */)){
			ssnInfo->fbPktInfo.errType = RTP_HDR_STATUS_UPDATE;
			PJ_LOG(5, (THIS_FILE, "generateFBPktOnNWStatus greater than 20 loss or MAX_NACK_SENT_INTV"));
			//fbNACKInfo.nackSentCount += 1;
			ssnInfo->sendFB= MEDIACOMP_TRUE;
			ssnInfo->fbPktInfo.fbPktType=COMP_PKT_TYPE_NACK;
			max_nack_pktIntv = 0;
			//fbNACKInfo.nackSentCount = 0;

			duration = NW_STATUS_TIMER;
			goto TIMER_START;

		}else if((pktLoss_cntIntv < (0.20 * expected_pktIntv)) && (pktLoss_cntIntv > (0.10 * expected_pktIntv)))  {
			duration = NW_STATUS_TIMER/2;
			PJ_LOG(5, (THIS_FILE, "generateFBPktOnNWStatus 10-20 loss"));
			goto TIMER_START;
		}else{
			duration = NW_STATUS_TIMER;
			PJ_LOG(5, (THIS_FILE, "generateFBPktOnNWStatus: less than 10 loss"));
			goto TIMER_START;
		}

TIMER_START:
{

	PJ_LOG(5, (THIS_FILE, "start timer "));
	//ssnInfo->fbPktInfo.fbNACKInfo = fbNACKInfo;
	timer_start((ses->mediaCompSsn->timer_hndl),&generateFBPktOnNWStatus,(void *)ses, (void *)ssnInfo,(duration));
}
}


TransportPktType getRTPPktType(const void *rxPkt)
{
	TransportPktType pkt_type = COMP_PKT_TYPE_MAX;
	 struct comp_so_pkt *pkt = (struct comp_so_pkt *)rxPkt;
	 if(!(pkt->pkt_typ | COMP_PKT_TYPE_COMPRESSED_SO)){
		pkt_type = COMP_PKT_TYPE_COMPRESSED_SO;
	 }else{
		 struct pjmedia_rtp_hdr *pkt_u = (struct pjmedia_rtp_hdr *)rxPkt;
		 pkt_type = pkt_u->v | COMP_PKT_TYPE_UNCOMPRESSED;
		 if(pkt_type == COMP_PKT_TYPE_UNCOMPRESSED){
				 pkt_type = COMP_PKT_TYPE_UNCOMPRESSED;
		 }else{
			 struct comp_fo_pkt *pkt_f = (struct comp_fo_pkt *)rxPkt;
			 pkt_type = pkt_f->pkt_typ | COMP_PKT_TYPE_COMPRESSED_FO;
			 if(pkt_type == COMP_PKT_TYPE_COMPRESSED_FO){
					pkt_type = COMP_PKT_TYPE_COMPRESSED_FO;
			 }else{
				 struct comp_feedback_ack_pkt *pkt_fb_A = (struct comp_feedback_ack_pkt *)rxPkt;
				 pkt_type = pkt_fb_A->pkt_typ | COMP_PKT_TYPE_ACK;
				 if(pkt_type == COMP_PKT_TYPE_ACK){
						pkt_type = COMP_PKT_TYPE_ACK;
				 }else{
				 struct comp_feedback_nack_pkt *pkt_fb_N = (struct comp_feedback_nack_pkt *)rxPkt;
				 pkt_type = pkt_fb_N->pkt_typ | COMP_PKT_TYPE_NACK;
				 if(pkt_type == COMP_PKT_TYPE_NACK)
						pkt_type = COMP_PKT_TYPE_NACK;
				 }
			 }
		}
	 }		

	PJ_LOG(5, (THIS_FILE, "RX: received pkt type %d",pkt_type));
	return pkt_type;
}
TransportRtnType parseRTP(TransportPktType pktType,compmedia_rtp_session *ses,
		compCommonInfo *sesInfo,const void *rxrtp, comp_uint16_t *rtp_len)
{
//	static struct fbNACK_info fbInfo = {0};
	compmedia_rtp_hdr *pkt_hdr = &(ses->mediaCompSsn->comp_rtp_hdr);
	sesInfo->fbPktInfo.errType = RTP_HDR_NONE;
	switch(pktType)	
	{
		case COMP_PKT_TYPE_ACK :
		{
			compFBACKPkt *fbACKPkt= (compFBACKPkt *)rxrtp;
		//	sesInfo->fbPktInfo.lastUpdatedSeqNum = pj_ntohs(fbACKPkt->seq);
			sesInfo->fbPktInfo.errType = RTP_HDR_DECONSTRUCT_SUCCESS;
		//	sesInfo->fbPktInfo.lastUpdatedTS = pj_ntohl(fbACKPkt->ts);
			ses->mediaCompSsn->dropkt = MEDIACOMP_TRUE;
			sesInfo->DLfbPktTyp |= COMP_PKT_FB_TYPE_ACK;
			*rtp_len = sizeof(compFBACKPkt);
			PJ_LOG(5,(THIS_FILE,"RX: ACK received [seqNum %d ts %ld]",
					pj_ntohs(fbACKPkt->seq),pj_ntohl(fbACKPkt->ts)));
		}
		break;
		case COMP_PKT_TYPE_NACK :
		{
			compFBNACKPkt *fbNACKPkt= (compFBNACKPkt *)rxrtp;
	//		sesInfo->fbPktInfo.lastUpdatedSeqNum =pj_ntohs(fbNACKPkt->seq);
			sesInfo->fbPktInfo.errType = RTP_HDR_DECONSTRUCT_SUCCESS;
			sesInfo->DLfbPktTyp |= COMP_PKT_FB_TYPE_NACK;
			ses->mediaCompSsn->dropkt = MEDIACOMP_TRUE;
			if (fbNACKPkt->status_bit == MEDIACOMP_TRUE){
				sesInfo->recvPktStatus.nackPktStatus= pj_ntohs(fbNACKPkt->u.pkt_arrv_status);
			//modifyContextOnpktLoss(COMP_PKT_TYPE_UNCOMPRESSED,RTP_HDR_UPDATE_PKTLOSS);
			}else{
	//			sesInfo->fbPktInfo.lastUpdatedTS = pj_ntohl(fbNACKPkt->u.ts);
			}
			*rtp_len = sizeof(compFBNACKPkt);
			PJ_LOG(5,(THIS_FILE,"RX: NACK received [seqNum %d ts %ld]",
								pj_ntohs(fbNACKPkt->seq),pj_ntohl(fbNACKPkt->u.ts)));
		}
		break;
		case COMP_PKT_TYPE_COMPRESSED_FO :
		{
			compFOPkt *foPkt  =(compFOPkt*)rxrtp;
			sesInfo->fbPktInfo.errType = RTP_HDR_DECONSTRUCT_SUCCESS;
			pkt_hdr->ts = pj_htonl(generateTimestamp(pj_ntohs(foPkt->ts), &(sesInfo->fbPktInfo.errType)));
			pkt_hdr->seq = pj_htons(generateSequence(pktType,foPkt->seq, &(sesInfo->fbPktInfo.errType)));
			*rtp_len = sizeof(compFOPkt);

			sesInfo->fbPktInfo.lastUpdatedSeqNum=pj_ntohs(pkt_hdr->seq);
			sesInfo->fbPktInfo.lastUpdatedTS=pj_ntohl(pkt_hdr->ts);
			sesInfo->fbPktInfo.fbNACKInfo.lastUpd_fullHdrSeqNum=pj_ntohs(pkt_hdr->seq);
			sesInfo->fbPktInfo.fbNACKInfo.pktLoss_LastUpdSN=sesInfo->fbPktInfo.total_PktLoss;
			setPktStatus(pj_ntohs(pkt_hdr->seq),&(sesInfo->fbPktInfo.total_PktLoss));

			PJ_LOG(5,(THIS_FILE,"RX: FO pkt received [seqNum %hu ts %u]",
					pj_ntohs(pkt_hdr->seq),pj_ntohl(pkt_hdr->ts)));
		}
		break;
		case COMP_PKT_TYPE_COMPRESSED_SO :
		{
			compSOPkt *soPkt  =(compSOPkt*)rxrtp;
			pkt_hdr->seq = pj_htons(generateSequence(pktType, soPkt->seqNum, &(sesInfo->fbPktInfo.errType)));
			pkt_hdr->ts = pj_htonl(getTimestamp(pj_ntohs(pkt_hdr->seq)));
			pkt_hdr->m= soPkt->marker_bit;

			sesInfo->fbPktInfo.lastUpdatedSeqNum=pj_ntohs(pkt_hdr->seq);
			sesInfo->fbPktInfo.errType = RTP_HDR_DECONSTRUCT_SUCCESS;
			setPktStatus(pj_ntohs(pkt_hdr->seq),&(sesInfo->fbPktInfo.total_PktLoss));

			*rtp_len = sizeof(compSOPkt);
			PJ_LOG(5,(THIS_FILE,"RX: SO pkt received [seqNum %hu ts %u]",
						pj_ntohs(pkt_hdr->seq),pj_ntohl(pkt_hdr->ts)));
		}
		break;
		case COMP_PKT_TYPE_UNCOMPRESSED :
		{
			compmedia_rtp_hdr *fullPkt  =(compmedia_rtp_hdr *)rxrtp;
			setStaticDynamicRTPContext(pj_ntohs(fullPkt->seq),pj_ntohl(fullPkt->ts),sesInfo->Codec.sampling_rate);
			if (ses->peer_ssrc == 0)
				 ses->peer_ssrc = pj_ntohl(fullPkt->ssrc);
			
			if(VALIDATE_INCOMING_RTP_PKT(ses,fullPkt)){
				memcpy(&(ses->mediaCompSsn->comp_rtp_hdr), fullPkt,sizeof(compmedia_rtp_hdr));

				sesInfo->fbPktInfo.lastUpdatedSeqNum=pj_ntohs(fullPkt->seq);
				sesInfo->fbPktInfo.fbNACKInfo.lastUpd_fullHdrSeqNum=pj_ntohs(fullPkt->seq);
				sesInfo->fbPktInfo.lastUpdatedTS=pj_ntohl(fullPkt->ts);
				setPktStatus(pj_ntohs(fullPkt->seq),&(sesInfo->fbPktInfo.total_PktLoss));
				sesInfo->fbPktInfo.fbNACKInfo.pktLoss_LastUpdSN=sesInfo->fbPktInfo.total_PktLoss;


			//	fbInfo.lastUpd_fullHdrSeqNum = pj_ntohs(fullPkt->seq);
			//	fbInfo.lastUpd_fullHdrTS= pj_ntohl(fullPkt->ts);
			//	fbInfo.pktLoss_LastUpdSN = sesInfo->fbPktInfo.total_PktLoss;
				sesInfo->fbPktInfo.errType = RTP_HDR_DECONSTRUCT_SUCCESS;
			}else{
				ses->mediaCompSsn->dropkt = MEDIACOMP_TRUE;
				sesInfo->fbPktInfo.errType = RTP_HDR_PARSING_ERROR;
				//need to observe for few pkt and then update drop the packet 
			}
			*rtp_len = sizeof(compmedia_rtp_hdr);
			PJ_LOG(5,(THIS_FILE,"RX: IR pkt received [pt %d ssrc %x seqNum %hu ts %u] recv pt %d peerssrc %x",
					pkt_hdr->pt,pj_ntohl(pkt_hdr->ssrc),pj_ntohs(pkt_hdr->seq),pj_ntohl(pkt_hdr->ts),
					fullPkt->pt, ses->peer_ssrc));
		}
		break;
		default :
		{
			PJ_LOG(5, (THIS_FILE, "parseRTP: Default value"));
			return MEDIACOMP_FAILURE;
				
		}
	}

	

	return MEDIACOMP_SUCCESS;
}			

