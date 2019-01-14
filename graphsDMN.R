
# Consensus -----------------------------------------------------------------------------------

A.norm.sub <- matsDMN1$A.norm.sub
A.norm.mean <- matsDMN1$A.norm.mean
atlas <- "pDMN"
g1GrDMN <- g1DMN <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh1)) {
        print(paste0('Threshold ', j, '/', length(thresh1), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pDMN$name)
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresh1[j], 
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
    g1GrDMN[[i]] <- lapply(seq_along(thresh1), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh1)) {V(g1GrDMN[[i]][[x]])$name <- as.character(pDMN$name)}
    
    g1GrDMN[[i]] <- llply(seq_along(thresh1), function(x) 
        set_brainGraph_attr_sof(g1GrDMN[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh1[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g1DMN[[i]] <- fnames[[i]] <- vector('list', length = length(thresh1))
    for (j in seq_along(thresh1)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g1DMN[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g1DMN[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g1DMN, paste0(savedir1, 'g1DMN.rds'))
write_rds(g1GrDMN, paste0(savedir1, 'g1GrDMN.rds'))


# Density -------------------------------------------------------------------------------------

A.norm.sub <- matsDMN2$A.norm.sub
A.norm.mean <- matsDMN2$A.norm.mean
atlas <- "pDMN"
g2GrDMN <- g2DMN <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh2)) {
        print(paste0('Threshold ', j, '/', length(thresh2), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pDMN$name)
            
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
    g2GrDMN[[i]] <- lapply(seq_along(thresh2), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh2)) {V(g2GrDMN[[i]][[x]])$name <- as.character(pDMN$name)}
    
    g2GrDMN[[i]] <- llply(seq_along(thresh2), function(x) 
        set_brainGraph_attr_sof(g2GrDMN[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh2[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g2DMN[[i]] <- fnames[[i]] <- vector('list', length = length(thresh2))
    for (j in seq_along(thresh2)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2DMN[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g2DMN[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g2DMN, paste0(savedir1, 'g2DMN.rds'))
write_rds(g2GrDMN, paste0(savedir1, 'g2GrDMN.rds'))


# Consistency ---------------------------------------------------------------------------------

A.norm.sub <- matsDMN3$A.norm.sub
A.norm.mean <- matsDMN3$A.norm.mean
atlas <- "pDMN"
g3GrDMN <- g3DMN <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh2)) {
        print(paste0('Threshold ', j, '/', length(thresh2), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pDMN$name)
            
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
    g3GrDMN[[i]] <- lapply(seq_along(thresh2), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh2)) {V(g3GrDMN[[i]][[x]])$name <- as.character(pDMN$name)}
    
    g3GrDMN[[i]] <- llply(seq_along(thresh2), function(x) 
        set_brainGraph_attr_sof(g3GrDMN[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh2[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g3DMN[[i]] <- fnames[[i]] <- vector('list', length = length(thresh2))
    for (j in seq_along(thresh2)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g3DMN[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g3DMN[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g3DMN, paste0(savedir1, 'g3DMN.rds'))
write_rds(g3GrDMN, paste0(savedir1, 'g3GrDMN.rds'))
