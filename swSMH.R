
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "SMH"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1SMH <- analysis_random_graphs(g1SMH, kNumRand, savedir = outdir1, clustering = clustering)
rand2SMH <- analysis_random_graphs(g2SMH, kNumRand, savedir = outdir2, clustering = clustering)
rand3SMH <- analysis_random_graphs(g3SMH, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1SMH, paste0(savedir1, 'rand1SMH.RDS'))
write_rds(rand2SMH, paste0(savedir1, 'rand2SMH.RDS'))
write_rds(rand3SMH, paste0(savedir1, 'rand3SMH.RDS'))

