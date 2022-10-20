-- select columns:
SELECT -- create the GROS_WGH_CAR_Bracket column:
    CASE
        WHEN SUM(
            TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_WTH_CAR_LBS_CSL_VAL
        ) < 3000 THEN '3000' -- first condition:
        WHEN SUM(
            TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_WTH_CAR_LBS_CSL_VAL
        ) >= 3000 -- second condition:
        AND SUM(
            TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_WTH_CAR_LBS_CSL_VAL
        ) <= 7000 THEN '3000-7000'
        WHEN SUM(
            TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_WTH_CAR_LBS_CSL_VAL
        ) >= 7000 -- third condition:
        AND SUM(
            TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_WTH_CAR_LBS_CSL_VAL
        ) <= 20000 THEN '7000-20000'
        WHEN SUM(
            TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_WTH_CAR_LBS_CSL_VAL
        ) >= 20000 -- fourth condition:
        AND SUM(
            TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_WTH_CAR_LBS_CSL_VAL
        ) <= 30000 THEN '20000-30000'
        WHEN SUM(
            TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_WTH_CAR_LBS_CSL_VAL
        ) >= 30000 -- fifth condition:
        AND SUM(
            TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_WTH_CAR_LBS_CSL_VAL
        ) <= 39000 THEN '30000-39000'
        WHEN SUM(
            TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_WTH_CAR_LBS_CSL_VAL
        ) > 39000 THEN 'Greater Than 39000' -- sixth condition:
    END AS "GRS_WGH_CAR_BCKT",
    -- create id_lane column:
    CONCAT(
        TMS_LOA_LNE.SHP_LEG_PIC_CBU_COD,
        TMS_LOA_LNE.SHP_LEG_DRP_CBU_COD
    ) AS UID_LN,
    -- create state > state lane column:
    CONCAT(
        TMS_LOA_LNE.SHP_LEG_PIC_STE_COD,
        ' > ',
        TMS_LOA_LNE.SHP_LEG_DRP_STE_COD
    ) AS "ST_ST_LN",
    -- create "Origin > City, ST Lane" column:
    CONCAT(
        TMS_LOA_LNE.SHP_LEG_PIC_STE_COD,
        ' > ',
        TMS_LOA_LNE.SHP_LEG_DRP_CTY_DSC,
        ' , ',
        TMS_LOA_LNE.SHP_LEG_DRP_STE_COD
    ) AS "ORI_CTY_ST_LN",
    -- create the "Lane" column:
    CONCAT(
        TMS_LOA_LNE.SHP_LEG_PIC_CTY_DSC,
        ', ',
        TMS_LOA_LNE.SHP_LEG_PIC_STE_COD,
        ' - ',
        TMS_LOA_LNE.SHP_LEG_DRP_CTY_DSC,
        ', ',
        TMS_LOA_LNE.SHP_LEG_DRP_STE_COD
    ) AS "LN",
    -- create "Mode" column:
    CASE
        WHEN TMS_LOA_LNE.LOA_PIC_DRP_STP_FLG = 'MULTI DROP' THEN 'MSTL'
        ELSE TMS_LOA_LNE.LOA_TRP_MDE_DSC
    END AS "MOD",
    -- create Origin-Destination Lane column:
    CONCAT(
        TMS_LOA_LNE.SHP_LEG_PIC_NAM_COD,
        ' - ',
        TMS_LOA_LNE.SHP_LEG_DRP_NAM_COD
    ) AS "ORI_DST_LN",
    -- create Origin City/State Column:
    CONCAT(
        TMS_LOA_LNE.SHP_LEG_PIC_CTY_DSC,
        ', ',
        TMS_LOA_LNE.SHP_LEG_PIC_STE_COD
    ) AS "ORI_CTY_ST",
    -- create In-Gate Data Available? column:
    CASE
        WHEN YEAR(TMS_LOA_LNE.SHP_LEG_DRP_ARV_GTE_TIM) = 1000 THEN 'No'
        ELSE 'Yes'
    END AS "In-Gate Date Available?",
    -- create Destination City/State column:
    CONCAT(
        TMS_LOA_LNE.SHP_LEG_DRP_CTY_DSC,
        ', ',
        TMS_LOA_LNE.SHP_LEG_DRP_STE_COD
    ) AS "DST_CTY_ST",
    -- create Origin Name - City/State - Destination Name - City/State column:
    CONCAT(
        TMS_LOA_LNE.SHP_LEG_PIC_NAM_COD,
        ' - ',
        "ORI_CTY_ST",
        '_',
        TMS_LOA_LNE.SHP_LEG_DRP_NAM_COD,
        '_',
        "DST_CTY_ST"
    ) AS "ORI_CTY_ST_DST_CTY_ST",
    -- create the shuttle(y/n) column:
    CASE
        WHEN TMS_LOA_LNE.LOA_GRP_DSC = 'SHUTTLE' THEN 'Shuttle'
        ELSE 'Non-Shuttle'
    END AS "SHU_Y_N",
    -- create the Shuttle Cost column:
    CASE
        WHEN "SHU_Y_N" = 'Shuttle' THEN TMS_LOA_LNE.SHP_LEG_PIC_NAM_COD
        ELSE '0'
    END AS "SHU_ORI",
    -- create Shuttle Cost column: first condition:
    CASE
        WHEN "SHU_ORI" = 'MINSTER' THEN 64 -- second condition:
        WHEN "SHU_ORI" = '0030 US YC PL Portland'
        OR "SHU_ORI" = 'AMC SALEM' THEN 429 -- third condition:
        WHEN "SHU_ORI" = 'FORT WORTH MFG' THEN 217 -- fourth condition:
        WHEN "SHU_ORI" = 'WEST JORDAN MFG' THEN 106 -- else:
        ELSE 0
    END AS "SHU_CST",
    -- create Linehaul with Shuttle column:
    IFNULL(ROUND((LIN_HUL + "SHU_CST"), 2), 0) AS "Linehaul with Shuttle",
    -- create Total Transportation with Shuttle column:
    IFNULL(ROUND(TOT_TRP + "SHU_CST", 2), 0) AS "Total Transportation with Shuttle",
    -- create the Destination Name/Campus column:
    CASE
        WHEN TMS_LOA_LNE_DST_CPS."CAMPUS" IS NULL THEN TMS_LOA_LNE."SHP_LEG_DRP_NAM_COD"
        ELSE TMS_LOA_LNE_DST_CPS."CAMPUS"
    END AS "DST_NAM_CPS",
    -- create Origin Name/Campus column:
    CASE
        WHEN TMS_LOA_LNE_ORN_CPS."CAMPUS" IS NULL THEN TMS_LOA_LNE."SHP_LEG_DRP_NAM_COD"
        ELSE TMS_LOA_LNE_ORN_CPS.CAMPUS
    END AS "ORI_NAM_CPS",
    -- create the Campus Level Lane column:
    CONCAT(
        "ORI_NAM_CPS",
        ', ',
        "DST_NAM_CPS"
    ) AS "CPS_LVL_LN",
    -- create the DC Flag column:
    LEFT(TMS_LOA_LNE."SHP_LEG_DRP_NAM_COD", 4) AS "DC_FLG",
    -- create the Inbound/Outbound Flag column:
    CASE
        WHEN "DC_FLG" = '0030' THEN 'INBOUND'
        ELSE TMS_LOA_LNE."SHP_LEG_INB_OTB_DSC"
    END AS "Inbound/Outbound Flag",
    -- create the Unique Lane ID column:
    CONCAT("ORI_NAM_CPS", '-', TMS_LOA_LNE_DST_CPS.DST_ID) AS "Unique Lane ID",
    -- create the Origin Campus - Destination Campus City/State Lane column:
    CONCAT(
        "ORI_NAM_CPS",
        ', ',
        "DST_NAM_CPS",
        ', ',
        "DST_CTY_ST"
    ) AS "ORI_CPS_DST_CPS_CTY_LN",
    -- create the Origin Campus - City/State Lane column:
    CONCAT(
        "ORI_NAM_CPS",
        '- ',
        "DST_CTY_ST"
    ) AS "ORI_CPS_CTY_ST_LN",
    -- create the "Origin Campus - Destination State Lane" column:
    CONCAT(
        "ORI_NAM_CPS",
        '_',
        TMS_LOA_LNE_DST_CPS.DST_STE_ID
    ) AS "ORI_CPS_DST_ST_LN",
    -- create the "Saddle Creek" column:
    CASE
        WHEN TMS_LOA_LNE_ORN_CPS.ORN_DES = '0030 US DC Saddle Creek 3PL' THEN 'Yes' -- second condition:
        WHEN TMS_LOA_LNE_ORN_CPS.ORN_DES = 'SADDLE CREEK LOGISTICS' THEN 'Yes' -- else:
        ELSE 'No'
    END AS "Saddle Creek",
    -- create the RFQ Origin Region column:
    CASE
        WHEN TMS_LOA_LNE_ORN_CPS.RFQ_OGN_RGN IS NOT NULL THEN TMS_LOA_LNE_ORN_CPS.RFQ_OGN_RGN
        ELSE "ORI_CTY_ST"
    END AS "RFG_ORI_RGN",
    -- create the RFQ Destination Region column:
    CASE
        WHEN TMS_LOA_LNE_DST_CPS.RFQ_OGN_RGN IS NOT NULL THEN TMS_LOA_LNE_DST_CPS.RFQ_OGN_RGN
        ELSE "DST_CTY_ST"
    END AS "RFG_DST_RGN",
    -- create Transit Time Date
    ABS(
        DATEDIFF(
            day,
            TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM,
            TO_DATE(
                CONCAT(
                    LEFT(TMS_LOA_LNE.SHP_LEG_ACT_MVT_DAT, 4),
                    '-',
                    SUBSTRING(TMS_LOA_LNE.SHP_LEG_ACT_MVT_DAT, 5, 2),
                    '-',
                    RIGHT(TMS_LOA_LNE.SHP_LEG_ACT_MVT_DAT, 2)
                )
            )
        )
    ) AS "TRAN_TIM",
    -- create Lead Time column:
    ABS(
        DATEDIFF(
            day,
            TO_DATE(
                CONCAT(
                    LEFT(TMS_LOA_LNE.SHP_LEG_ACT_MVT_DAT, 4),
                    '-',
                    SUBSTRING(TMS_LOA_LNE.SHP_LEG_ACT_MVT_DAT, 5, 2),
                    '-',
                    RIGHT(TMS_LOA_LNE.SHP_LEG_ACT_MVT_DAT, 2)
                )
            ),
            TMS_LOA_LNE."LOA_CRE_TIM"
        )
    ) AS "LED_TIM",
    -- create Lead Time Category column: first condition:
    CASE
        WHEN "LED_TIM" <= 1 THEN '<24 Hrs' -- create Lead Time Category column: second condition:
        WHEN "LED_TIM" < 3 THEN '<72 Hrs' -- create Lead Time Category column: third condition:
        WHEN "LED_TIM" >= 3 THEN '>72 Hrs' -- else:
        ELSE NULL
    END AS "LED_TIM_CAT",
    -- select columns from view:
    TMS_LOA_LNE.SHP_LEG_PIC_TRL_LOA_TYP_DSC SHP_LEG_PIC_TRL_LOA_TYP_DSC,
    TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP SHP_CBU_REF_DOC_TYP,
    TMS_LOA_LNE.SCH_TEM_COD SCH_TEM_COD,
    TMS_LOA_LNE.MAT_TYP_COD MAT_TYP_COD,
    TMS_LOA_LNE.LOA_IDT_COD LOA_IDT_COD,
    TMS_LOA_LNE.SHP_LEG_IDT_COD SHP_LEG_IDT_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT SHP_LEG_DRP_APP_DAT,
    CASE
        WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT
    END AS TMS_LOA_LNE_DRP_APP_DAT,
    TMS_LOA_LNE.SAL_ORG_COD AS SAL_ORG_COD,
    TMS_LOA_LNE.DIS_CHL_COD AS DIS_CHL_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_CUS_COD AS CUS_COD,
    CASE
        WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT
    END AS TMS_LOA_LNE_PIC_APP_DAT,
    TMS_LOA_LNE.SHP_LEG_DRP_ORD_GRS_WGH_LBS_CSL_VAL AS SHP_LEG_DRP_ORD_GRS_WGH_LBS_CSL_VAL,
    TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL AS SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL,
    TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT AS SHP_LEG_PIC_APP_DAT,
    TMS_LOA_LNE.SHP_LEG_PIC_FNC_DAT AS SHP_LEG_PIC_FNC_DAT,
    MAX(TMS_LOA_LNE.SHP_LEG_PIC_FNC_DSC) AS SHP_LEG_PIC_FNC_DSC,
    TMS_LOA_LNE.SHP_LEG_ACT_MVT_DAT AS SHP_LEG_ACT_MVT_DAT,
    TMS_LOA_LNE.SHP_CNY_DSC AS SHP_CNY_DSC,
    TMS_LOA_LNE.LOA_CBU_REF_NUM AS LOA_CBU_REF_NUM,
    TMS_LOA_LNE.LOA_ATV_TDR_SCA_COD AS LOA_ATV_TDR_SCA_COD,
    TMS_LOA_LNE.LOA_ATV_TDR_IDT_DSC AS LOA_ATV_TDR_IDT_DSC,
    TMS_LOA_LNE.LOA_CUS_PIC_FLG AS LOA_CUS_PIC_FLG,
    TMS_LOA_LNE.SHP_DEL_DOC_NUM AS SHP_DEL_DOC_NUM,
    TMS_LOA_LNE.SHP_SAL_CUS_PUR_DOC_DAT AS SHP_SAL_CUS_PUR_DOC_DAT,
    MAX(
        TO_DATE(
            TO_CHAR(TMS_LOA_LNE.SHP_SAL_CUS_PUR_DOC_DAT),
            'yyyymmdd'
        )
    ) AS SHP_SAL_CUS_PUR_DOC_DAT_TIM,
    TMS_LOA_LNE.SHP_SAL_CUS_PUR_DOC_NUM AS SHP_SAL_CUS_PUR_DOC_NUM,
    TMS_LOA_LNE.SHP_LEG_DEL_TYP_DSC AS SHP_LEG_DEL_TYP_DSC,
    TMS_LOA_LNE.SHP_LEG_DRP_1ST_ADR_DSC AS SHP_LEG_DRP_1ST_ADR_DSC,
    TMS_LOA_LNE.SHP_LEG_DRP_2ND_ADR_DSC AS SHP_LEG_DRP_2ND_ADR_DSC,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_CRE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_CRE_TIM
    END AS SHP_LEG_DRP_APP_CRE_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM
    END AS SHP_LEG_DRP_APP_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM
    END AS SHP_LEG_DRP_APP_WIN_END_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_BGN_TIM
    END AS SHP_LEG_DRP_APP_WIN_BGN_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM
    END AS SHP_LEG_DRP_ARV_TIM,
    TMS_LOA_LNE.SHP_LEG_DRP_CTY_DSC AS SHP_LEG_DRP_CTY_DSC,
    TMS_LOA_LNE.SHP_LEG_DRP_CRY_COD AS SHP_LEG_DRP_CRY_COD,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_WIN_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_WIN_BGN_TIM
    END AS SHP_LEG_DRP_WIN_BGN_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_ADU_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_ADU_TIM
    END AS SHP_LEG_DRP_ADU_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_DCK_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_DCK_END_TIM
    END AS SHP_LEG_DRP_DCK_END_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_DCK_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_DCK_BGN_TIM
    END AS SHP_LEG_DRP_DCK_BGN_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_ARV_GTE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_ARV_GTE_TIM
    END AS SHP_LEG_DRP_ARV_GTE_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_DEP_GTE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_DEP_GTE_TIM
    END AS SHP_LEG_DRP_DEP_GTE_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_LOA_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_LOA_END_TIM
    END AS SHP_LEG_DRP_LOA_END_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_LOA_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_LOA_BGN_TIM
    END AS SHP_LEG_DRP_LOA_BGN_TIM,
    TMS_LOA_LNE.SHP_LEG_DRP_STE_COD AS SHP_LEG_DRP_STE_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_PST_COD AS SHP_LEG_DRP_PST_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_CBU_COD AS SHP_LEG_DRP_CBU_COD,
    MAX(TMS_LOA_LNE.SHP_LEG_DRP_NAM_COD) AS SHP_LEG_DRP_NAM_COD,
    TMS_LOA_LNE.SHP_LEG_INB_OTB_DSC AS SHP_LEG_INB_OTB_DSC,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_FNC_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_FNC_TIM
    END AS SHP_LEG_PIC_FNC_TIM,
    CASE
        WHEN TMS_LOA_LNE.SHP_LEG_INB_OTB_DSC = 'INBOUND' THEN TMS_LOA_LNE.SHP_LEG_DRP_CBU_COD
        ELSE '#'
    END AS SHP_LEG_DRP_CUS_COD,
    MAX(
        CASE
            WHEN TMS_LOA_LNE.SHP_LEG_INB_OTB_DSC = 'INBOUND' THEN TMS_LOA_LNE.SHP_LEG_DRP_NAM_COD
            ELSE TMS_LOA_LNE.SHP_LEG_INB_OTB_DSC
        END
    ) AS INBOUND_SHP_LEG_DRP_NAM_COD,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.LOA_CNL_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.LOA_CNL_TIM
    END AS LOA_CNL_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.LOA_CLO_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.LOA_CLO_TIM
    END AS LOA_CLO_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.LOA_CRE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.LOA_CRE_TIM
    END AS LOA_CRE_TIM,
    TMS_LOA_LNE.LOA_GRP_DSC AS LOA_GRP_DSC,
    TMS_LOA_LNE.LOA_STS_DSC AS LOA_STS_DSC,
    TMS_LOA_LNE.LOA_TYP_DSC AS LOA_TYP_DSC,
    TMS_LOA_LNE.LOA_TRP_MDE_DSC AS LOA_TRP_MDE_DSC,
    TMS_LOA_LNE.LOA_PIC_DRP_STP_FLG AS LOA_PIC_DRP_STP_FLG,
    TMS_LOA_LNE.SHP_ORD_DOC_NUM AS SHP_ORD_DOC_NUM,
    TMS_LOA_LNE.SHP_LEG_PIC_CBU_COD AS SHP_LEG_PIC_CBU_COD,
    TMS_LOA_LNE.SHP_LEG_PIC_1ST_ADR_DSC AS SHP_LEG_PIC_1ST_ADR_DSC,
    TMS_LOA_LNE.SHP_LEG_PIC_2ND_ADR_DSC AS SHP_LEG_PIC_2ND_ADR_DSC,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_APP_CRE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_CRE_TIM
    END AS SHP_LEG_PIC_APP_CRE_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM
    END AS SHP_LEG_PIC_APP_WIN_END_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_BGN_TIM
    END AS SHP_LEG_PIC_APP_WIN_BGN_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM
    END AS SHP_LEG_PIC_ARV_TIM,
    TMS_LOA_LNE.SHP_LEG_PIC_CTY_DSC AS SHP_LEG_PIC_CTY_DSC,
    TMS_LOA_LNE.SHP_LEG_PIC_CRY_COD AS SHP_LEG_PIC_CRY_COD,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_ADU_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_ADU_TIM
    END AS SHP_LEG_PIC_ADU_TIM,
    TMS_LOA_LNE.SHP_LEG_PIC_NAM_COD AS SHP_LEG_PIC_NAM_COD,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_DCK_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_DCK_END_TIM
    END AS SHP_LEG_PIC_DCK_END_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_DCK_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_DCK_BGN_TIM
    END AS SHP_LEG_PIC_DCK_BGN_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM
    END AS SHP_LEG_PIC_ARV_GTE_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_DEP_GTE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_DEP_GTE_TIM
    END AS SHP_LEG_PIC_DEP_GTE_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_LOA_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_LOA_END_TIM
    END AS SHP_LEG_PIC_LOA_END_TIM,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_LOA_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_LOA_BGN_TIM
    END AS SHP_LEG_PIC_LOA_BGN_TIM,
    TMS_LOA_LNE.SHP_LEG_PIC_STE_COD SHP_LEG_PIC_STE_COD,
    TMS_LOA_LNE.SHP_LEG_PIC_PST_COD SHP_LEG_PIC_PST_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT SHP_LEG_DRP_INI_RQT_DEL_DAT,
    MAX(
        to_date(
            TO_CHAR(TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT),
            'yyyymmdd'
        )
    ) AS SHP_LEG_DRP_INI_RQT_DEL_DAT_TIM,
    TMS_LOA_LNE.LOA_TRK_RWK_FLG LOA_TRK_RWK_FLG,
    TMS_LOA_LNE.SHP_CNY_SAL_ORG_COD SHP_CNY_SAL_ORG_COD,
    TMS_LOA_LNE.SHP_LEG_WRH_LOA_SEQ_NUM SHP_LEG_WRH_LOA_SEQ_NUM,
    TMS_LOA_LNE.SHP_LEG_STS_DSC SHP_LEG_STS_DSC,
    TMS_LOA_LNE.LOA_TRK_USG_FLG LOA_TRK_USG_FLG,
    TMS_LOA_LNE.SHP_LEG_PAY_CUR_COD SHP_LEG_PAY_CUR_COD,
    TMS_LOA_LNE.SHP_LEG_RTE_UOM_COD SHP_LEG_RTE_UOM_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_DOC_UOM_COD SHP_LEG_DRP_DOC_UOM_COD,
    SUM(
        (
            TMS_LOA_LNE.SHP_LEG_TOT_RTE_LGT_NBR * TMS_LOA_LNE.SHP_LEG_STP_WGH_RAT
        )
    ) AS LAN_RUN_TOT,
    SUM(
        (
            CASE
                WHEN TMS_LOA_LNE.SAL_ORG_COD IN (
                    '1000',
                    '1400'
                ) THEN TMS_LOA_LNE_CRG.CUS_DCT
                ELSE 0
            END
        )
    ) AS AB_CRB_CHG,
    SUM(
        (
            CASE
                WHEN TMS_LOA_LNE.SAL_ORG_COD IN (
                    '1000',
                    '1400'
                ) THEN TMS_LOA_LNE.SHP_LEG_DRP_INI_ORD_CAR_CSL_QTY
                ELSE TMS_LOA_LNE.SHP_LEG_DRP_ORD_CAR_CSL_QTY
            END
        )
    ) AS PLN_SHP_CAR,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_ORD_NET_WGH_KGR_CSL_VAL) AS PLN_SHP_NET_KLS,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_ORD_NET_WGH_LBS_CSL_VAL) AS PLN_SHP_NET_LBS,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_INI_ORD_CAR_CSL_QTY) AS ORI_PLN_SHP_CAR,
    SUM(
        TMS_LOA_LNE.SHP_LEG_DRP_INI_ORD_NET_WGH_KGR_CSL_VAL
    ) AS ORI_PLN_SHP_NET_KLS,
    SUM(
        TMS_LOA_LNE.SHP_LEG_DRP_INI_ORD_NET_WGH_LBS_CSL_VAL
    ) AS ORI_PLN_SHP_NET_LBS,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL) AS SHP_GRS_KG,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CUST PICKUP')
            AND (
                (TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY')
                OR (
                    TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.'
                )
                OR (TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE NA')
            ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_LBS_CSL_VAL
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CUST PICKUP')
            AND (
                (
                    TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE WATERS OF AMERICA'
                )
                OR (TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE CANADA')
            ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL
            ELSE 0
        END
    ) SHP_GRS_VOL_CUS_PIK,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_KGR_CSL_VAL) SHP_NET_KLS,
    SUM(
        (
            CASE
                WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CARRIER SHIPMENT' THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL
                ELSE 0
            END
        )
    ) SHP_NET_LBS_DEL,
    SUM(
        (
            CASE
                WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CUST PICKUP' THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL
                ELSE 0
            END
        )
    ) SHP_NET_LBS_PIK,
    SUM(TMS_LOA_LNE.LOA_PIC_DRP_LCT_NBR) NUM_OF_STP,
    MAX(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN NULL
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'ORD' THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'DEL' THEN TMS_LOA_LNE.SHP_DEL_DOC_NUM
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'SHP' THEN TMS_LOA_LNE.LOA_CBU_REF_NUM
                ELSE NULL
            END
        END
    ) OTD_APP_FOR_CAR_SHP_2HR_DEN_DRP,
    SUM(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM
                    ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM
                END THEN 1
                ELSE 0
            END
        END
    ) OTD_APP_FOR_CAR_SHP_0HR,
    SUM(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= (
                    CASE
                        WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM
                        ELSE DATEADD(Hours, 2, TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM)
                    END
                ) THEN 1
                ELSE 0
            END
        END
    ) OTD_APP_FOR_CAR_SHP_2HR,
    SUM(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= (
                    CASE
                        WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM
                        ELSE DATEADD(Hours, 6, TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM)
                    END
                ) THEN 1
                ELSE 0
            END
        END
    ) OTD_APP_FOR_CAR_SHP_6HR,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.SHP_LEG_PIC_TRL_LOA_TYP_COD = 2 THEN NULL
            ELSE CASE
                WHEN (
                    TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
                )
                OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
                OR (
                    TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                    AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                ) THEN 0
                ELSE CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM <= (
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                            ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM
                        END
                    ) THEN 1
                    ELSE 0
                END
            END
        END
    ) ATD_APP_PIK_FOR_CAR_SHP_0HR,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.SHP_LEG_PIC_TRL_LOA_TYP_COD = 2 THEN NULL
            ELSE CASE
                WHEN (
                    TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
                )
                OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
                OR (
                    TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                    AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                ) THEN 0
                ELSE 1
            END
        END
    ) OT_APP_FOR_CAR_SHP_2HR_DEN,
    SUM(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM <= CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                    ELSE DATEADD(Hours, 2, TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM)
                END THEN 1
                ELSE 0
            END
        END
    ) OT_APP_PIK_FOR_CAR_SHP_2HR,
    SUM(
        (
            CASE
                WHEN (
                    (
                        (
                            TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY'
                            OR TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.'
                        )
                        OR TMS_LOA_LNE.SHP_CNY_DSC = 'WHITEWAVE FOODS'
                    )
                    OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE NA'''
                ) THEN TMS_LOA_LNE.SHP_LEG_DRP_ORD_GRS_WGH_LBS_CSL_VAL
                ELSE TMS_LOA_LNE.SHP_LEG_DRP_ORD_GRS_WGH_KGR_CSL_VAL
            END
        )
    ) PLN_SHP_GRS_VOL,
    SUM(
        (
            CASE
                WHEN (
                    TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY'
                    OR TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.'
                    OR TMS_LOA_LNE.SHP_CNY_DSC = 'WHITEWAVE FOODS'
                    OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE NA'
                ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL
                ELSE TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL
            END
        )
    ) ORD_GRS_VOL,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_ORD_GRS_WGH_KGR_CSL_VAL) PLN_SHP_GRS_KLS,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE 1
        END
    ) OTD_APP_PIK_FOR_CPU_2HR_DEN,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM <= CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                    ELSE DATEADD(
                        Hours,
                        2,
                        TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM
                    )
                END THEN 1
                ELSE 0
            END
        END
    ) OT_APP_PIK_FOR_CPU_2HR,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM <= CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                    ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM
                END THEN 1
                ELSE 0
            END
        END
    ) OT_APP_PIK_FOR_CPU_0HR,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM <= CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                    ELSE DATEADD(
                        Hours,
                        6,
                        TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM
                    )
                END THEN 1
                ELSE 0
            END
        END
    ) OT_APP_PIK_FOR_CPU_6HR,
    SUM(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM <= CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                    ELSE DATEADD(MIN, 30, TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM)
                END THEN 1
                ELSE 0
            END
        END
    ) OT_APP_PIK_FOR_CAR_SHP_05HR,
    MAX(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN NULL
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= DATEADD(
                    MIN,
                    30,
                    TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM
                )
                AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'ORD' THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                ELSE CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= DATEADD(
                        MIN,
                        30,
                        TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM
                    )
                    AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'DEL' THEN TMS_LOA_LNE.SHP_DEL_DOC_NUM
                    ELSE CASE
                        WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= DATEADD(
                            MIN,
                            30,
                            TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM
                        )
                        AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'SHP' THEN TMS_LOA_LNE.LOA_CBU_REF_NUM
                        ELSE NULL
                    END
                END
            END
        END
    ) OTD_APP_FOR_CAR_SHP_05HR,
    SUM(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM <= CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                    ELSE DATEADD(
                        Hours,
                        6,
                        TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM
                    )
                END THEN 1
                ELSE 0
            END
        END
    ) OT_APP_PIK_CAR_SHP_6HR,
    SUM(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM <= CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM
                    ELSE DATEADD(Hours, 6, TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM)
                END THEN 1
                ELSE 0
            END
        END
    ) OTD_APP_CAR_SHP_6HR,
    SUM(
        (
            TMS_LOA_LNE.SHP_LEG_STP_RTE_LGT_NBR * TMS_LOA_LNE.SHP_LEG_STP_WGH_RAT
        )
    ) LAN_MLS,
    SUM(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY
                ELSE 0
            END
        END
    ) SCR_ERL_CAR_SHP_CAR,
    SUM(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY
                ELSE 0
            END
        END
    ) SCR_XCT_CAR_SHP_CAR,
    SUM(TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY) SHP_LEG_DRP_DEL_CAR_CSL_QTY,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY
                ELSE 0
            END
        END
    ) SCR_ERL_CPU_CAR,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY
                ELSE 0
            END
        END
    ) SCR_XCT_CPU_CAR,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT THEN 1
                ELSE 0
            END
        END
    ) OT_ORI_RQT_PIK_FOR_CPU,
    MAX(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN NULL
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT
                AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'ORD' THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT
                AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'DEL' THEN TMS_LOA_LNE.SHP_DEL_DOC_NUM
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT
                AND TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'SHP' THEN TMS_LOA_LNE.LOA_CBU_REF_NUM
                ELSE NULL
            END
        END
    ) OT_ORI_RQT_DEL_FOR_CAR_SHP,
    SUM(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE 1
        END
    ) TOT_ORD_PIK,
    MAX(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN NULL
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_RQT_DEL_DAT THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                ELSE NULL
            END
        END
    ) OT_RQT_DEL_FOR_CAR_SHP,
    SUM(
        TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_WTH_CAR_LBS_CSL_VAL
    ) GRS_WGH_CAR_LBS,
    MAX(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN NULL
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_WIN_BGN_DAT THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                ELSE NULL
            END
        END
    ) ON_TIM_DEL_TO_RQS_DAY,
    MAX(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN NULL
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_WIN_BGN_DAT THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                ELSE NULL
            END
        END
    ) ON_TIM_DEL_TO_RDD,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CUST PICKUP') THEN TMS_LOA_LNE.SHP_LEG_DRP_ORD_CAR_CSL_QTY
            ELSE 0
        END
    ) WJXBFS1,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CARRIER SHIPMENT') THEN TMS_LOA_LNE.SHP_LEG_DRP_ORD_CAR_CSL_QTY
            ELSE 0
        END
    ) WJXBFS2,
    SUM(
        (
            CASE
                WHEN TMS_LOA_LNE.SAL_ORG_COD IN (
                    '1000',
                    '1400'
                ) THEN TMS_LOA_LNE.SHP_LEG_DRP_INI_ORD_CAR_CSL_QTY
                ELSE TMS_LOA_LNE.SHP_LEG_DRP_ORD_CAR_CSL_QTY
            END
        )
    ) WJXBFS3,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.SHP_LEG_PIC_TRL_LOA_TYP_COD = 2 THEN NULL
            ELSE CASE
                WHEN (
                    TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
                )
                OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101)
                OR (
                    TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                    AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                ) THEN 0
                ELSE 1
            END
        END
    ) WJXBFS4,
    SUM(
        (
            CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY > 0 THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY
                ELSE TMS_LOA_LNE.SHP_CAR_NBR
            END
        )
    ) WJXBFS5,
    MAX(
        (
            CASE
                WHEN CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_BGN_TIM = '1000-01-01 00:00:00'
                    OR TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM = '1000-01-01 00:00:00' THEN 0
                    ELSE 1
                END IN (1) THEN CASE
                    WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'ORD' THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                    WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'DEL' THEN TMS_LOA_LNE.SHP_DEL_DOC_NUM
                    WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'SHP' THEN TMS_LOA_LNE.LOA_CBU_REF_NUM
                    ELSE '#'
                END
                ELSE NULL
            END
        )
    ) ORD_CNT_OTD_FLG,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.SAL_ORG_COD IN (
                '1000',
                '1400'
            ) THEN TMS_LOA_LNE.SHP_LEG_DRP_INI_ORD_CAR_CSL_QTY
            ELSE TMS_LOA_LNE.SHP_LEG_DRP_ORD_CAR_CSL_QTY
        END
    ) ORD_CAR,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CARRIER SHIPMENT' THEN TMS_LOA_LNE.SHP_LEG_DRP_ORD_CAR_CSL_QTY
            ELSE 0
        END
    ) ORD_CAS_CUS_DEL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CUST PICKUP' THEN TMS_LOA_LNE.SHP_LEG_DRP_ORD_CAR_CSL_QTY
            ELSE 0
        END
    ) ORD_CAS_CUS_PIC,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY > 0 THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY
            ELSE TMS_LOA_LNE.SHP_CAR_NBR
        END
    ) SHP_CAR,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CARRIER SHIPMENT' THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL
            ELSE 0
        END
    ) SHP_NET_LBS_CUS_DEL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.LOA_TRP_MDE_DSC = 'IM' THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL
            ELSE 0
        END
    ) SHP_NET_LBS_IM,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.LOA_TRP_MDE_DSC = 'LTL' THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL
            ELSE 0
        END
    ) SHP_NET_LBS_LTL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.LOA_TRP_MDE_DSC = 'TL' THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL
            ELSE 0
        END
    ) SHP_NET_LBS_TL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY'
            OR TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.'
            OR TMS_LOA_LNE.SHP_CNY_DSC = 'WHITEWAVE FOODS'
            OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE NA'
            AND (
                TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_LBS_CSL_VAL > 0
            ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_LBS_CSL_VAL
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE CANADA'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE WATERS OF AMERICA'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'WHITEWAVE FOODS'
                AND (
                    TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL > 0
                ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL
                ELSE 0
            END
        END
    ) SHP_GRS_VOL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CARRIER SHIPMENT'
            AND (
                TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'WHITEWAVE FOODS'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE NA'
            ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_LBS_CSL_VAL
            ELSE CASE
                WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG = 'CARRIER SHIPMENT'
                AND (
                    TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE CANADA'
                    OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE WATERS OF AMERICA'
                ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL
                ELSE 0
            END
        END
    ) SHP_GRS_VOL_CUS_DEL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.LOA_TRP_MDE_DSC = 'IM'
            AND (
                TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'WHITEWAVE FOODS'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE NA'
            ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_LBS_CSL_VAL
            ELSE CASE
                WHEN TMS_LOA_LNE.LOA_TRP_MDE_DSC = 'IM'
                AND (
                    TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE CANADA'
                    OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE WATERS OF AMERICA'
                ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL
                ELSE 0
            END
        END
    ) SHP_GRS_VOL_IM,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.LOA_TRP_MDE_DSC = 'LTL'
            AND (
                TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'WHITEWAVE FOODS'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE NA'
            ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_LBS_CSL_VAL
            ELSE CASE
                WHEN TMS_LOA_LNE.LOA_TRP_MDE_DSC = 'LTL'
                AND (
                    TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE CANADA'
                    OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE WATERS OF AMERICA'
                ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL
                ELSE 0
            END
        END
    ) SHP_GRS_VOL_LTL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.LOA_TRP_MDE_DSC = 'TL'
            AND (
                TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'WHITEWAVE FOODS'
                OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE NA'
            ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_LBS_CSL_VAL
            ELSE CASE
                WHEN TMS_LOA_LNE.LOA_TRP_MDE_DSC = 'TL'
                AND (
                    TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE CANADA'
                    OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE WATERS OF AMERICA'
                ) THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_GRS_WGH_KGR_CSL_VAL
                ELSE 0
            END
        END
    ) SHP_GRS_VOL_TL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.SHP_CNY_DSC = 'DANNON COMPANY'
            OR TMS_LOA_LNE.SHP_CNY_DSC = 'STONYFIELD FARM, INC.'
            OR TMS_LOA_LNE.SHP_CNY_DSC = 'WHITEWAVE FOODS'
            OR TMS_LOA_LNE.SHP_CNY_DSC = 'DANONE NA' THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL
            ELSE TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_KGR_CSL_VAL
        END
    ) SHP_NET_VOL,
    SUM(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT THEN TMS_LOA_LNE.SHP_LEG_DRP_DEL_CAR_CSL_QTY
                ELSE 0
            END
        END
    ) SCR_ERL_DEL_CAR,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CUST PICKUP')
            OR (TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE 1
        END
    ) OTD_APP_CPU_DEN,
    SUM(
        CASE
            WHEN (TMS_LOA_LNE.SHP_LEG_PIC_TRL_LOA_TYP_COD = 2) THEN NULL
            ELSE CASE
                WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
                OR TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101
                OR (
                    TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                    AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                ) THEN 0
                ELSE 1
            END
        END
    ) OTD_APP_DEL_DEN_PIC_TRL,
    MAX(
        CASE
            WHEN (
                TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            )
            OR (TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101)
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
            ) THEN NULL
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'ORD' THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'DEL' THEN TMS_LOA_LNE.SHP_DEL_DOC_NUM
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'SHP' THEN TMS_LOA_LNE.LOA_CBU_REF_NUM
                ELSE NULL
            END
        END
    ) OTD_APP_FOR_CAR_SHP_0HR_DEN_DRP,
    MAX(
        CASE
            WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            OR TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
            ) THEN NULL
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'ORD' THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'DEL' THEN TMS_LOA_LNE.SHP_DEL_DOC_NUM
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'SHP' THEN TMS_LOA_LNE.LOA_CBU_REF_NUM
                ELSE NULL
            END
        END
    ) OTD_APP_FOR_CAR_SHP_05HR_DEN_DRP,
    MAX(
        CASE
            WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            OR TMS_LOA_LNE.SHP_LEG_DRP_ARV_DAT = 10000101
            OR (
                TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT = 10000101
            ) THEN NULL
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'ORD' THEN TMS_LOA_LNE.SHP_ORD_DOC_NUM
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'DEL' THEN TMS_LOA_LNE.SHP_DEL_DOC_NUM
                WHEN TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP = 'SHP' THEN TMS_LOA_LNE.LOA_CBU_REF_NUM
                ELSE NULL
            END
        END
    ) OTD_APP_FOR_CAR_SHP_6HR_DEN_DRP,
    MAX(
        CASE
            WHEN TMS_LOA_LNE.SHP_LEG_PIC_TRL_LOA_TYP_COD = 2 THEN NULL
            ELSE CASE
                WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
                OR TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101
                OR (
                    TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                    AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
                ) THEN 0
                ELSE CASE
                    WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM <= (
                        CASE
                            WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                            ELSE DATEADD(
                                MIN,
                                30,
                                TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM
                            )
                        END
                    ) THEN 1
                    ELSE 0
                END
            END
        END
    ) OTD_APP_PIK_UP_FOR_CAR_SHP_0HR,
    MAX(
        CASE
            WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            OR TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101
            OR (
                TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM <= (
                    CASE
                        WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                        ELSE DATEADD(MIN, 30, TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM)
                    END
                ) THEN 1
                ELSE 0
            END
        END
    ) OTD_APP_PIK_UP_FOR_CAR_SHP_05HR,
    MAX(
        CASE
            WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            OR TMS_LOA_LNE.SHP_LEG_PIC_ARV_DAT = 10000101
            OR (
                TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT = 10000101
                AND TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101
            ) THEN 0
            ELSE CASE
                WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM <= (
                    CASE
                        WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_TIM
                        ELSE DATEADD(MIN, 30, TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM)
                    END
                ) THEN 1
                ELSE 0
            END
        END
    ) OTD_APP_PIK_UP_FOR_CAR_SHP_2HR,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.LOA_CUS_PIC_FLG <> 'CARRIER SHIPMENT'
            OR TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT = 10000101 THEN 0
            WHEN TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_DAT <= TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT THEN 1
            ELSE 0
        END
    ) OTD_ORI_REQ_CPU,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AF' THEN 1
            ELSE 0
        END
    ) ACD,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AZ' THEN 1
            ELSE 0
        END
    ) ALT_CAR_DEL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'D1' THEN 1
            ELSE 0
        END
    ) CAR_DIS_ERR,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'BF' THEN 1
            ELSE 0
        END
    ) CAR_KEY_ERR,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'B1' THEN 1
            ELSE 0
        END
    ) CON_CLO,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AG' THEN 1
            ELSE 0
        END
    ) CON_RLD,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'C2' THEN 1
            ELSE 0
        END
    ) CRD_HLD,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AD' THEN 1
            ELSE 0
        END
    ) CUS_REQ_FTR_DEL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'BJ' THEN 1
            ELSE 0
        END
    ) CUS_WAN_ERL_DEL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'CA' THEN 1
            ELSE 0
        END
    ) CUS_IMP_EXP,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'S1' THEN 1
            ELSE 0
        END
    ) DEL_SRT,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'D2' THEN 1
            ELSE 0
        END
    ) DRV_NOT_AVL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AH' THEN 1
            ELSE 0
        END
    ) DRV_RLD,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AV' THEN 1
            ELSE 0
        END
    ) EXC_SRV,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'BB' THEN 1
            ELSE 0
        END
    ) HEL_PER_SHP,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AN' THEN 1
            ELSE 0
        END
    ) HOL_CLO,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'A2' THEN 1
            ELSE 0
        END
    ) ICR_Add,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'A3' THEN 1
            ELSE 0
        END
    ) IDR_DEL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'T7' THEN 1
            ELSE 0
        END
    ) ISF_DEL_TIM,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AX' THEN 1
            ELSE 0
        END
    ) ISF_PIK_UP_TIM,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'BH' THEN 1
            ELSE 0
        END
    ) ISF_TIM_CPL_DEL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'BP' THEN 1
            ELSE 0
        END
    ) LOA_SHF,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AI' THEN 1
            ELSE 0
        END
    ) MEC_BRK,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AA' THEN 1
            ELSE 0
        END
    ) MIS_SRT,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'A1' THEN 1
            ELSE 0
        END
    ) MIS_DEL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AYU' THEN 1
            ELSE 0
        END
    ) MIS_PIK_UP,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'BG' THEN 1
            ELSE 0
        END
    ) OTH,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AJ' THEN 1
            ELSE 0
        END
    ) OTH_CAR_REL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'BK' THEN 1
            ELSE 0
        END
    ) PRA_APT,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AL' THEN 1
            ELSE 0
        END
    ) PRV_STP,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'P3' THEN 1
            ELSE 0
        END
    ) PDT_FAL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'BO' THEN 1
            ELSE 0
        END
    ) RIL_FAI_MET_SCH,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'BS' THEN 1
            ELSE 0
        END
    ) RFS_BY_CUS,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'BE' THEN 1
            ELSE 0
        END
    ) ROD_CDT,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AM' THEN 1
            ELSE 0
        END
    ) SHP_REL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'T5' THEN 1
            ELSE 0
        END
    ) TRL_CLS_NOT_AVL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'T3' THEN 1
            ELSE 0
        END
    ) TRL_NOT_AVL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'T4' THEN 1
            ELSE 0
        END
    ) TRL_NOT_USA_PRI_PDT,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'T2' THEN 1
            ELSE 0
        END
    ) TRL_CVT_NOT_AVL,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'BR' THEN 1
            ELSE 0
        END
    ) TRN_DER,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'A5' THEN 1
            ELSE 0
        END
    ) NBL_LOC,
    SUM(
        CASE
            WHEN TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'A0' THEN 1
            ELSE 0
        END
    ) AS WTH_NAT_DIS_REL,
    TMS_LOA_LNE_CRG.ADD_DAY AS ADD_DAY,
    TMS_LOA_LNE_CRG.CUS_DCT AS CUS_DCT,
    TMS_LOA_LNE_CRG.APP_FEE AS APP_FEE,
    TMS_LOA_LNE_CRG.bas_lhl_dol AS bas_lhl_dol,
    TMS_LOA_LNE_CRG.dtl_dtn_at_ori_dol AS dtl_dtn_at_ori_dol,
    TMS_LOA_LNE_CRG.dtl_dtn_at_DEL_dol AS dtl_dtn_at_DEL_dol,
    TMS_LOA_LNE_CRG.gst_grl_sal_tax_dol AS gst_grl_sal_tax_dol,
    TMS_LOA_LNE_CRG.har_hrm_sal_tax_dol har_hrm_sal_tax_dol,
    TMS_LOA_LNE_CRG.nb_hst_new_brk_tax_dol nb_hst_new_brk_tax_dol,
    TMS_LOA_LNE_CRG.nl_hst_nFd_tax_dol nl_hst_nFd_tax_dol,
    TMS_LOA_LNE_CRG.ns_hst_nov_sct_tax_dol s_hst_nov_sct_tax_dol,
    TMS_LOA_LNE_CRG.on_hst_ont_tax_dol on_hst_ont_tax_dol,
    TMS_LOA_LNE_CRG.qc_pst_qbc_tax_dol qc_pst_qbc_tax_dol,
    TMS_LOA_LNE_CRG.soc_stp_off_dol soc_stp_off_dol,
    TMS_LOA_LNE_CRG.und_uld_lmp_dol und_uld_lmp_dol,
    TMS_LOA_LNE_CRG.BAS_ITM BAS_ITM,
    TMS_LOA_LNE_CRG.BC_CRB_CHG BC_CRB_CHG,
    TMS_LOA_LNE_CRG.BNR_FRT BNR_FRT,
    TMS_LOA_LNE_CRG.CA_FUL_TAX CA_FUL_TAX,
    TMS_LOA_LNE_CRG.CND_GST CND_GST,
    TMS_LOA_LNE_CRG.CRS_DCK_SRG CRS_DCK_SRG,
    TMS_LOA_LNE_CRG.CRS_DCK_SPT_FRT_CLD CRS_DCK_SPT_FRT_CLD,
    TMS_LOA_LNE_CRG.CUS_REF_FSC CUS_REF_FSC,
    TMS_LOA_LNE_CRG.DAD_HAD DAD_HAD,
    TMS_LOA_LNE_CRG.DCT DCT,
    TMS_LOA_LNE_CRG.DEL_SRG DEL_SRG,
    TMS_LOA_LNE_CRG.DTN DTN,
    TMS_LOA_LNE_CRG.DTN_AT_DST DTN_AT_DST,
    TMS_LOA_LNE_CRG.DTN_AT_ORI DTN_AT_ORI,
    TMS_LOA_LNE_CRG.DTV_VHC_DTN DTV_VHC_DTN,
    TMS_LOA_LNE_CRG.DTY_CHG DTY_CHG,
    TMS_LOA_LNE_CRG.EMS_SRG EMS_SRG,
    TMS_LOA_LNE_CRG.XTR_LBR XTR_LBR,
    TMS_LOA_LNE_CRG.FUE_MDF_FSC FUE_MDF_FSC,
    TMS_LOA_LNE_CRG.FUL_ADJ_FOR_WST_CND FUL_ADJ_FOR_WST_CND,
    TMS_LOA_LNE_CRG.FUL_SRG FUL_SRG,
    TMS_LOA_LNE_CRG.GST_GNL_SAL_TAX GST_GNL_SAL_TAX,
    TMS_LOA_LNE_CRG.GST_ON_GNL_SAL_TAX GST_ON_GNL_SAL_TAX,
    TMS_LOA_LNE_CRG.INS_DEL INS_DEL,
    TMS_LOA_LNE_CRG.LBR_RPR_AND_RTN_ORD LBR_RPR_AND_RTN_ORD,
    TMS_LOA_LNE_CRG.LAY LAY,
    TMS_LOA_LNE_CRG.LIN_HUL LIN_HUL,
    TMS_LOA_LNE_CRG.LMP LMP,
    TMS_LOA_LNE_CRG.MTR_ARA_FEE MTR_ARA_FEE,
    TMS_LOA_LNE_CRG.MIN_DEL_CHG MIN_DEL_CHG,
    TMS_LOA_LNE_CRG.MDF MDF,
    TMS_LOA_LNE_CRG.NA_FUL_ADJ_FOR_WST_CND NA_FUL_ADJ_FOR_WST_CND,
    TMS_LOA_LNE_CRG.NEW_BRN_TAX NEW_BRN_TAX,
    TMS_LOA_LNE_CRG.NEW_FND_TAX NEW_FND_TAX,
    TMS_LOA_LNE_CRG.NIG_DEL NIG_DEL,
    TMS_LOA_LNE_CRG.NOT_PRI_TO_DEL NOT_PRI_TO_DEL,
    TMS_LOA_LNE_CRG.NOV_SCT_TAX NOV_SCT_TAX,
    TMS_LOA_LNE_CRG.OFF_HRS_DEL OFF_HRS_DEL,
    TMS_LOA_LNE_CRG.OTR_TAX OTR_TAX,
    TMS_LOA_LNE_CRG.OTR_CHG OTR_CHG,
    TMS_LOA_LNE_CRG.OUT_OF_RUT_MLS OUT_OF_RUT_MLS,
    TMS_LOA_LNE_CRG.PIK_CHG PIK_CHG,
    TMS_LOA_LNE_CRG.QBC_TAX QBC_TAX,
    TMS_LOA_LNE_CRG.RCC RCC,
    TMS_LOA_LNE_CRG.RDL RDL,
    TMS_LOA_LNE_CRG.REF_FSC REF_FSC,
    TMS_LOA_LNE_CRG.RTN RTN,
    SUM(
        CASE
            WHEN TMS_LOA_LNE.SHP_CNY_SAL_ORG_COD = '1400'
            OR TMS_LOA_LNE.SHP_CNY_SAL_ORG_COD = '1000' THEN TMS_LOA_LNE_CRG.SND_DAY_DEL
            ELSE 0
        END
    ) AS SND_DAY_DEL,
    TMS_LOA_LNE_CRG.SRT_AND_SEG_CHG SRT_AND_SEG_CHG,
    TMS_LOA_LNE_CRG.SPL_DEL SPL_DEL,
    TMS_LOA_LNE_CRG.STP_ODD_CHG STP_ODD_CHG,
    TMS_LOA_LNE_CRG.STG STG,
    TMS_LOA_LNE_CRG.TEM_SRV TEM_SRV,
    TMS_LOA_LNE_CRG.TOT_TRP TOT_TRP,
    TMS_LOA_LNE_CRG.TRD_SHW_XPO_DEL TRD_SHW_XPO_DEL,
    TMS_LOA_LNE_CRG.TRK_ORD_NOT_USD TRK_ORD_NOT_USD,
    TMS_LOA_LNE_CRG.UND UND,
    TMS_LOA_LNE_CRG.NLD_FEE NLD_FEE,
    TMS_LOA_LNE_CRG.WTG_WAT_TIM WTG_WAT_TIM,
    TMS_LOA_LNE_CRG.WLM_LMP WLM_LMP,
    TMS_LOA_LNE_CRG.WND_DEL_CHG WND_DEL_CHG,
    TMS_LOA_LNE_CRG.WND_HLD_CHG WND_HLD_CHG
FROM V_PBI_D_TMS_LOA_LNE TMS_LOA_LNE
    LEFT JOIN (
        SELECT LOA_IDT_COD,
            SHP_LEG_IDT_COD,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = '18D' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) ADD_DAY,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'CUS3' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) CUS_DCT,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'APT' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) APP_FEE,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'BAS' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) bas_lhl_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'DTL' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) dtl_dtn_at_ori_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'DTU' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) dtl_dtn_at_DEL_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'GST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) gst_grl_sal_tax_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'HAR' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) har_hrm_sal_tax_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'NB_HST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) nb_hst_new_brk_tax_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'NL_HST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) nl_hst_nFd_tax_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'NS_HST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) ns_hst_nov_sct_tax_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'ON_HST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) on_hst_ont_tax_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'QC_PST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) qc_pst_qbc_tax_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'SOC' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) soc_stp_off_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'UND' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) und_uld_lmp_dol,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD = '1400'
                    OR TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD = '1000' THEN (
                        CASE
                            WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'BAS' THEN TMS_LOA_LNE_CRG.PAY_VAL
                            ELSE 0
                        END
                    )
                    ELSE 0
                END
            ) BAS_ITM,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD <> '1400'
                    OR TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD <> '1000' THEN (
                        CASE
                            WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'CUS2' THEN TMS_LOA_LNE_CRG.PAY_VAL
                            ELSE 0
                        END
                    )
                    ELSE 0
                END
            ) BC_CRB_CHG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'BEY' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) BNR_FRT,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'CUS8' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) CA_FUL_TAX,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD = '1400'
                    OR TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD = '1000' THEN (
                        CASE
                            WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'GST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                            ELSE 0
                        END
                    )
                    ELSE 0
                END
            ) CND_GST,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'PPC' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) CRS_DCK_SRG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'CNS' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) CRS_DCK_SPT_FRT_CLD,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'CUS10' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) CUS_REF_FSC,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'DMC' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) DAD_HAD,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD <> '1400'
                    OR TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD <> '1000' THEN (
                        CASE
                            WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'CUS3' THEN TMS_LOA_LNE_CRG.PAY_VAL
                            ELSE 0
                        END
                    )
                    ELSE 0
                END
            ) DCT,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = '260' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) DEL_SRG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'DET' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) DTN,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'DTU' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) DTN_AT_DST,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'DTL' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) DTN_AT_ORI,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'DTV' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) DTV_VHC_DTN,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = '315' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) DTY_CHG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'CUS4' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) EMS_SRG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'ELC' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) XTR_LBR,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'FUE' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) FUE_MDF_FSC,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'n/a' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) FUL_ADJ_FOR_WST_CND,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = '405' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) FUL_SRG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'GST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) GST_GNL_SAL_TAX,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD <> '1400'
                    OR TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD <> '1000' THEN (
                        CASE
                            WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'GST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                            ELSE 0
                        END
                    )
                    ELSE 0
                END
            ) GST_ON_GNL_SAL_TAX,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'IDL' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) INS_DEL,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'LAD' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) LBR_RPR_AND_RTN_ORD,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'LAY' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) LAY,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD <> '1400'
                    OR TMS_LOA_LNE_CRG.SHP_CNY_SAL_ORG_COD <> '1000' THEN (
                        CASE
                            WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'BAS' THEN TMS_LOA_LNE_CRG.PAY_VAL
                            ELSE 0
                        END
                    )
                    ELSE 0
                END
            ) LIN_HUL,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'LUMPER' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) LMP,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'DCT' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) MTR_ARA_FEE,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'MIC' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) MIN_DEL_CHG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'FUE' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) MDF,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'n/a' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) NA_FUL_ADJ_FOR_WST_CND,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'NB_HST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) NEW_BRN_TAX,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'NL_HST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) NEW_FND_TAX,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'FLC' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) NIG_DEL,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'MNC' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) NOT_PRI_TO_DEL,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'NS_HST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) NOV_SCT_TAX,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'CUS5' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) OFF_HRS_DEL,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'ON_HST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) OTR_TAX,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = '999' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) OTR_CHG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'ORM' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) OUT_OF_RUT_MLS,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'PUC' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) PIK_CHG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'QC_PST' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) QBC_TAX,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'RCC' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) RCC,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'RCL' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) RDL,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'CUS10' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) REF_FSC,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'RET' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) RTN,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'CUS2' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) SND_DAY_DEL,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'SORT' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) SRT_AND_SEG_CHG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = '685' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) SPL_DEL,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'SOC' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) STP_ODD_CHG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'SRG' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) STG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'CUS7' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) TEM_SRV,
            SUM(TMS_LOA_LNE_CRG.PAY_VAL) TOT_TRP,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'FFF' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) TRD_SHW_XPO_DEL,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'VOR' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) TRK_ORD_NOT_USD,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'UND' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) UND,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'UNL' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) NLD_FEE,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'WTG' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) WTG_WAT_TIM,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'UNL' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) WLM_LMP,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'DEL' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) WND_DEL_CHG,
            SUM(
                CASE
                    WHEN TMS_LOA_LNE_CRG.CRG_IDT_COD = 'HDW' THEN TMS_LOA_LNE_CRG.PAY_VAL
                    ELSE 0
                END
            ) WND_HLD_CHG
        FROM V_PBI_D_TMS_LOA_LNE_CRG TMS_LOA_LNE_CRG
        GROUP BY LOA_IDT_COD,
            SHP_LEG_IDT_COD
    ) TMS_LOA_LNE_CRG ON (
        TMS_LOA_LNE_CRG.LOA_IDT_COD = TMS_LOA_LNE.LOA_IDT_COD
        AND TMS_LOA_LNE_CRG.SHP_LEG_IDT_COD = TMS_LOA_LNE.SHP_LEG_IDT_COD
    )
    LEFT JOIN (
        select TMS_LOA_LNE_STS_RSN.LOA_IDT_COD LOA_IDT_COD,
            TMS_LOA_LNE_STS_RSN.SHP_LEG_IDT_COD SHP_LEG_IDT_COD,
            TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD SHP_LEG_STS_RSN_COD,
            sum(
                (
                    Case
                        when TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = 'AF' then 1
                        else 0
                    end
                )
            ) ACD
        FROM V_PBI_D_TMS_LOA_LNE_STS_RSN TMS_LOA_LNE_STS_RSN
        GROUP BY TMS_LOA_LNE_STS_RSN.LOA_IDT_COD,
            TMS_LOA_LNE_STS_RSN.SHP_LEG_IDT_COD,
            TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD
    ) TMS_LOA_LNE_STS_RSN ON (
        TMS_LOA_LNE_STS_RSN.LOA_IDT_COD = TMS_LOA_LNE.LOA_IDT_COD
        AND TMS_LOA_LNE_STS_RSN.SHP_LEG_IDT_COD = TMS_LOA_LNE.SHP_LEG_IDT_COD
        AND TMS_LOA_LNE_STS_RSN.SHP_LEG_STS_RSN_COD = TMS_LOA_LNE.SHP_LEG_STS_RSN_COD
    ) -- left join mds destination table:
    LEFT JOIN DEV_NAM.NAM_STG_MDS.R_DST_CPS_TMS TMS_LOA_LNE_DST_CPS ON TMS_LOA_LNE.SHP_LEG_DRP_CBU_COD = TMS_LOA_LNE_DST_CPS.DST_ID -- left join mds campus origin table:
    LEFT JOIN DEV_NAM.NAM_STG_MDS.R_ORN_CPS_TMS TMS_LOA_LNE_ORN_CPS ON TMS_LOA_LNE.SHP_LEG_PIC_CBU_COD = TMS_LOA_LNE_ORN_CPS.ORN_ID
WHERE (
        TMS_LOA_LNE.LOA_TRK_RWK_FLG IN ('NOT REWORKED')
        AND TMS_LOA_LNE.SHP_LEG_DRP_NAM_COD NOT IN ('0054 US SFI DC Fort Worth')
    ) -- group by columns and case when:
GROUP BY TMS_LOA_LNE.LOA_CRE_TIM,
    TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM,
    TMS_LOA_LNE_DST_CPS.RFQ_OGN_RGN,
    TMS_LOA_LNE_ORN_CPS.RFQ_OGN_RGN,
    TMS_LOA_LNE_ORN_CPS.ORN_DES,
    TMS_LOA_LNE_DST_CPS.DST_STE_ID,
    TMS_LOA_LNE_DST_CPS.DST_ID,
    TMS_LOA_LNE_ORN_CPS.CAMPUS,
    TMS_LOA_LNE_DST_CPS.CAMPUS,
    TMS_LOA_LNE.SHP_LEG_PIC_TRL_LOA_TYP_DSC,
    TMS_LOA_LNE.SHP_CBU_REF_DOC_TYP,
    TMS_LOA_LNE.SCH_TEM_COD,
    TMS_LOA_LNE.MAT_TYP_COD,
    TMS_LOA_LNE.LOA_IDT_COD,
    TMS_LOA_LNE.SHP_LEG_IDT_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT,
    TMS_LOA_LNE.SHP_LEG_DRP_ARV_GTE_TIM,
    CASE
        WHEN TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_DRP_APP_DAT
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_DAT
    END,
    TMS_LOA_LNE.SAL_ORG_COD,
    TMS_LOA_LNE.DIS_CHL_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_CUS_COD,
    CASE
        WHEN TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT = 10000101 THEN TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_DAT
    END,
    TMS_LOA_LNE.SHP_LEG_DRP_ORD_GRS_WGH_LBS_CSL_VAL,
    TMS_LOA_LNE.SHP_LEG_DRP_DEL_NET_WGH_LBS_CSL_VAL,
    TMS_LOA_LNE.SHP_LEG_PIC_APP_DAT,
    TMS_LOA_LNE.SHP_LEG_PIC_FNC_DAT,
    TMS_LOA_LNE.SHP_LEG_ACT_MVT_DAT,
    TMS_LOA_LNE.SHP_CNY_DSC,
    TMS_LOA_LNE.LOA_CBU_REF_NUM,
    TMS_LOA_LNE.LOA_ATV_TDR_SCA_COD,
    TMS_LOA_LNE.LOA_ATV_TDR_IDT_DSC,
    TMS_LOA_LNE.LOA_CUS_PIC_FLG,
    TMS_LOA_LNE.SHP_LEG_DRP_CUS_COD,
    TMS_LOA_LNE.SHP_DEL_DOC_NUM,
    TMS_LOA_LNE.SHP_SAL_CUS_PUR_DOC_DAT,
    TMS_LOA_LNE.SHP_SAL_CUS_PUR_DOC_NUM,
    TMS_LOA_LNE.SHP_LEG_DEL_TYP_DSC,
    TMS_LOA_LNE.SHP_LEG_DRP_1ST_ADR_DSC,
    TMS_LOA_LNE.SHP_LEG_DRP_2ND_ADR_DSC,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_CRE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_CRE_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_END_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_APP_WIN_BGN_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_ARV_TIM
    END,
    TMS_LOA_LNE.SHP_LEG_DRP_CTY_DSC,
    TMS_LOA_LNE.SHP_LEG_DRP_CRY_COD,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_WIN_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_WIN_BGN_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_ADU_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_ADU_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_DCK_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_DCK_END_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_DCK_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_DCK_BGN_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_ARV_GTE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_ARV_GTE_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_DEP_GTE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_DEP_GTE_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_LOA_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_LOA_END_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_DRP_LOA_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_DRP_LOA_BGN_TIM
    END,
    TMS_LOA_LNE.SHP_LEG_DRP_STE_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_PST_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_CBU_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_NAM_COD,
    TMS_LOA_LNE.SHP_LEG_INB_OTB_DSC,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_FNC_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_FNC_TIM
    END,
    CASE
        WHEN TMS_LOA_LNE.SHP_LEG_INB_OTB_DSC = 'INBOUND' THEN TMS_LOA_LNE.SHP_LEG_DRP_CBU_COD
        ELSE '#'
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.LOA_CNL_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.LOA_CNL_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.LOA_CLO_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.LOA_CLO_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.LOA_CRE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.LOA_CRE_TIM
    END,
    TMS_LOA_LNE.LOA_GRP_DSC,
    TMS_LOA_LNE.LOA_STS_DSC,
    TMS_LOA_LNE.LOA_TYP_DSC,
    TMS_LOA_LNE.LOA_TRP_MDE_DSC,
    TMS_LOA_LNE.LOA_PIC_DRP_STP_FLG,
    TMS_LOA_LNE.SHP_ORD_DOC_NUM,
    TMS_LOA_LNE.SHP_LEG_PIC_CBU_COD,
    TMS_LOA_LNE.SHP_LEG_PIC_1ST_ADR_DSC,
    TMS_LOA_LNE.SHP_LEG_PIC_2ND_ADR_DSC,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_APP_CRE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_CRE_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_END_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_APP_WIN_BGN_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_ARV_TIM
    END,
    TMS_LOA_LNE.SHP_LEG_PIC_CTY_DSC,
    TMS_LOA_LNE.SHP_LEG_PIC_CRY_COD,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_ADU_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_ADU_TIM
    END,
    TMS_LOA_LNE.SHP_LEG_PIC_NAM_COD,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_DCK_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_DCK_END_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_DCK_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_DCK_BGN_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_ARV_GTE_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_DEP_GTE_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_DEP_GTE_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_LOA_END_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_LOA_END_TIM
    END,
    CASE
        WHEN TO_DATE(TMS_LOA_LNE.SHP_LEG_PIC_LOA_BGN_TIM) = '1000-01-01' THEN NULL
        ELSE TMS_LOA_LNE.SHP_LEG_PIC_LOA_BGN_TIM
    END,
    TMS_LOA_LNE.SHP_LEG_PIC_STE_COD,
    TMS_LOA_LNE.SHP_LEG_PIC_PST_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_INI_RQT_DEL_DAT,
    TMS_LOA_LNE.LOA_TRK_RWK_FLG,
    TMS_LOA_LNE.SHP_CNY_SAL_ORG_COD,
    TMS_LOA_LNE.SHP_LEG_WRH_LOA_SEQ_NUM,
    TMS_LOA_LNE.SHP_LEG_STS_DSC,
    TMS_LOA_LNE.LOA_TRK_USG_FLG,
    TMS_LOA_LNE.SHP_LEG_PAY_CUR_COD,
    TMS_LOA_LNE.SHP_LEG_RTE_UOM_COD,
    TMS_LOA_LNE.SHP_LEG_DRP_DOC_UOM_COD,
    TMS_LOA_LNE_CRG.ADD_DAY,
    TMS_LOA_LNE_CRG.CUS_DCT,
    TMS_LOA_LNE_CRG.APP_FEE,
    TMS_LOA_LNE_CRG.bas_lhl_dol,
    TMS_LOA_LNE_CRG.dtl_dtn_at_ori_dol,
    TMS_LOA_LNE_CRG.dtl_dtn_at_DEL_dol,
    TMS_LOA_LNE_CRG.gst_grl_sal_tax_dol,
    TMS_LOA_LNE_CRG.har_hrm_sal_tax_dol,
    TMS_LOA_LNE_CRG.nb_hst_new_brk_tax_dol,
    TMS_LOA_LNE_CRG.nl_hst_nFd_tax_dol,
    TMS_LOA_LNE_CRG.ns_hst_nov_sct_tax_dol,
    TMS_LOA_LNE_CRG.on_hst_ont_tax_dol,
    TMS_LOA_LNE_CRG.qc_pst_qbc_tax_dol,
    TMS_LOA_LNE_CRG.soc_stp_off_dol,
    TMS_LOA_LNE_CRG.und_uld_lmp_dol,
    TMS_LOA_LNE_CRG.BAS_ITM,
    TMS_LOA_LNE_CRG.BC_CRB_CHG,
    TMS_LOA_LNE_CRG.BNR_FRT,
    TMS_LOA_LNE_CRG.CA_FUL_TAX,
    TMS_LOA_LNE_CRG.CND_GST,
    TMS_LOA_LNE_CRG.CRS_DCK_SRG,
    TMS_LOA_LNE_CRG.CRS_DCK_SPT_FRT_CLD,
    TMS_LOA_LNE_CRG.CUS_REF_FSC,
    TMS_LOA_LNE_CRG.DAD_HAD,
    TMS_LOA_LNE_CRG.DCT,
    TMS_LOA_LNE_CRG.DEL_SRG,
    TMS_LOA_LNE_CRG.DTN,
    TMS_LOA_LNE_CRG.DTN_AT_DST,
    TMS_LOA_LNE_CRG.DTN_AT_ORI,
    TMS_LOA_LNE_CRG.DTV_VHC_DTN,
    TMS_LOA_LNE_CRG.DTY_CHG,
    TMS_LOA_LNE_CRG.EMS_SRG,
    TMS_LOA_LNE_CRG.XTR_LBR,
    TMS_LOA_LNE_CRG.FUE_MDF_FSC,
    TMS_LOA_LNE_CRG.FUL_ADJ_FOR_WST_CND,
    TMS_LOA_LNE_CRG.FUL_SRG,
    TMS_LOA_LNE_CRG.GST_GNL_SAL_TAX,
    TMS_LOA_LNE_CRG.GST_ON_GNL_SAL_TAX,
    TMS_LOA_LNE_CRG.INS_DEL,
    TMS_LOA_LNE_CRG.LBR_RPR_AND_RTN_ORD,
    TMS_LOA_LNE_CRG.LAY,
    TMS_LOA_LNE_CRG.LIN_HUL,
    TMS_LOA_LNE_CRG.LMP,
    TMS_LOA_LNE_CRG.MTR_ARA_FEE,
    TMS_LOA_LNE_CRG.MIN_DEL_CHG,
    TMS_LOA_LNE_CRG.MDF,
    TMS_LOA_LNE_CRG.NA_FUL_ADJ_FOR_WST_CND,
    TMS_LOA_LNE_CRG.NEW_BRN_TAX,
    TMS_LOA_LNE_CRG.NEW_FND_TAX,
    TMS_LOA_LNE_CRG.NIG_DEL,
    TMS_LOA_LNE_CRG.NOT_PRI_TO_DEL,
    TMS_LOA_LNE_CRG.NOV_SCT_TAX,
    TMS_LOA_LNE_CRG.OFF_HRS_DEL,
    TMS_LOA_LNE_CRG.OTR_TAX,
    TMS_LOA_LNE_CRG.OTR_CHG,
    TMS_LOA_LNE_CRG.OUT_OF_RUT_MLS,
    TMS_LOA_LNE_CRG.PIK_CHG,
    TMS_LOA_LNE_CRG.QBC_TAX,
    TMS_LOA_LNE_CRG.RCC,
    TMS_LOA_LNE_CRG.RDL,
    TMS_LOA_LNE_CRG.REF_FSC,
    TMS_LOA_LNE_CRG.RTN,
    TMS_LOA_LNE_CRG.SRT_AND_SEG_CHG,
    TMS_LOA_LNE_CRG.SPL_DEL,
    TMS_LOA_LNE_CRG.STP_ODD_CHG,
    TMS_LOA_LNE_CRG.STG,
    TMS_LOA_LNE_CRG.TEM_SRV,
    TMS_LOA_LNE_CRG.TOT_TRP,
    TMS_LOA_LNE_CRG.TRD_SHW_XPO_DEL,
    TMS_LOA_LNE_CRG.TRK_ORD_NOT_USD,
    TMS_LOA_LNE_CRG.UND,
    TMS_LOA_LNE_CRG.NLD_FEE,
    TMS_LOA_LNE_CRG.WTG_WAT_TIM,
    TMS_LOA_LNE_CRG.WLM_LMP,
    TMS_LOA_LNE_CRG.WND_DEL_CHG,
    TMS_LOA_LNE_CRG.WND_HLD_CHG