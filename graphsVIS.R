
# Set-up --------------------------------------------------------------------------------------

A.norm.sub <- matsVIS$A.norm.sub
A.norm.mean <- matsVIS$A.norm.mean
atlas <- "pVIS"
g.groupVIS <- gVIS <- fnames <- vector('list', length=length(groups))


# Code ----------------------------------------------------------------------------------------

for (i in seq_along(groups)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', j, '/', length(thresholds), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pVIS$name)
            
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
    g.groupVIS[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(g.groupVIS[[i]][[x]])$name <- as.character(pVIS$name)}
    
    g.groupVIS[[i]] <- llply(seq_along(thresholds), function(x) 
        set_brainGraph_attr_sof(g.groupVIS[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    gVIS[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gVIS[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gVIS[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

# Save RDS ------------------------------------------------------------------------------------

write_rds(gVIS, paste0(savedir1, 'gVIS.rds'))
write_rds(g.groupVIS, paste0(savedir1, 'g.groupVIS.rds'))

