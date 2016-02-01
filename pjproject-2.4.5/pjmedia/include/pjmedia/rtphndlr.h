#ifndef __RTPHNDLR_H__
#define __RTPHNDLR_H__



struct pktarrival_info
{
	comp_uint16_t expectedPkt_Intv;
	comp_uint16_t pktLoss_Intv;
	comp_uint16_t lastPktSeq;
};
struct comp_rtpHdrGen_info
{
	comp_uint64_t seqNumBuff;//need to store the pkt arrival to status, ensures the duplicate pkt
	comp_uint16_t base_seq;
	comp_uint32_t base_ts;
	comp_uint16_t codec_freq;
	comp_uint64_t SsnPktLoss;
	comp_uint64_t SsnPktRecvd;
	comp_uint8_t isFirstInterval;
	struct pktarrival_info pktArrvInfo;
};

struct comp_so_pkt
{
#if defined(PJ_IS_BIG_ENDIAN) && (PJ_IS_BIG_ENDIAN!=0)
    comp_uint8_t pkt_typ:1;
    comp_uint8_t marker_bit:1;
    comp_uint8_t seqNum:6;
#else
    comp_uint8_t seqNum:6;
	comp_uint8_t marker_bit:1;
	comp_uint8_t pkt_typ:1;
#endif
};
struct comp_fo_pkt
{
#if defined(PJ_IS_BIG_ENDIAN) && (PJ_IS_BIG_ENDIAN!=0)
    comp_uint8_t pkt_typ:3;
    comp_uint8_t marker_bit:1;
    comp_uint8_t length:4;
#else
    comp_uint8_t length:4;
    comp_uint8_t marker_bit:1;
    comp_uint8_t pkt_typ:3;
#endif
    comp_uint8_t seq;
    comp_uint16_t ts;
};
#pragma pack(1)
struct comp_feedback_nack_pkt
{
#if defined(PJ_IS_BIG_ENDIAN) && (PJ_IS_BIG_ENDIAN!=0)
    comp_uint8_t pkt_typ:5;
    comp_uint8_t status_bit:1;
    comp_uint8_t length:2;
#else
    comp_uint8_t length:2;
    comp_uint8_t status_bit:1;
    comp_uint8_t pkt_typ:5;
#endif
    comp_uint16_t seq;
    union       {
        comp_uint16_t pkt_arrv_status;
        comp_uint32_t ts;
    }u;
};
#pragma()

typedef struct comp_so_pkt compSOPkt;
typedef struct comp_fo_pkt compFOPkt;
typedef struct comp_feedback_nack_pkt compFBNACKPkt;


TransportRtnType generateRTPPkt(TransportPktType pktType,compmedia_rtp_session *ses,compCommonInfo *sesInfo,int *hdrlen);
TransportPktType getRTPPktType(const void *pkt);
TransportRtnType setPktStatus(comp_uint16_t seqNum,comp_uint32_t *total_pkt_loss);
TransportRtnType parseRTP(TransportPktType pktType,compmedia_rtp_session *ses,
		compCommonInfo *sesInfo,const void *rxrtp, comp_uint16_t *rtp_len);
void generateFBPktOnNWStatus(compmedia_rtp_session *ses, compCommonInfo *ssnInfo);
comp_uint16_t getPktStatus(comp_uint16_t seqNum);

void Seq_Time_Cal_Init_DeInit();
void setStaticDynamicRTPContext(comp_uint16_t uncomp_seq, comp_uint32_t uncomp_ts,comp_uint16_t samp_freq );
comp_uint32_t getTimestamp(comp_uint16_t full_seq);
comp_uint16_t generateTimestamp(comp_uint16_t FO_timestamp , errType *status);
comp_uint16_t generateSequence(TransportPktType Pkt_Type , comp_uint16_t seq,errType *status);

#endif	/* __PJMEDIA_RTP_H__ */



