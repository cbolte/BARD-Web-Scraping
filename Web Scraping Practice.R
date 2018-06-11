#Write Code that will pull detection data from the UC Davis BARD Website

#all+receivers location
all <- 'SR_CCFBrW_RT,SR_TowerBrE_RT,GG1,GG1.5,GG2.1,GG2.5,GG3.1,GG3.5,GG4,GG4.5,GG5.1,GG5.5,GG6,GG6.5,GG7,GG7.2,GG7.5,GG7.7,GG8,GG9,RichBr_10_2009,RichBr_11_2009,RichBr_12_2009,RichBr_13_2009,RichBr_14_2009,RichBr_15_2009,RichBr_16_2009,RichBr_17_2009,RichBr_18_2009,RichBr_19_2009,RichBr_2_2009,RichBr_20_2009,RichBr_21_2009,RichBr_22_2009,RichBr_23_2009,RichBr_24_2009,RichBr_25_2009,RichBr_26_2009,RichBr_27_2009,RichBr_28_2009,RichBr_29_2009,RichBr_3_2009,RichBr_4_2009,RichBr_5_2009,RichBr_6_2009,RichBr_7_2009,RichBr_8_2009,RichBr_9_2009,RichBr_E_Channel_2009,RichBr_East_1_2009,RichBr_East_2_2009,RichBr_East_3_2009,RichBr_East_4_2009,RichBr_W_Channel_2009,CarBr01,CarBr02,CarBr03,CarBr04,CarBr05,CarBr06,CarBrAR_N,BenBr00,BenBr01,BenBr02,BenBr03,BenBr04,BenBr05,BenBr06,BenBrCenter,Decker_IsCL3,Decker_IsSE,Decker_IsSW,AntiochBridge09,AntiochBridge11,AntiochBridge13,AntiochBridge15,AntiochBridge17,AntiochBridge18,AntiochBridge19,AntiochBridge20,SR_Horseshoe_FedReleaseSite1,SR_Horseshoe_StateReleaseSite1,SJ_CurtisLanding_StateReleaseSite1,ThreeMile_SacBrnSE,RioVistaBr01,RioVistaBr02,RioVistaBr03,FranksTractW2_N,FranksTractW1_S,ThreeMile_SJbrnW,SteamboatSl_Mouth1,SteamboatSl_Mouth2,SR_Mouth,SR_Mouth_2,Santa_Clara_Shoals2_south,Santa_Clara_Shoals1_N,SandMound,FishermansCut_2,YB_BCE,YB_BCE2,YB_BCW,YB_BCW2,Quimby_2,Quimby_E_Point,PotatoSlough2,PotatoSlough,YB_ToeDrain_Base,FranksTractE2_S,FranksTractE1_N,SJ_PrisonersPointN,SJ_MedfordChannel,MidR_N_of_OR2,MidR_RRBr,MidR_S1,MidR_S2,SJ_MedfordChannel_2,LittleConnection,OR_DiscovBayS,OR_DiscovBayS2,SJ_BlwTurnerCut_1,SJ_BlwTurnerCut_2,Mok_SF_IslemouthSl,CC_CVPD_UCD,CC_CVPU_UCD,CC_InFB_N,CC_RGU1_UCD,Turner_Cut_2,SJ_DWC_N,SJ_DWC_S,Mok_NorthFork,SR_BlwGeorgiana,SR_BlwGeorgiana2,Georg_SloughN2,Georg_SloughN3,SR_DCCSouth,SR_DCCSouth2,SR_DCC2,Mok_SouthFork,SJ_Abv_RoughReady,SR_BlwSteam2,SR_BlwSteam,StmSl_Marina1b,StmSl_Marina2,SR_BlwSutter,SR_BlwSutter2,SutSlough1,SutSlough2,OR_SWoMidR_E1,SJ_BlwOR1,SJ_BlwOR2,OR_WoSJ_W1,OR_WoSJ_W2,SR_Freeport,SR_Freeport_1,Mok_End_Cnfl_SJ,Mok_NF_Base,SR_BlwFeatherR,SR_AbvFeather1,SR_AbvFeather2,SR_BlwChinaBend_E,SR_BlwChinaBend_W,SR_AbvTisdale_E1,SR_AbvTisdale_E2,SR_BlwWards,SR_BlwWardsE,SR_BlwButte1,SR_BlwButte2,SR_ButteBr,SR_ButteBr_E,SR_BlwOrd1,SR_BlwOrd2,SR_BlwIrvineFinch,SR_BlwIrvineFinch2,SR_AbvGCID,SR_AbvGCID_2,SR_BlwDeerCk,SR_BlwDeerCk_2,SR_BlwMillCk_2,SR_AntelopeCkHole,SR_BlwRBDDLwr_E,SR_BlwRBDDLwr_E2,SR_AbvRBDDUpr_E,SR_AbvRBDDUpr_W,SR_AbvBendBr_E1,SR_AbvBendBr_W1,SR_JellysE,SR_JellysW,SR_BattleCk,SR_AbvBattleW,SR_BlwCowCk,SR_BlwClearCk,SR_BlwClearCk_2,SR_BlwBenton,BenBr01_180,BenBr02_180,BenBr03_180,BenBr04_180,BenBr11_180,BenBr12_180,BenBr13_180,BenBr14_180,BenBr15_180,BenBr16_180,BenBrCenter_180,YB_BCE_180,YB_BCW_180,YB_BCW2_180,YB_ToeDrain_Base_180'


get.bard.detections <- function(first_day, last_day, locations, csv_name) {
  url <- paste('http://sandbox5.metro.ucdavis.edu/memo/downloadCSV/', first_day, '%2000:00:00/', last_day, '%2000:00:00/total/null/', locations, '/', 
               sep = '')
  download.file(url, paste(csv_name, '.csv', sep=''))
  det_csv <- read_csv(paste('C:/Users/cbolte/Desktop/R Projects/BARD-Web-Scraping/', csv_name, '.csv', sep=''))
  return(det_csv)
}

det <- get.bard.detections('2013-01-01', '2014-01-01', all, 'TEST_CSV')

#Need to get conglomerations of receivers, with a keywod that allows you to pick different keywords, or some other method to select different receivers.

