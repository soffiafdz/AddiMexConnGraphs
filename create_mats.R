
# Atlas ---------------------------------------------------------------------------------------
power <- fread(paste0(home, 'atlas/power_240818/atlas_power_r.csv'), header = T)
    power <- power[,-9] %>% 
        mutate(lobe = factor(lobe), hemi = factor(hemi), network = factor(network)) %>% 
        data.table()

pAUD <- power[network == "Auditory"]
# pCER <- power[network == "Cerebellar"]#*
pCON <- power[network == "Cingulo-opercular Task Control"]
pDAN <- power[network == "Dorsal attention"]
pDMN <- power[network == "Default mode"]
pFPN <- power[network == "Fronto-parietal Task Control"]
pMEM <- power[network == "Memory retrieval?"]
pSAL <- power[network == "Salience"]
pSMH <- power[network == "Sensory/somatomotor Hand"]
pSMM <- power[network == "Sensory/somatomotor Mouth"]
pSUB <- power[network == "Subcortical"]
pUNC <- power[network == "Uncertain"]
pVAN <- power[network == "Ventral attention"]
pVIS <- power[network == "Visual"]
    


# Threshold -----------------------------------------------------------------------------------
thresholds <- 0.2
sub.thresh <- 0.65


# Whole Brain ---------------------------------------------------------------------------------
matfilesWB <- ext_mat_files('wb')
matsWB <- cr_mats_soph(matfilesWB, inds, "consensus")

# Auditory ------------------------------------------------------------------------------------
matfilesAUD <- ext_mat_files('aud')
matsAUD <- cr_mats_soph(matfilesAUD, inds, "consensus")

# Cerebellar ----------------------------------------------------------------------------------
matfilesCER <- ext_mat_files("cereb")
matsCER <- cr_mats_soph(matfilesCER, inds, "consensus")

# Cingulo-Opercular ---------------------------------------------------------------------------
matfilesCON <- ext_mat_files("co_tc")
matsCON <- cr_mats_soph(matfilesCON, inds, "consensus")

# Dorsal Attention ----------------------------------------------------------------------------
matfilesDAN <- ext_mat_files("d_att")
matsDAN <- cr_mats_soph(matfilesDAN, inds, "consensus")

# Default Mode --------------------------------------------------------------------------------
matfilesDMN <- ext_mat_files("dmn")
matsDMN <- cr_mats_soph(matfilesDMN, inds, "consensus")

# Fronto-Parietal -----------------------------------------------------------------------------
matfilesFPN <- ext_mat_files("fp_tc")
matsFPN <- cr_mats_soph(matfilesFPN, inds, "consensus")

# Memory Retrieval ----------------------------------------------------------------------------
matfilesMEM <- ext_mat_files('mem_r')
matsMEM <- cr_mats_soph(matfilesMEM, inds, "consensus")

# Salience ------------------------------------------------------------------------------------
matfilesSAL <- ext_mat_files("sal")
matsSAL <- cr_mats_soph(matfilesSAL, inds, "consensus")

# Somatomotor Hand ----------------------------------------------------------------------------
matfilesSMH <- ext_mat_files('sm_h')
matsSMH <- cr_mats_soph(matfilesSMH, inds, "consensus")

# Somatomotor Mouth ---------------------------------------------------------------------------
matfilesSMM <- ext_mat_files('sm_m')
matsSMM <- cr_mats_soph(matfilesSMM, inds, "consensus")

# Subcortical ---------------------------------------------------------------------------------
matfilesSUB <- ext_mat_files("subc")
matsSUB <- cr_mats_soph(matfilesSUB, inds, "consensus")

# Uncertain -----------------------------------------------------------------------------------
matfilesUNC <- ext_mat_files('uncert')
matsUNC <- cr_mats_soph(matfilesUNC, inds, "consensus")

# Ventral Attention ---------------------------------------------------------------------------
matfilesVAN <- ext_mat_files("v_att")
matsVAN <- cr_mats_soph(matfilesVAN, inds, "consensus")

# Visual --------------------------------------------------------------------------------------
matfilesVIS <- ext_mat_files('vis')
matsVIS <- cr_mats_soph(matfilesVIS, inds, "consensus")


