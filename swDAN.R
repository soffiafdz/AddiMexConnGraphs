
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "DAN"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1DAN <- analysis_random_graphs(g1DAN, kNumRand, savedir = outdir1, clustering = clustering)
rand2DAN <- analysis_random_graphs(g2DAN, kNumRand, savedir = outdir2, clustering = clustering)
rand3DAN <- analysis_random_graphs(g3DAN, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1DAN, paste0(savedir1, 'rand1DAN.RDS'))
write_rds(rand2DAN, paste0(savedir1, 'rand2DAN.RDS'))
write_rds(rand3DAN, paste0(savedir1, 'rand3DAN.RDS'))

