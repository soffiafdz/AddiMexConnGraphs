
# Atlas ---------------------------------------------------------------------------------------
pWB <- fread('atlas_power_r.csv', header = T)
    pWB <- pWB[,-9] %>% 
        mutate(lobe = factor(lobe), hemi = factor(hemi), network = factor(network)) %>% 
        data.table()

pAUD <- pWB[network == "Auditory"]
# pCER <- pWB[network == "Cerebellar"]#*
pCON <- pWB[network == "Cingulo-opercular Task Control"]
pDAN <- pWB[network == "Dorsal attention"]
pDMN <- pWB[network == "Default mode"]
pFPN <- pWB[network == "Fronto-parietal Task Control"]
pMEM <- pWB[network == "Memory retrieval?"]
pSAL <- pWB[network == "Salience"]
pSMH <- pWB[network == "Sensory/somatomotor Hand"]
pSMM <- pWB[network == "Sensory/somatomotor Mouth"]
pSUB <- pWB[network == "Subcortical"]
pUNC <- pWB[network == "Uncertain"]
pVAN <- pWB[network == "Ventral attention"]
pVIS <- pWB[network == "Visual"]
    


# Threshold -----------------------------------------------------------------------------------
thresh1 <- seq(0.05 , 0.3, 0.025)
thresh2 <- rev(seq(0.1, 0.5, 0.05))
sub.thresh <- 0.65


# Auditory ------------------------------------------------------------------------------------
matfilesAUD <- ext_mat_files('aud')
matsAUD1 <- cr_mats_soph(matfilesAUD, inds, "consensus", thresh1)
matsAUD2 <- cr_mats_soph(matfilesAUD, inds, "density", thresh2)
matsAUD3 <- cr_mats_soph(matfilesAUD, inds, "consistency", thresh2)


# Cingulo-Opercular ---------------------------------------------------------------------------
matfilesCON <- ext_mat_files('co_tc')
matsCON1 <- cr_mats_soph(matfilesCON, inds, "consensus", thresh1)
matsCON2 <- cr_mats_soph(matfilesCON, inds, "density", thresh2)
matsCON3 <- cr_mats_soph(matfilesCON, inds, "consistency", thresh2)


# Dorsal Attention ----------------------------------------------------------------------------
matfilesDAN <- ext_mat_files('d_att')
matsDAN1 <- cr_mats_soph(matfilesDAN, inds, "consensus", thresh1)
matsDAN2 <- cr_mats_soph(matfilesDAN, inds, "density", thresh2)
matsDAN3 <- cr_mats_soph(matfilesDAN, inds, "consistency", thresh2)


# Default Mode --------------------------------------------------------------------------------
matfilesDMN <- ext_mat_files('dmn')
matsDMN1 <- cr_mats_soph(matfilesDMN, inds, "consensus", thresh1)
matsDMN2 <- cr_mats_soph(matfilesDMN, inds, "density", thresh2)
matsDMN3 <- cr_mats_soph(matfilesDMN, inds, "consistency", thresh2)


# Fronto-Parietal -----------------------------------------------------------------------------
matfilesFPN <- ext_mat_files('fp_tc')
matsFPN1 <- cr_mats_soph(matfilesFPN, inds, "consensus", thresh1)
matsFPN2 <- cr_mats_soph(matfilesFPN, inds, "density", thresh2)
matsFPN3 <- cr_mats_soph(matfilesFPN, inds, "consistency", thresh2)


# Memory Retrieval ----------------------------------------------------------------------------
matfilesMEM <- ext_mat_files('mem_r')
matsMEM1 <- cr_mats_soph(matfilesMEM, inds, "consensus", thresh1)
matsMEM2 <- cr_mats_soph(matfilesMEM, inds, "density", thresh2)
matsMEM3 <- cr_mats_soph(matfilesMEM, inds, "consistency", thresh2)


# Salience ------------------------------------------------------------------------------------
matfilesSAL <- ext_mat_files('sal')
matsSAL1 <- cr_mats_soph(matfilesSAL, inds, "consensus", thresh1)
matsSAL2 <- cr_mats_soph(matfilesSAL, inds, "density", thresh2)
matsSAL3 <- cr_mats_soph(matfilesSAL, inds, "consistency", thresh2)


# Somatomotor Hand ----------------------------------------------------------------------------
matfilesSMH <- ext_mat_files('sm_h')
matsSMH1 <- cr_mats_soph(matfilesSMH, inds, "consensus", thresh1)
matsSMH2 <- cr_mats_soph(matfilesSMH, inds, "density", thresh2)
matsSMH3 <- cr_mats_soph(matfilesSMH, inds, "consistency", thresh2)


# Somatomotor Mouth ---------------------------------------------------------------------------
matfilesSMM <- ext_mat_files('sm_m')
matsSMM1 <- cr_mats_soph(matfilesSMM, inds, "consensus", thresh1)
matsSMM2 <- cr_mats_soph(matfilesSMM, inds, "density", thresh2)
matsSMM3 <- cr_mats_soph(matfilesSMM, inds, "consistency", thresh2)


# Subcortical ---------------------------------------------------------------------------------
matfilesSUB <- ext_mat_files('subc')
matsSUB1 <- cr_mats_soph(matfilesSUB, inds, "consensus", thresh1)
matsSUB2 <- cr_mats_soph(matfilesSUB, inds, "density", thresh2)
matsSUB3 <- cr_mats_soph(matfilesSUB, inds, "consistency", thresh2)


# Uncertain -----------------------------------------------------------------------------------
matfilesUNC <- ext_mat_files('uncert')
matsUNC1 <- cr_mats_soph(matfilesUNC, inds, "consensus", thresh1)
matsUNC2 <- cr_mats_soph(matfilesUNC, inds, "density", thresh2)
matsUNC3 <- cr_mats_soph(matfilesUNC, inds, "consistency", thresh2)


# Ventral Attention ---------------------------------------------------------------------------
matfilesVAN <- ext_mat_files('v_att')
matsVAN1 <- cr_mats_soph(matfilesVAN, inds, "consensus", thresh1)
matsVAN2 <- cr_mats_soph(matfilesVAN, inds, "density", thresh2)
matsVAN3 <- cr_mats_soph(matfilesVAN, inds, "consistency", thresh2)


# Visual --------------------------------------------------------------------------------------
matfilesVIS <- ext_mat_files('vis')
matsVIS1 <- cr_mats_soph(matfilesVIS, inds, "consensus", thresh1)
matsVIS2 <- cr_mats_soph(matfilesVIS, inds, "density", thresh2)
matsVIS3 <- cr_mats_soph(matfilesVIS, inds, "consistency", thresh2)


# Whole Brain ---------------------------------------------------------------------------------
matfilesWB <- ext_mat_files('wb')
matsWB1 <- cr_mats_soph(matfilesWB, inds, "consensus", thresh1)
matsWB2 <- cr_mats_soph(matfilesWB, inds, "density", thresh2)
matsWB3 <- cr_mats_soph(matfilesWB, inds, "consistency", thresh2)

