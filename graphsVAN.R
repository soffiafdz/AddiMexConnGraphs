
# Consensus -----------------------------------------------------------------------------------

A.norm.sub <- matsVAN1$A.norm.sub
A.norm.mean <- matsVAN1$A.norm.mean
atlas <- "pVAN"
g1GrVAN <- g1VAN <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh1[-c(9:11)])) {
        print(paste0('Threshold ', j, '/', length(thresh1[-c(9:11)]), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pVAN$name)
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresh1[-c(9:11)][j], 
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
    g1GrVAN[[i]] <- lapply(seq_along(thresh1[-c(9:11)]), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh1[-c(9:11)])) {V(g1GrVAN[[i]][[x]])$name <- as.character(pVAN$name)}
    
    g1GrVAN[[i]] <- llply(seq_along(thresh1[-c(9:11)]), function(x) 
        set_brainGraph_attr_sof(g1GrVAN[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh1[-c(9:11)][x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g1VAN[[i]] <- fnames[[i]] <- vector('list', length = length(thresh1[-c(9:11)]))
    for (j in seq_along(thresh1[-c(9:11)])) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g1VAN[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g1VAN[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g1VAN, paste0(savedir1, 'g1VAN.rds'))
write_rds(g1GrVAN, paste0(savedir1, 'g1GrVAN.rds'))


# Density -------------------------------------------------------------------------------------

A.norm.sub <- matsVAN2$A.norm.sub
A.norm.mean <- matsVAN2$A.norm.mean
atlas <- "pVAN"
g2GrVAN <- g2VAN <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh2)) {
        print(paste0('Threshold ', j, '/', length(thresh2), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pVAN$name)
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresh2[j], 
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
    g2GrVAN[[i]] <- lapply(seq_along(thresh2), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh2)) {V(g2GrVAN[[i]][[x]])$name <- as.character(pVAN$name)}
    
    g2GrVAN[[i]] <- llply(seq_along(thresh2), function(x) 
        set_brainGraph_attr_sof(g2GrVAN[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh2[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g2VAN[[i]] <- fnames[[i]] <- vector('list', length = length(thresh2))
    for (j in seq_along(thresh2)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2VAN[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g2VAN[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g2VAN, paste0(savedir1, 'g2VAN.rds'))
write_rds(g2GrVAN, paste0(savedir1, 'g2GrVAN.rds'))


# Consistency ---------------------------------------------------------------------------------

A.norm.sub <- matsVAN3$A.norm.sub
A.norm.mean <- matsVAN3$A.norm.mean
atlas <- "pVAN"
g3GrVAN <- g3VAN <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh2)) {
        print(paste0('Threshold ', j, '/', length(thresh2), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pVAN$name)
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresh2[j], 
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
    g3GrVAN[[i]] <- lapply(seq_along(thresh2), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh2)) {V(g3GrVAN[[i]][[x]])$name <- as.character(pVAN$name)}
    
    g3GrVAN[[i]] <- llply(seq_along(thresh2), function(x) 
        set_brainGraph_attr_sof(g3GrVAN[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh2[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g3VAN[[i]] <- fnames[[i]] <- vector('list', length = length(thresh2))
    for (j in seq_along(thresh2)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g3VAN[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g3VAN[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g3VAN, paste0(savedir1, 'g3VAN.rds'))
write_rds(g3GrVAN, paste0(savedir1, 'g3GrVAN.rds'))
