-- select columns:
SELECT
-- create bracket column:
        CASE
            -- first condition:
            WHEN t1.GRS_WGH_CAR_LBS < 3000 THEN '3000'
            -- second condition:
            WHEN t1.GRS_WGH_CAR_LBS >= 3000 AND t1.GRS_WGH_CAR_LBS <= 7000 THEN '3000-7000'
            -- third condition:
            WHEN t1.GRS_WGH_CAR_LBS >= 7000 AND t1.GRS_WGH_CAR_LBS <= 20000 THEN '7000-20000'
            -- fourth condition:
            WHEN t1.GRS_WGH_CAR_LBS >= 20000 AND t1.GRS_WGH_CAR_LBS <= 30000 THEN '20000-30000'
            -- fifth condition:
            WHEN t1.GRS_WGH_CAR_LBS >= 30000 AND t1.GRS_WGH_CAR_LBS <= 39000 THEN '30000-39000'
            -- sixth condition:
            WHEN t1.GRS_WGH_CAR_LBS > 39000 THEN 'Greater Than 39000'
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
            WHEN t1.LOA_PIC_DRP_STP_FLG = 'MULTI DROP' THEN 'MSTL' ELSE LOA_TRP_MDE_DSC END AS "Mode",
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
        CONCAT("SHP_LEG_PIC_NAM_COD", ' - ', "Origin City/State", '_', "SHP_LEG_DRP_NAM_COD",'_',"Destination City/State") AS "Origin Name - City/State - Destination Name - City/State",
        -- create the shuttle(y/n) column:
        CASE WHEN t1.LOA_GRP_DSC = 'SHUTTLE' THEN 'Shuttle' ELSE 'Non-Shuttle' END AS "Shuttle (Y/N)",
        -- create the Shuttle Cost column:
        CASE WHEN "Shuttle (Y/N)" = 'Shuttle' THEN t1.SHP_LEG_PIC_NAM_COD ELSE '0' END AS "Shuttle Origin",
        -- create Shuttle Cost column: first condition:
        CASE WHEN "Shuttle Origin" = 'MINSTER' THEN 64
        -- second condition:
        WHEN "Shuttle Origin" = '0030 US YC PL Portland' OR "Shuttle Origin" = 'AMC SALEM' THEN 429
        -- third condition:
        WHEN "Shuttle Origin" = 'FORT WORTH MFG' THEN 217
        -- fourth condition:
        WHEN "Shuttle Origin" = 'WEST JORDAN MFG' THEN 106
        -- else:
        ELSE 0 END AS "Shuttle Cost",
        -- create Linehaul with Shuttle column:
        IFNULL(ROUND((t1.LIN_HUL+"Shuttle Cost"),2),0) AS "Linehaul with Shuttle",
        -- create Total Transportation with Shuttle column:
        IFNULL(ROUND("TOT_TRP"+"Shuttle Cost",2),0) AS "Total Transportation with Shuttle",
        -- create the Destination Name/Campus column:
        CASE WHEN t2."CAMPUS" IS NULL THEN t1."SHP_LEG_DRP_NAM_COD" ELSE t2."CAMPUS" END AS "Destination Name/Campus",
        -- create Origin Name/Campus column:
        CASE WHEN t3."CAMPUS" IS NULL THEN t1."SHP_LEG_DRP_NAM_COD" ELSE t3.CAMPUS END AS "Origin Name/Campus",
        -- create the Campus Level Lane column:
        CONCAT("Origin Name/Campus",', ', "Destination Name/Campus") AS "Campus Level Lane",
        -- create the DC Flag column:
        LEFT(t1."SHP_LEG_DRP_NAM_COD",4) AS "DC Flag",
        -- create the Inbound/Outbound Flag column:
        CASE WHEN "DC Flag" = '0030' THEN 'INBOUND' ELSE t1."SHP_LEG_INB_OTB_DSC" END AS "Inbound/Outbound Flag",
        -- create the Unique Lane ID column:
        CONCAT("Origin Name/Campus",'-',t2.DST_ID) AS "Unique Lane ID",
        -- create the Origin Campus - Destination Campus City/State Lane column:
        CONCAT("Origin Name/Campus", ', ',"Destination Name/Campus",', ', "Destination City/State") AS "Origin Campus - Destination Campus/City Lane"

-- from clause:
FROM DEV_NAM.NAM_DWH.V_PBI_D_TMS t1
-- inner join Destination Campus table: MDS
INNER JOIN DEV_NAM.NAM_STG_MDS.R_DST_CPS_TMS t2
-- ON:
ON t1."SHP_LEG_DRP_CBU_COD" = t2."DST_ID"
-- inner join Origin Campus table: MDS:
INNER JOIN QAT_NAM.NAM_STG_MDS.R_ORN_CPS_TMS t3
-- ON:
ON t1."SHP_LEG_PIC_CBU_COD" = t3."ORN_ID"