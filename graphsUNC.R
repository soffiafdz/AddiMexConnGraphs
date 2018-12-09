
# Set-up --------------------------------------------------------------------------------------

A.norm.sub <- matsUNC$A.norm.sub
A.norm.mean <- matsUNC$A.norm.mean
atlas <- "pUNC"
g.groupUNC <- gUNC <- fnames <- vector('list', length=length(groups))


# Code ----------------------------------------------------------------------------------------

for (i in seq_along(groups)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', j, '/', length(thresholds), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pUNC$name)
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresholds[j], 
                                             subject = covars[groups[i], Study.ID[k]], 
                                             group = groups[i], 
                                             use.parallel = F, 
                                             A = A.norm.sub[[j]][, , inds[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, 
                                         sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    g.groupUNC[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(g.groupUNC[[i]][[x]])$name <- as.character(pUNC$name)}
    
    g.groupUNC[[i]] <- llply(seq_along(thresholds), function(x) 
        set_brainGraph_attr_sof(g.groupUNC[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    gUNC[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gUNC[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gUNC[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

# Save RDS ------------------------------------------------------------------------------------

write_rds(gUNC, paste0(savedir1, 'gUNC.rds'))
write_rds(g.groupUNC, paste0(savedir1, 'g.groupUNC.rds'))

