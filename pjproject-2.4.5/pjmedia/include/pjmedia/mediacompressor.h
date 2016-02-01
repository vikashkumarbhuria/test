#ifndef __MEDIACOMPRESSOR_H__
#define __MEDIACOMPRESSOR_H__
//#include <pjmedia/rtp.h>
#include <pjmedia/errno.h>
#include <pj/log.h>
#include <pj/sock.h>	/* pj_htonx, pj_htonx */
#include <pj/assert.h>
#include <pj/rand.h>
#include <pj/string.h>
#include <pjmedia/stream.h>
#if 0
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <string.h>
#endif
#define RTP_SEQ_MOD	(1 << 16)
#define MAX_DROPOUT 	((comp_int16_t)3000)
#define MAX_MISORDER 	((comp_int16_t)100)
#define MIN_SEQUENTIAL  ((comp_int16_t)2)
#define NW_STATUS_TIMER 2

#define MEDIACOMP_TRUE 1
#define MEDIACOMP_FALSE 0

#define TX_LOG TX:
#define RX_LOG TX:

typedef unsigned long comp_uint64_t;
typedef unsigned char	comp_uint8_t;
typedef unsigned int	comp_uint32_t;
typedef unsigned short	comp_uint16_t;
typedef short		comp_int16_t;

typedef struct pjmedia_transport compmedia_transport;
typedef struct MediaCompSsn compmedia_rtpcomp_session;
typedef struct pj_pool_t comp_pool_t;
typedef struct pjmedia_rtp_session compmedia_rtp_session;
typedef struct pjmedia_rtp_hdr compmedia_rtp_hdr;

typedef enum
{
	MEDIACOMP_SUCCESS =0,
	MEDIACOMP_FAILURE =-1,
	MEDIACOMP_NONE
}TransportRtnType;

typedef enum
{
	COMP_FLOW_MODE_UNIDIRECTIONAL = 0,
	COMP_FLOW_MODE_BIDIRECTIONAL,
	COMP_FLOW_MODE_NONE,
	COMP_FLOW_MODE_MAX
}OperationMode;
#if defined(PJ_IS_BIG_ENDIAN) && (PJ_IS_BIG_ENDIAN!=0)
typedef enum
{
	COMP_PKT_TYPE_COMPRESSED_SO =0x01,
	COMP_PKT_TYPE_UNCOMPRESSED= 0x02 ,
	COMP_PKT_TYPE_COMPRESSED_FO = 0x04,
	COMP_PKT_TYPE_ACK=0x08,
	COMP_PKT_TYPE_NACK=0x10,
	COMP_PKT_TYPE_MAX
}TransportPktType;
#else
typedef enum
{
	COMP_PKT_TYPE_COMPRESSED_SO =0x00,
	COMP_PKT_TYPE_UNCOMPRESSED= 0x02 ,
	COMP_PKT_TYPE_COMPRESSED_FO = 0x06,
	COMP_PKT_TYPE_ACK=0x0E,
	COMP_PKT_TYPE_NACK=0x1E,
	COMP_PKT_TYPE_MAX
}TransportPktType;
#endif

typedef enum
{
	COMP_PKT_FB_TYPE_NONE = 0x00,
	COMP_PKT_FB_TYPE_ACK=0x01,
	COMP_PKT_FB_TYPE_NACK=0x02,
	COMP_PKT_FB_TYPE_MAX
}fbPktTypes;


typedef enum
{
	COMP_STATE_IR = 0,
	COMP_STATE_FO,
	COMP_STATE_SO,
	COMP_STATE_NONE,
	COMP_STATE_MAX
}OperationState;

typedef enum{
	COMP_DECOMP_STATE_NOCONTEXT =0,
	COMP_DECOMP_STATE_STATICCONTEXT,
	COMP_DECOMP_STATE_FULLCONTEXT,
	COMP_DECOMP_STATE_NONE,
	COMP_DECOMP_STATE_MAX
}Decomp_OperationState;

typedef enum{
	RTP_HDR_NONE = 0,
	RTP_HDR_PARSING_ERROR, // on fail of paring of rtp hdr, NACK will be sent with sequence number and timestamp of last success packet
	RTP_HDR_STATUS_UPDATE,    //Send NACK updating last 15 packet status along with sequence number
	RTP_HDR_CONSTRUCT_SUCCESS,
	RTP_HDR_DECONSTRUCT_SUCCESS,
	RTP_HDR_UPDATE_PKTLOSS,
	RTP_HDR_PARSING_DROP_PACKET,
	RTP_HDR_MAX
}errType;
struct fbNACK_info
{
	comp_uint16_t lastUpd_fullHdrSeqNum;
	comp_uint32_t lastUpd_fullHdrTS;
	comp_uint32_t pktLoss_LastUpdSN;
	comp_uint16_t nackSentCount;  //nack send count indicates, number of nacks sent in the window interval of MAX_NACK_SENT_INTERVAL
};
typedef struct DeComp_SsnInfo
{
	comp_uint8_t isReqHdrPktRecvd;
	comp_uint16_t nackPktStatus;
}deCompInfo;

typedef struct mediacomp_fb_hdr
{
	comp_uint16_t lastUpdatedSeqNum;
	comp_uint32_t lastUpdatedTS;
	comp_uint32_t total_PktLoss;
	TransportPktType fbPktType;
	errType errType; //decide need to send Nack with timestamp or last lost packet status update
	struct fbNACK_info fbNACKInfo; 
}FBhdr;


typedef struct MediaComp_Codec_Info
{
       unsigned clock_value;
	   comp_uint16_t sampling_rate;
	   char  *codec_name;	
} MediaCompCodecInfo;



typedef TransportRtnType(*fptrStateCmdhndlr)(compmedia_rtp_session *ses, int *hdrlen);
typedef TransportRtnType(*fptrModeCmdhndlr)(compmedia_rtp_session *ses, int *hdrlen);
typedef TransportRtnType(*fptrDecompStateCmdhndlr)(compmedia_rtp_session *ses,TransportPktType pktType);


typedef struct pjmedia_rtpcomp_commomninfo
{
	comp_uint8_t sendFB;
	comp_uint16_t isUModeTimerExpired;
	comp_uint16_t uModeSOPktPeriod;
	pthread_t threadId;
	fbPktTypes  DLfbPktTyp;   //on receiving ACK, make this to true, and whenever during the call,ack not received ake it false
	pjmedia_dir streamDir;
	OperationMode Comp_Mode;
	OperationState Comp_State;
	Decomp_OperationState DeComp_State;
	fptrStateCmdhndlr fptrStateFSM[COMP_STATE_MAX];
	fptrModeCmdhndlr fptrModeFSM[COMP_FLOW_MODE_MAX];
	fptrDecompStateCmdhndlr fptrDLStateFSM[COMP_DECOMP_STATE_MAX];
	FBhdr fbPktInfo;
	deCompInfo recvPktStatus;
	MediaCompCodecInfo Codec;
}compCommonInfo;


TransportRtnType MediaComp_DeComp_init(comp_pool_t *pool,compmedia_rtp_session *ses, pjmedia_dir dir);
void MediaComp_DeComp_deInit();
TransportRtnType MediaComp_generateRTP(compmedia_rtp_session *ses,
					     int pt, int m,
					     int payload_len, int ts_len,
					     const void **rtphdr, 
					     int *hdrlen);


TransportRtnType MediaComp_Mode_U(compmedia_rtp_session *ses, int *hdrlen );
TransportRtnType MediaComp_Mode_B(compmedia_rtp_session *ses, int *hdrlen );
TransportRtnType MediaComp_State_IR(compmedia_rtp_session *ses, int *hdrlen);
TransportRtnType MediaComp_State_FO(compmedia_rtp_session *ses, int *hdrlen);
TransportRtnType MediaComp_State_SO(compmedia_rtp_session *ses, int *hdrlen);
TransportRtnType MediaComp_processInRTPpkt( compmedia_rtp_session *ses,
					    const void *pkt, int pkt_len,
					    const compmedia_rtp_hdr **hdr,
					    const void **payload,
					    unsigned *payloadlen);

void setTransportStream(pjmedia_transport *transport);
TransportRtnType MediaDeComp_State_NoContext(compmedia_rtp_session *ses,TransportPktType pktType);
TransportRtnType MediaDeComp_State_StaticContext(compmedia_rtp_session *ses,TransportPktType pktType);
TransportRtnType MediaDeComp_State_FullContext(compmedia_rtp_session *ses,TransportPktType pktType);
void modifyContextOnpktLoss(TransportPktType rtpPktType,errType errStatus);


#endif

