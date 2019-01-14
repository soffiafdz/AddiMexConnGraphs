
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "SMM"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1SMM <- analysis_random_graphs(g1SMM, kNumRand, savedir = outdir1, clustering = clustering)
rand2SMM <- analysis_random_graphs(g2SMM, kNumRand, savedir = outdir2, clustering = clustering)
rand3SMM <- analysis_random_graphs(g3SMM, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1SMM, paste0(savedir1, 'rand1SMM.RDS'))
write_rds(rand2SMM, paste0(savedir1, 'rand2SMM.RDS'))
write_rds(rand3SMM, paste0(savedir1, 'rand3SMM.RDS'))

