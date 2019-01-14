
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "CON"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1CON <- analysis_random_graphs(g1CON, kNumRand, savedir = outdir1, clustering = clustering)
rand2CON <- analysis_random_graphs(g2CON, kNumRand, savedir = outdir2, clustering = clustering)
rand3CON <- analysis_random_graphs(g3CON, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1CON, paste0(savedir1, 'rand1CON.RDS'))
write_rds(rand2CON, paste0(savedir1, 'rand2CON.RDS'))
write_rds(rand3CON, paste0(savedir1, 'rand3CON.RDS'))

