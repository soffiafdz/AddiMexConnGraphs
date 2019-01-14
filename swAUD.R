
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "AUD"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1AUD <- analysis_random_graphs(g1AUD, kNumRand, savedir = outdir1, clustering = clustering)
rand2AUD <- analysis_random_graphs(g2AUD, kNumRand, savedir = outdir2, clustering = clustering)
rand3AUD <- analysis_random_graphs(g3AUD, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1AUD, paste0(savedir1, 'rand1AUD.RDS'))
write_rds(rand2AUD, paste0(savedir1, 'rand2AUD.RDS'))
write_rds(rand3AUD, paste0(savedir1, 'rand3AUD.RDS'))

