-- create TMS view:
CREATE OR REPLACE VIEW  PRD_NAM.NAM_DWH.V_PBI_D_TMS AS (
    -- select columns:
    SELECT
        SHP_LEG_PIC_TRL_LOA_TYP_DSC,
        SHP_CBU_REF_DOC_TYP,
        SCH_TEM_COD,
        MAT_TYP_COD,
        LOA_IDT_COD,
        SHP_LEG_IDT_COD,
        SHP_LEG_DRP_APP_DAT,
        TMS_LOA_LNE_DRP_APP_DAT,
        SAL_ORG_COD,
        DIS_CHL_COD,
        CUS_COD,
        TMS_LOA_LNE_PIC_APP_DAT,
        SHP_LEG_DRP_ORD_GRS_WGH_LBS_CSL_VAL,
        SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL,
        SHP_LEG_PIC_APP_DAT,
        SHP_LEG_PIC_FNC_DAT,
        SHP_LEG_PIC_FNC_DSC,
        SHP_LEG_ACT_MVT_DAT,
        SHP_CNY_DSC,
        LOA_CBU_REF_NUM,
        LOA_ATV_TDR_SCA_COD,
        LOA_ATV_TDR_IDT_DSC,
        LOA_CUS_PIC_FLG,
        SHP_DEL_DOC_NUM,
        SHP_SAL_CUS_PUR_DOC_DAT,
        SHP_SAL_CUS_PUR_DOC_DAT_TIM,
        SHP_SAL_CUS_PUR_DOC_NUM,
        SHP_LEG_DEL_TYP_DSC,
        SHP_LEG_DRP_1ST_ADR_DSC,
        SHP_LEG_DRP_2ND_ADR_DSC,
        SHP_LEG_DRP_APP_CRE_TIM,
        SHP_LEG_DRP_APP_TIM,
        SHP_LEG_DRP_APP_WIN_END_TIM,
        SHP_LEG_DRP_APP_WIN_BGN_TIM,
        SHP_LEG_DRP_ARV_TIM,
        SHP_LEG_DRP_CTY_DSC,
        SHP_LEG_DRP_CRY_COD,
        SHP_LEG_DRP_WIN_BGN_TIM,
        SHP_LEG_DRP_ADU_TIM,
        SHP_LEG_DRP_DCK_END_TIM,
        SHP_LEG_DRP_DCK_BGN_TIM,
        SHP_LEG_DRP_ARV_GTE_TIM,
        SHP_LEG_DRP_DEP_GTE_TIM,
        SHP_LEG_DRP_LOA_END_TIM,
        SHP_LEG_DRP_LOA_BGN_TIM,
        SHP_LEG_DRP_STE_COD,
        SHP_LEG_DRP_PST_COD,
        SHP_LEG_DRP_CBU_COD,
        SHP_LEG_DRP_NAM_COD,
        SHP_LEG_INB_OTB_DSC,
        SHP_LEG_PIC_FNC_TIM,
        SHP_LEG_DRP_CUS_COD,
        INBOUND_SHP_LEG_DRP_NAM_COD,
        LOA_CNL_TIM,
        LOA_CLO_TIM,
        LOA_CRE_TIM,
        LOA_GRP_DSC,
        LOA_STS_DSC,
        LOA_TYP_DSC,
        LOA_TRP_MDE_DSC,
        LOA_PIC_DRP_STP_FLG,
        SHP_ORD_DOC_NUM,
        SHP_LEG_PIC_CBU_COD,
        SHP_LEG_PIC_1ST_ADR_DSC,
        SHP_LEG_PIC_2ND_ADR_DSC,
        SHP_LEG_PIC_APP_CRE_TIM,
        SHP_LEG_PIC_APP_WIN_END_TIM,
        SHP_LEG_PIC_APP_WIN_BGN_TIM,
        SHP_LEG_PIC_ARV_TIM,
        SHP_LEG_PIC_CTY_DSC,
        SHP_LEG_PIC_CRY_COD,
        SHP_LEG_PIC_ADU_TIM,
        SHP_LEG_PIC_NAM_COD,
        SHP_LEG_PIC_DCK_END_TIM,
        SHP_LEG_PIC_DCK_BGN_TIM,
        SHP_LEG_PIC_ARV_GTE_TIM,
        SHP_LEG_PIC_DEP_GTE_TIM,
        SHP_LEG_PIC_LOA_END_TIM,
        SHP_LEG_PIC_LOA_BGN_TIM,
        SHP_LEG_PIC_STE_COD,
        SHP_LEG_PIC_PST_COD,
        SHP_LEG_DRP_INI_RQT_DEL_DAT,
        SHP_LEG_DRP_INI_RQT_DEL_DAT_TIM,
        LOA_TRK_RWK_FLG,
        SHP_CNY_SAL_ORG_COD,
        SHP_LEG_WRH_LOA_SEQ_NUM,
        SHP_LEG_STS_DSC,
        LOA_TRK_USG_FLG,
        SHP_LEG_PAY_CUR_COD,
        SHP_LEG_RTE_UOM_COD,
        SHP_LEG_DRP_DOC_UOM_COD,
        LAN_RUN_TOT,
        AB_CRB_CHG,
        PLN_SHP_CAR,
        PLN_SHP_NET_KLS,
        PLN_SHP_NET_LBS,
        ORI_PLN_SHP_CAR,
        ORI_PLN_SHP_NET_KLS,
        ORI_PLN_SHP_NET_LBS,
        SHP_GRS_KG,
        SHP_GRS_VOL_CUS_PIK,
        SHP_NET_KLS,
        SHP_NET_LBS_DEL,
        SHP_NET_LBS_PIK,
        NUM_OF_STP,
        OTD_APP_FOR_CAR_SHP_2HR_DEN_DRP,
        OTD_APP_FOR_CAR_SHP_0HR,
        OTD_APP_FOR_CAR_SHP_2HR,
        OTD_APP_FOR_CAR_SHP_6HR,
        ATD_APP_PIK_FOR_CAR_SHP_0HR,
        OT_APP_FOR_CAR_SHP_2HR_DEN,
        OT_APP_PIK_FOR_CAR_SHP_2HR,
        PLN_SHP_GRS_VOL,
        ORD_GRS_VOL,
        PLN_SHP_GRS_KLS,
        OTD_APP_PIK_FOR_CPU_2HR_DEN,
        OT_APP_PIK_FOR_CPU_2HR,
        OT_APP_PIK_FOR_CPU_0HR,
        OT_APP_PIK_FOR_CPU_6HR,
        OT_APP_PIK_FOR_CAR_SHP_05HR,
        OTD_APP_FOR_CAR_SHP_05HR,
        OT_APP_PIK_CAR_SHP_6HR,
        OTD_APP_CAR_SHP_6HR,
        LAN_MLS,
        SCR_ERL_CAR_SHP_CAR,
        SCR_XCT_CAR_SHP_CAR,
        SHP_LEG_DRP_DEL_CAR_CSL_QTY,
        SCR_ERL_CPU_CAR,
        SCR_XCT_CPU_CAR,
        OT_ORI_RQT_PIK_FOR_CPU,
        OT_ORI_RQT_DEL_FOR_CAR_SHP,
        TOT_ORD_PIK,
        OT_RQT_DEL_FOR_CAR_SHP,
        GRS_WGH_CAR_LBS,
        ON_TIM_DEL_TO_RQS_DAY,
        ON_TIM_DEL_TO_RDD,
        WJXBFS1,
        WJXBFS2,
        WJXBFS3,
        WJXBFS4,
        WJXBFS5,
        ORD_CNT_OTD_FLG,
        ORD_CAR,
        ORD_CAS_CUS_DEL,
        ORD_CAS_CUS_PIC,
        SHP_CAR,
        SHP_NET_LBS_CUS_DEL,
        SHP_NET_LBS_IM,
        SHP_NET_LBS_LTL,
        SHP_NET_LBS_TL,
        SHP_GRS_VOL,
        SHP_GRS_VOL_CUS_DEL,
        SHP_GRS_VOL_IM,
        SHP_GRS_VOL_LTL,
        SHP_GRS_VOL_TL,
        SHP_NET_VOL,
        SCR_ERL_DEL_CAR,
        OTD_APP_CPU_DEN,
        OTD_APP_DEL_DEN_PIC_TRL,
        OTD_APP_FOR_CAR_SHP_0HR_DEN_DRP,
        OTD_APP_FOR_CAR_SHP_05HR_DEN_DRP,
        OTD_APP_FOR_CAR_SHP_6HR_DEN_DRP,
        OTD_APP_PIK_UP_FOR_CAR_SHP_0HR,
        OTD_APP_PIK_UP_FOR_CAR_SHP_05HR,
        OTD_APP_PIK_UP_FOR_CAR_SHP_2HR,
        OTD_ORI_REQ_CPU,
        ACD,
        ALT_CAR_DEL,
        CAR_DIS_ERR,
        CAR_KEY_ERR,
        CON_CLO,
        CON_RLD,
        CRD_HLD,
        CUS_REQ_FTR_DEL,
        CUS_WAN_ERL_DEL,
        CUS_IMP_EXP,
        DEL_SRT,
        DRV_NOT_AVL,
        DRV_RLD,
        EXC_SRV,
        HEL_PER_SHP,
        HOL_CLO,
        ICR_ADD,
        IDR_DEL,
        ISF_DEL_TIM,
        ISF_PIK_UP_TIM,
        ISF_TIM_CPL_DEL,
        LOA_SHF,
        MEC_BRK,
        MIS_SRT,
        MIS_DEL,
        MIS_PIK_UP,
        OTH,
        OTH_CAR_REL,
        PRA_APT,
        PRV_STP,
        PDT_FAL,
        RIL_FAI_MET_SCH,
        RFS_BY_CUS,
        ROD_CDT,
        SHP_REL,
        TRL_CLS_NOT_AVL,
        TRL_NOT_AVL,
        TRL_NOT_USA_PRI_PDT,
        TRL_CVT_NOT_AVL,
        TRN_DER,
        NBL_LOC,
        WTH_NAT_DIS_REL,
        ADD_DAY,
        CUS_DCT,
        APP_FEE,
        BAS_LHL_DOL,
        DTL_DTN_AT_ORI_DOL,
        DTL_DTN_AT_DEL_DOL,
        GST_GRL_SAL_TAX_DOL,
        HAR_HRM_SAL_TAX_DOL,
        NB_HST_NEW_BRK_TAX_DOL,
        NL_HST_NFD_TAX_DOL,
        NS_HST_NOV_SCT_TAX_DOL,
        ON_HST_ONT_TAX_DOL,
        QC_PST_QBC_TAX_DOL,
        SOC_STP_OFF_DOL,
        UND_ULD_LMP_DOL,
        BAS_ITM,
        BC_CRB_CHG,
        BNR_FRT,
        CA_FUL_TAX,
        CND_GST,
        CRS_DCK_SRG,
        CRS_DCK_SPT_FRT_CLD,
        CUS_REF_FSC,
        DAD_HAD,
        DCT,
        DEL_SRG,
        DTN,
        DTN_AT_DST,
        DTN_AT_ORI,
        DTV_VHC_DTN,
        DTY_CHG,
        EMS_SRG,
        XTR_LBR,
        FUE_MDF_FSC,
        FUL_ADJ_FOR_WST_CND,
        FUL_SRG,
        GST_GNL_SAL_TAX,
        GST_ON_GNL_SAL_TAX,
        INS_DEL,
        LBR_RPR_AND_RTN_ORD,
        LAY,
        LIN_HUL,
        LMP,
        MTR_ARA_FEE,
        MIN_DEL_CHG,
        MDF,
        NA_FUL_ADJ_FOR_WST_CND,
        NEW_BRN_TAX,
        NEW_FND_TAX,
        NIG_DEL,
        NOT_PRI_TO_DEL,
        NOV_SCT_TAX,
        OFF_HRS_DEL,
        OTR_TAX,
        OTR_CHG,
        OUT_OF_RUT_MLS,
        PIK_CHG,
        QBC_TAX,
        RCC,
        RDL,
        REF_FSC,
        RTN,
        SND_DAY_DEL,
        SRT_AND_SEG_CHG,
        SPL_DEL,
        STP_ODD_CHG,
        STG,
        TEM_SRV,
        TOT_TRP,
        TRD_SHW_XPO_DEL,
        TRK_ORD_NOT_USD,
        UND,
        NLD_FEE,
        WTG_WAT_TIM,
        WLM_LMP,
        WND_DEL_CHG,
        WND_HLD_CHG
) AS
-- select:
SELECT
    TMS_LOA_LNE.SHP_LEG_PIC_TRL_LOA_TYP_DSC SHP_LEG_PIC_TRL_LOA_TYP_DSC,
    TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP         SHP_CBU_REF_DOC_TYP,
    TMS_LOA_LNE.SCH_TEM_COD                 SCH_TEM_COD,
    TMS_LOA_LNE.MAT_TYP_COD                 MAT_TYP_COD,
    TMS_LOA_LNE.LOA_IDT_COD                 LOA_IDT_COD,
    TMS_LOA_LNE.SHP_LEG_IDT_COD             SHP_LEG_IDT_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT         SHP_LEG_DRP_APP_DAT,
    -- case when:
    CASE 
        WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
        THEN TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT
    -- END:
    END AS TMS_LOA_LNE_DRP_APP_DAT,
    TMS_LOA_LNE.SAL_ORG_COD AS SAL_ORG_COD,
    TMS_LOA_LNE.DIS_CHL_COD AS DIS_CHL_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_CUS_COD AS CUS_COD,
    -- case when:
    CASE
        WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
        THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT
    -- END:    
    END AS TMS_LOA_LNE_PIC_APP_DAT,
    -- select column and create alias:
    TMS_LOA_LNE.SHP_LEG_DRP_ORD_GRS_WGH_LBS_CSL_VAL SHP_LEG_DRP_ORD_GRS_WGH_LBS_CSL_VAL,
    TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL,
    TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT                 SHP_LEG_PIC_APP_DAT,
    TMS_LOA_LNE.SHP_LEG_PIC_FNC_DAT                 SHP_LEG_PIC_FNC_DAT,
    -- extract max value of SHP_LEG_PIC_FNC_DSC:
    MAX(TMS_LOA_LNE.SHP_LEG_PIC_FNC_DSC)            SHP_LEG_PIC_FNC_DSC,
    TMS_LOA_LNE.SHP_LEG_ACT_MVT_DAT                 SHP_LEG_ACT_MVT_DAT,
    TMS_LOA_LNE.SHP_CNY_DSC                         SHP_CNY_DSC,
    TMS_LOA_LNE.LOA_CBU_REF_NUM                     LOA_CBU_REF_NUM,
    TMS_LOA_LNE.LOA_ATV_TDR_SCA_COD                 LOA_ATV_TDR_SCA_COD,
    TMS_LOA_LNE.LOA_ATV_TDR_IDT_DSC                 LOA_ATV_TDR_IDT_DSC,
    TMS_LOA_LNE.LOA_CUS_PIC_FLG                     LOA_CUS_PIC_FLG,
    TMS_LOA_LNE.SHP_DEL_DOC_NUM                     SHP_DEL_DOC_NUM,
    TMS_LOA_LNE.SHP_SAL_CUS_PUR_DOC_DAT             SHP_SAL_CUS_PUR_DOC_DAT,
    -- extract MAX Date of SHP_SAL_CUS_PUR_DOSC_DAT
    MAX(TO_DATE(TO_CHAR(TMS_LOA_LNE.SHP_SAL_CUS_PUR_DOC_DAT),'yyyymmdd'))
                                        SHP_SAL_CUS_PUR_DOC_DAT_TIM,
    TMS_LOA_LNE.SHP_SAL_CUS_PUR_DOC_NUM     SHP_SAL_CUS_PUR_DOC_NUM,
    TMS_LOA_LNE.SHP_LEG_DEL_TYP_DSC         SHP_LEG_DEL_TYP_DSC,
    TMS_LOA_LNE.SHP_LEG_DRP_1ST_ADR_DSC     SHP_LEG_DRP_1ST_ADR_DSC,
    TMS_LOA_LNE.SHP_LEG_DRP_2ND_ADR_DSC     SHP_LEG_DRP_2ND_ADR_DSC,
    -- CASE WHEN:
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_CRE_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_CRE_TIM END AS SHP_LEG_DRP_APP_CRE_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM END AS SHP_LEG_DRP_APP_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM END AS SHP_LEG_DRP_APP_WIN_END_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_BGN_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_BGN_TIM END AS SHP_LEG_DRP_APP_WIN_BGN_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM END AS SHP_LEG_DRP_ARV_TIM,
    TMS_LOA_LNE.SHP_LEG_DRP_CTY_DSC AS SHP_LEG_DRP_CTY_DSC,
    TMS_LOA_LNE.SHP_LEG_DRP_CRY_COD AS SHP_LEG_DRP_CRY_COD,
    -- CASE WHEN
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_WIN_BGN_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_WIN_BGN_TIM END     SHP_LEG_DRP_WIN_BGN_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_ADU_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_ADU_TIM END       SHP_LEG_DRP_ADU_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_DCK_END_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_DCK_END_TIM END     SHP_LEG_DRP_DCK_END_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_DCK_BGN_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_DCK_BGN_TIM END     SHP_LEG_DRP_DCK_BGN_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_ARV_GTE_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_ARV_GTE_TIM END     SHP_LEG_DRP_ARV_GTE_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_DEP_GTE_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_DEP_GTE_TIM END     SHP_LEG_DRP_DEP_GTE_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_LOA_END_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_LOA_END_TIM END     SHP_LEG_DRP_LOA_END_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_LOA_BGN_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_DRP_LOA_BGN_TIM END     SHP_LEG_DRP_LOA_BGN_TIM,
    TMS_LOA_LNE.SHP_LEG_DRP_STE_COD AS SHP_LEG_DRP_STE_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_PST_COD AS SHP_LEG_DRP_PST_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_CBU_COD AS SHP_LEG_DRP_CBU_COD,
    MAX(TMS_LOA_LNE.SHP_LEG_DRP_NAM_COD) AS SHP_LEG_DRP_NAM_COD,
    TMS_LOA_LNE.SHP_LEG_INB_OTB_DSC AS SHP_LEG_INB_OTB_DSC,
    -- CASE WHEN:
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_FNC_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_FNC_TIM END AS SHP_LEG_PIC_FNC_TIM,
    CASE WHEN TMS_LOA_LNE.SHP_LEG_INB_OTB_DSC = 'INBOUND' THEN TMS_LOA_LNE.SHP_LEG_DRP_CBU_COD ELSE '#' END AS SHP_LEG_DRP_CUS_COD,
    MAX(
        CASE
            WHEN TMS_LOA_LNE.SHP_LEG_INB_OTB_DSC = 'INBOUND'
            THEN TMS_LOA_LNE.SHP_LEG_DRP_NAM_COD
            ELSE TMS_LOA_LNE.SHP_LEG_INB_OTB_DSC
        END) AS INBOUND_SHP_LEG_DRP_NAM_COD,
    -- CASE WHEN:
    CASE WHEN TO_DATE(TMS_LOA_LNE.LOA_CNL_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.LOA_CNL_TIM END AS LOA_CNL_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.LOA_CLO_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.LOA_CLO_TIM END AS LOA_CLO_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.LOA_CRE_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.LOA_CRE_TIM END AS LOA_CRE_TIM,
    TMS_LOA_LNE.LOA_GRP_DSC AS LOA_GRP_DSC,
    TMS_LOA_LNE.LOA_STS_DSC AS LOA_STS_DSC,
    TMS_LOA_LNE.LOA_TYP_DSC AS LOA_TYP_DSC,
    TMS_LOA_LNE.LOA_TRP_MDE_DSC AS LOA_TRP_MDE_DSC,
    TMS_LOA_LNE.LOA_PIC_DRP_STP_FLG AS LOA_PIC_DRP_STP_FLG,
    TMS_LOA_LNE.SHP_ORD_DOC_NUM AS SHP_ORD_DOC_NUM,
    TMS_LOA_LNE.SHP_LEG_PIC_CBU_COD AS SHP_LEG_PIC_CBU_COD,
    TMS_LOA_LNE.SHP_LEG_PIC_1ST_ADR_DSC AS SHP_LEG_PIC_1ST_ADR_DSC,
    TMS_LOA_LNE.SHP_LEG_PIC_2ND_ADR_DSC AS SHP_LEG_PIC_2ND_ADR_DSC,
    -- CASE WHEN:
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_APP_CRE_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_CRE_TIM END AS SHP_LEG_PIC_APP_CRE_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM END AS SHP_LEG_PIC_APP_WIN_END_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_BGN_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_BGN_TIM END AS SHP_LEG_PIC_APP_WIN_BGN_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM END AS SHP_LEG_PIC_ARV_TIM,
    TMS_LOA_LNE.SHP_LEG_PIC_CTY_DSC AS SHP_LEG_PIC_CTY_DSC,
    TMS_LOA_LNE.SHP_LEG_PIC_CRY_COD AS SHP_LEG_PIC_CRY_COD,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_ADU_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_ADU_TIM END AS SHP_LEG_PIC_ADU_TIM,
    TMS_LOA_LNE.SHP_LEG_PIC_NAM_COD AS SHP_LEG_PIC_NAM_COD,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_DCK_END_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_DCK_END_TIM END AS SHP_LEG_PIC_DCK_END_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_DCK_--BGN_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_DCK_BGN_TIM END AS SHP_LEG_PIC_DCK_BGN_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM END     SHP_LEG_PIC_ARV_GTE_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_DEP_GTE_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_DEP_GTE_TIM END     SHP_LEG_PIC_DEP_GTE_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_LOA_END_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_LOA_END_TIM END     SHP_LEG_PIC_LOA_END_TIM,
    CASE WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_LOA_BGN_TIM) = '1000-01-01' THEN NULL ELSE TMS_LOA_LNE.SHP_LEG_PIC_LOA_BGN_TIM END     SHP_LEG_PIC_LOA_BGN_TIM,
    TMS_LOA_LNE.SHP_LEG_PIC_STE_COD AS SHP_LEG_PIC_STE_COD,
    TMS_LOA_LNE.SHP_LEG_PIC_PST_COD AS SHP_LEG_PIC_PST_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT AS SHP_LEG_DRP_INI_RQT_DEL_DAT,
    MAX(to_date(TO_CHAR(TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT),'yyyymmdd')) AS SHP_LEG_DRP_INI_RQT_DEL_DAT_TIM,
    TMS_LOA_LNE.LOA_TRK_RWK_FLG AS LOA_TRK_RWK_FLG,
    TMS_LOA_LNE.SHP_CNY_SAL_ORG_COD AS SHP_CNY_SAL_ORG_COD,
    TMS_LOA_LNE.SHP_LEG_WRH_LOA_SEQ_NUM AS SHP_LEG_WRH_LOA_SEQ_NUM,
    TMS_LOA_LNE.SHP_LEG_STS_DSC AS SHP_LEG_STS_DSC,
    TMS_LOA_LNE.LOA_TRK_USG_FLG AS LOA_TRK_USG_FLG,
    TMS_LOA_LNE.SHP_LEG_PAY_CUR_COD AS SHP_LEG_PAY_CUR_COD,
    TMS_LOA_LNE.SHP_LEG_RTE_UOM_COD AS SHP_LEG_RTE_UOM_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_DOC_UOM_COD AS SHP_LEG_DRP_DOC_UOM_COD,
    SUM((TMS_LOA_LNE.SHP_LEG_TOT_RTE_LGT_NBR * TMS_LOA_LNE.SHP_LEG_STP_WGH_RAT)) AS LAN_RUN_TOT,
    SUM((
            CASE
                WHEN TMS_LOA_LNE.SAL_ORG_COD IN ('1000',
                                                 '1400')
                THEN TMS_LOA_LNE_CRG.CUS_DCT
                ELSE 0
            END)) AB_CRB_CHG,
    SUM((
            CASE
                WHEN TMS_LOA_LNE.SAL_ORG_COD IN ('1000',
                                                 '1400')
                THEN TMS_LOA_LNE.SHP_LEG_DRP_INI_ORD_CAR_CSL_QTY
                ELSE TMS_LOA_LNE.SHP_LEG_DRP_ORD_CAR_CSL_QTY
            END)) AS PLN_SHP_CAR,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_ORD_NET_WGH_KGR_CSL_VAL) AS PLN_SHP_NET_KLS,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_ORD_NET_WGH_LBS_CSL_VAL) AS PLN_SHP_NET_LBS,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_INI_ORD_CAR_CSL_QTY) AS ORI_PLN_SHP_CAR,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_INI_ORD_NET_WGH_KGR_CSL_VAL) AS ORI_PLN_SHP_NET_KLS,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_INI_ORD_NET_WGH_LBS_CSL_VAL) AS ORI_PLN_SHP_NET_LBS,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL) AS SHP_GRS_KG,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CUST PICKUP')
            AND ((TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY')
                OR  (TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.')
                OR  (TMS_LOA_LNE.SHP_CNY_DSC='DANONE NA'))
            THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_LBS_CSL_VAL
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CUST PICKUP')
            AND ((TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE WATERS OF AMERICA')
                OR  (TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE CANADA'))
            THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL
            ELSE 0
        END) AS SHP_GRS_VOL_CUS_PIK,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_KGR_CSL_VAL) AS SHP_NET_KLS,
    SUM((
            CASE
                WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CARRIER SHIPMENT'
                THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL
                ELSE 0
            END)) AS SHP_NET_LBS_DEL,
    -- sum case when:
    SUM((
            CASE
                WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CUST PICKUP'
                THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL
                ELSE 0
            END)) AS SHP_NET_LBS_PIK,
    SUM(TMS_LOA_LNE.LOA_PIC_DRP_LCT_NBR) NUM_OF_STP,
    MAX(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101)
            THEN NULL
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'ORD'
                    THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                    WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'DEL'
                    THEN TMS_LOA_LNE.SHP_DEL_DOC_NUM
                    WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'SHP'
                    THEN TMS_LOA_LNE.LOA_CBU_REF_NUM
                    ELSE NULL
                END
        END) OTD_APP_FOR_CAR_SHP_2HR_DEN_DRP,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <=
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
                            THEN TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM
                            ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM
                        END
                    THEN 1
                    ELSE 0
                END
        END) OTD_APP_FOR_CAR_SHP_0HR,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= (
                            CASE
                                WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
                                THEN TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM
                                ELSE DATEADD(Hours, 2,TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM)
                            END)
                    THEN 1
                    ELSE 0
                END
        END) OTD_APP_FOR_CAR_SHP_2HR,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= (
                            CASE
                                WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
                                THEN TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM
                                ELSE DATEADD(Hours, 6,TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM)
                            END)
                    THEN 1
                    ELSE 0
                END
        END) OTD_APP_FOR_CAR_SHP_6HR,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.SHP_LEG_PIC_TRL_LOA_TYP_COD = 2
            THEN NULL
            ELSE
                CASE
                    WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
                    OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
                    OR  (TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                        AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101)
                    THEN 0
                    ELSE
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM <= (
                                    CASE
                                        WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                                        THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                                        ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM
                                    END)
                            THEN 1
                            ELSE 0
                        END
                END
        END) ATD_APP_PIK_FOR_CAR_SHP_0HR,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.SHP_LEG_PIC_TRL_LOA_TYP_COD = 2
            THEN NULL
            ELSE
                CASE
                    WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
                    OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
                    OR  (TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                        AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101)
                    THEN 0
                    ELSE 1
                END
        END) AS OT_APP_FOR_CAR_SHP_2HR_DEN,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM <=
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                            THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                            ELSE DATEADD(Hours, 2,TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM)
                        END
                    THEN 1
                    ELSE 0
                END
        END) AS OT_APP_PIK_FOR_CAR_SHP_2HR,
    SUM((
            CASE
                WHEN (((TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY'
                            OR  TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.')
                        OR  TMS_LOA_LNE.SHP_CNY_DSC = 'WHITEWAVE FOODS')
                    OR  TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE NA''')
                THEN TMS_LOA_LNE.SHP_LEG_DRP_ORD_GRS_WGH_LBS_CSL_VAL
                ELSE TMS_LOA_LNE.SHP_LEG_DRP_ORD_GRS_WGH_KGR_CSL_VAL
            END)) AS PLN_SHP_GRS_VOL,
    SUM((
            CASE
                WHEN (TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY'
                    OR  TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.'
                    OR  TMS_LOA_LNE.SHP_CNY_DSC = 'WHITEWAVE FOODS'
                    OR  TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE NA')
                THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL
                ELSE TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL
            END)) AS ORD_GRS_VOL,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_ORD_GRS_WGH_KGR_CSL_VAL) PLN_SHP_GRS_KLS,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE 1
        END) AS OTD_APP_PIK_FOR_CPU_2HR_DEN,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM <=
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                            THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                            ELSE DATEADD(Hours, 2, TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM)
                        END
                    THEN 1
                    ELSE 0
                END
        END) AS OT_APP_PIK_FOR_CPU_2HR,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM <=
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                            THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                            ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM
                        END
                    THEN 1
                    ELSE 0
                END
        END) AS OT_APP_PIK_FOR_CPU_0HR,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM <=
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                            THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                            ELSE DATEADD(Hours, 6, TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM)
                        END
                    THEN 1
                    ELSE 0
                END
        END) AS OT_APP_PIK_FOR_CPU_6HR,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM <=
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                            THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                            ELSE DATEADD(MIN, 30, TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM)
                        END
                    THEN 1
                    ELSE 0
                END
        END) AS OT_APP_PIK_FOR_CAR_SHP_05HR,
    MAX(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101)
            THEN NULL
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= DATEADD(MIN, 30,
                        TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM)
                    AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'ORD'
                    THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                    ELSE
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= DATEADD( MIN, 30,
                                TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM)
                            AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'DEL'
                            THEN TMS_LOA_LNE.SHP_DEL_DOC_NUM
                            ELSE
                                CASE
                                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= DATEADD( MIN, 30,
                                        TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM)
                                    AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'SHP'
                                    THEN TMS_LOA_LNE.LOA_CBU_REF_NUM
                                    ELSE NULL
                                END
                        END
                END
        END) AS OTD_APP_FOR_CAR_SHP_05HR,
    -- create the OT_APP_CAR_SHP_6HR column:
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM <=
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                            THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                            ELSE DATEADD( Hours, 6, TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM)
                        END
                    THEN 1
                    ELSE 0
                END
        END) AS OT_APP_PIK_CAR_SHP_6HR,
    -- create OTD_APP_CAR_SHP_6HR column:
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <=
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
                            THEN TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM
                            ELSE DATEADD(Hours, 6,TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM)
                        END
                    THEN 1
                    ELSE 0
                END
        END) AS OTD_APP_CAR_SHP_6HR,
    -- create LAN_MLS columns:
    SUM((TMS_LOA_LNE.SHP_LEG_STP_RTE_LGT_NBR * TMS_LOA_LNE.SHP_LEG_STP_WGH_RAT)) AS LAN_MLS,
    -- create SCR_ERL_CAR_SHP_CAR column:
    SUM(
        -- case when:
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101)
            THEN 0
            -- else:
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT
                    THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY
                    ELSE 0
                END
        END) AS SCR_ERL_CAR_SHP_CAR,
    -- create the SCR_XCT_CAR_SHP_CAR column:
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT
                    THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY
                    ELSE 0
                END
        END) AS SCR_XCT_CAR_SHP_CAR,
    -- create the SHP_LEG_DRP_DEL_CAR_CSL_QTY column:
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY) AS SHP_LEG_DRP_DEL_CAR_CSL_QTY ,
    -- create the SCR_ERL_CPU_CAR column:
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT <=
                        TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT
                    THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY
                    ELSE 0
                END
        END) AS SCR_ERL_CPU_CAR,
    -- create the SCR_XCT_CPU_CAR column:
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT =
                        TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT
                    THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY
                    ELSE 0
                END
        END) AS SCR_XCT_CPU_CAR,
    -- create the OT_ORI_RQT_PIK_FOR_CPU:
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            THEN 0
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT <=
                        TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT
                    THEN 1
                    ELSE 0
                END
        END) AS OT_ORI_RQT_PIK_FOR_CPU,
    -- create the OT_ORI_RQT_DEL_FOR_CAR_SHP column:
    MAX(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101)
            THEN NULL
            ELSE
                CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT
                    AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'ORD'
                    THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT
                    AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'DEL'
                    THEN TMS_LOA_LNE.SHP_DEL_DOC_NUM
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT
                    AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'SHP'
                    THEN TMS_LOA_LNE.LOA_CBU_REF_NUM
                    ELSE NULL
                END
        END) AS OT_ORI_RQT_DEL_FOR_CAR_SHP,
    -- create the TOT_ORD_PIK column:
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT')
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
            OR  (TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101)
            THEN 0
            ELSE 1
        END) AS TOT_ORD_PIK,

    
    
-- create bracket column:
CASE
    -- first condition:
    WHEN TMS_LOA_LNE.GRS_WGH_CAR_LBS < 3000 THEN '3000'
    -- second condition:
    WHEN TMS_LOA_LNE.GRS_WGH_CAR_LBS >= 3000 AND TMS_LOA_LNE.GRS_WGH_CAR_LBS <= 7000 THEN '3000-7000'
    -- third condition:
    WHEN TMS_LOA_LNE.GRS_WGH_CAR_LBS >= 7000 AND TMS_LOA_LNE.GRS_WGH_CAR_LBS <= 20000 THEN '7000-20000'
    -- fourth condition:
    WHEN TMS_LOA_LNE.GRS_WGH_CAR_LBS >= 20000 AND TMS_LOA_LNE.GRS_WGH_CAR_LBS <= 30000 THEN '20000-30000'
    -- fifth condition:
    WHEN TMS_LOA_LNE.GRS_WGH_CAR_LBS >= 30000 AND TMS_LOA_LNE.GRS_WGH_CAR_LBS <= 39000 THEN '30000-39000'
    -- sixth condition:
    WHEN TMS_LOA_LNE.GRS_WGH_CAR_LBS > 39000 THEN 'Greater Than 39000'
    -- end:
    END AS "GRS_WGH_CAR_Bracket",
-- create id_lane column:
CONCAT("SHP_LEG_PIC_CBU_COD","SHP_LEG_DRP_CBU_COD") AS ID_Lane,
-- create state > state lane column:
CONCAT("SHP_LEG_PIC_STE_COD", ' > ' , "SHP_LEG_DRP_STE_COD") AS "state > state lane",
-- create "Origin > City, ST Lane" column:
CONCAT("SHP_LEG_PIC_STE_COD", ' > ' , "SHP_LEG_DRP_CTY_DSC", ' , ', "SHP_LEG_DRP_STE_COD") AS "Origin > City, ST Lane",
-- create "Lane" column:
CONCAT("SHP_LEG_PIC_CTY_DSC", ', ' ,"SHP_LEG_PIC_STE_COD", ' - ', "SHP_LEG_DRP_CTY_DSC", ', ', "SHP_LEG_DRP_STE_COD") AS "Lane",
-- create "Mode" column:
CASE
    WHEN TMS_LOA_LNE.LOA_PIC_DRP_STP_FLG = 'MULTI DROP' THEN 'MSTL' ELSE LOA_TRP_MDE_DSC END AS "Mode",
-- create Origin-Destination Lane column:
CONCAT("SHP_LEG_PIC_NAM_COD", ' - ', "SHP_LEG_DRP_NAM_COD") AS "Origin-Destination Lane",
-- create Origin City/State Column:
CONCAT("SHP_LEG_PIC_CTY_DSC", ', ', "SHP_LEG_PIC_STE_COD") AS "Origin City/State",
-- create In-Gate Year Column:
YEAR("SHP_LEG_DRP_ARV_GTE_TIM") AS "In-Gate Year",
-- create In-Gate Data Available? column:
CASE
    WHEN "In-Gate Year"= 1000 THEN 'No' ELSE 'Yes' END AS "In-Gate Data Available?",
-- create Destination City/State column:
CONCAT("SHP_LEG_DRP_CTY_DSC",', ', "SHP_LEG_DRP_STE_COD") AS "Destination City/State",
-- create Origin Name - City/State - Destination Name - City/State column:
CONCAT("SHP_LEG_PIC_NAM_COD", ' - ', "Origin City/State", '_', "SHP_LEG_DRP_NAM_COD",'_',"Destination City/State") AS "Origin Name - City/State - Destination Name - City/State"


