
# Set up - dataframe Consensus -----------------------------------------------------------------

attr1_nets <- dt_swx1 <- vector('list', length=length(thresh1))

for (i in seq_along(thresh1)){
    dt_swx1[[i]] <- rbindlist(c(sw1AUD[i],
                                  sw1CON[i],
                                  sw1DAN[i],
                                  sw1DMN[i],
                                  sw1FPN[i],
                                  sw1SAL[i],
                                  sw1SMH[i],
                                  sw1SMM[i],
                                  sw1SUB[i],
                                  sw1UNC[i],
                                  sw1VIS[i],
                                  sw1WB[i])) %>% 
        select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group)
    attr1_nets[[i]] <- rbindlist(list(graph_attr_dt(g1AUD[[1]][[i]]),
                                     graph_attr_dt(g1AUD[[2]][[i]]),
                                     graph_attr_dt(g1CON[[1]][[i]]),
                                     graph_attr_dt(g1CON[[2]][[i]]),
                                     graph_attr_dt(g1DAN[[1]][[i]]),
                                     graph_attr_dt(g1DAN[[2]][[i]]),
                                     graph_attr_dt(g1DMN[[1]][[i]]),
                                     graph_attr_dt(g1DMN[[2]][[i]]),
                                     graph_attr_dt(g1FPN[[1]][[i]]),
                                     graph_attr_dt(g1FPN[[2]][[i]]),
                                     graph_attr_dt(g1MEM[[1]][[i]]),
                                     graph_attr_dt(g1MEM[[2]][[i]]),
                                     graph_attr_dt(g1SAL[[2]][[i]]),
                                     graph_attr_dt(g1SAL[[1]][[i]]),
                                     graph_attr_dt(g1SMH[[1]][[i]]),
                                     graph_attr_dt(g1SMH[[2]][[i]]),
                                     graph_attr_dt(g1SMM[[1]][[i]]),
                                     graph_attr_dt(g1SMM[[2]][[i]]),
                                     graph_attr_dt(g1SUB[[1]][[i]]),
                                     graph_attr_dt(g1SUB[[2]][[i]]),
                                     graph_attr_dt(g1UNC[[1]][[i]]),
                                     graph_attr_dt(g1UNC[[2]][[i]]),
                                     graph_attr_dt(g1VAN[[1]][[i]]),
                                     graph_attr_dt(g1VAN[[2]][[i]]),
                                     graph_attr_dt(g1VIS[[1]][[i]]),
                                     graph_attr_dt(g1VIS[[2]][[i]]),
                                     graph_attr_dt(g1WB[[1]][[i]]),
                                     graph_attr_dt(g1WB[[2]][[i]])))
     attr1_nets[[i]] <- left_join(attr1_nets[[i]], dt_swx1[[i]])
     attr1_nets[[i]] <- attr1_nets[[i]][c(22, 26, 23, 16, 2, 27, 1, 28, 29, 3, 20, 4:15, 19, 21)]
     names(attr1_nets[[i]])[3] <- "Network"
     attr1_nets[[i]]$Network <- str_replace_all(attr1_nets[[i]]$Network, "p", "")
     attr1_nets[[i]] <- data.table(attr1_nets[[i]][!duplicated(attr1_nets[[i]]), ])
}


attr1AUD <- attr1_nets[[1]][Network == "AUD"]
attr1CON <- attr1_nets[[1]][Network == "CON"]
attr1DAN <- attr1_nets[[1]][Network == "DAN"]
attr1DMN <- attr1_nets[[1]][Network == "DMN"]
attr1FPN <- attr1_nets[[1]][Network == "FPN"]
attr1MEM <- attr1_nets[[1]][Network == "MEM"]
attr1SAL <- attr1_nets[[1]][Network == "SAL"]
attr1SMH <- attr1_nets[[1]][Network == "SMH"]
attr1SMM <- attr1_nets[[1]][Network == "SMM"]
attr1SUB <- attr1_nets[[1]][Network == "SUB"]
attr1UNC <- attr1_nets[[1]][Network == "UNC"]
attr1VIS <- attr1_nets[[1]][Network == "VIS"]
attr1WB <- attr1_nets[[1]][Network == "WB"]


all_nets1 <- attr1_nets[[1]] %>% 
    filter(Network != "WB") %>% 
    gather("variable", "value", Lp:vulnerability) %>%
    mutate(metric = paste(Network, variable, sep = "_")) %>% 
    select(-Network, -variable, -threshold) %>% 
    spread(metric, value) %>% 
    select(-108, -109, -110, -119, -125, -127, -236, -245, -251)

write_rds(all_nets1, "subnets_conn_consensus.rds")
write_rds(attr1WB, "whole_brain_conn_consensus.rds")

# Set up - dataframe Density ------------------------------------------------------------------

attr2_nets <- dt_swx2 <- vector('list', length=length(thresh2))

for (i in seq_along(thresh2)){
    dt_swx2[[i]] <- rbindlist(c(sw2AUD[i],
                                sw2CON[i],
                                sw2DAN[i],
                                sw2DMN[i],
                                sw2FPN[i],
                                sw2SAL[i],
                                sw2SMH[i],
                                sw2SMM[i],
                                sw2SUB[i],
                                sw2UNC[i],
                                sw2VIS[i],
                                sw2WB[i])) %>% 
        select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group)
    attr2_nets[[i]] <- rbindlist(list(graph_attr_dt(g2AUD[[1]][[i]]),
                                     graph_attr_dt(g2AUD[[2]][[i]]),
                                     graph_attr_dt(g2CON[[1]][[i]]),
                                     graph_attr_dt(g2CON[[2]][[i]]),
                                     graph_attr_dt(g2DAN[[1]][[i]]),
                                     graph_attr_dt(g2DAN[[2]][[i]]),
                                     graph_attr_dt(g2DMN[[1]][[i]]),
                                     graph_attr_dt(g2DMN[[2]][[i]]),
                                     graph_attr_dt(g2FPN[[1]][[i]]),
                                     graph_attr_dt(g2FPN[[2]][[i]]),
                                     graph_attr_dt(g2MEM[[1]][[i]]),
                                     graph_attr_dt(g2MEM[[2]][[i]]),
                                     graph_attr_dt(g2SAL[[2]][[i]]),
                                     graph_attr_dt(g2SAL[[1]][[i]]),
                                     graph_attr_dt(g2SMH[[1]][[i]]),
                                     graph_attr_dt(g2SMH[[2]][[i]]),
                                     graph_attr_dt(g2SMM[[1]][[i]]),
                                     graph_attr_dt(g2SMM[[2]][[i]]),
                                     graph_attr_dt(g2SUB[[1]][[i]]),
                                     graph_attr_dt(g2SUB[[2]][[i]]),
                                     graph_attr_dt(g2UNC[[1]][[i]]),
                                     graph_attr_dt(g2UNC[[2]][[i]]),
                                     graph_attr_dt(g2VAN[[1]][[i]]),
                                     graph_attr_dt(g2VAN[[2]][[i]]),
                                     graph_attr_dt(g2VIS[[1]][[i]]),
                                     graph_attr_dt(g2VIS[[2]][[i]]),
                                     graph_attr_dt(g2WB[[1]][[i]]),
                                     graph_attr_dt(g2WB[[2]][[i]])))
    attr2_nets[[i]] <- left_join(attr2_nets[[i]], dt_swx2[[i]])
    attr2_nets[[i]] <- attr2_nets[[i]][c(22, 26, 23, 16, 2, 27, 1, 28, 29, 3, 20, 4:15, 19, 21)]
    names(attr2_nets[[i]])[3] <- "Network"
    attr2_nets[[i]]$Network <- str_replace_all(attr2_nets[[i]]$Network, "p", "")
    attr2_nets[[i]] <- data.table(attr2_nets[[i]][!duplicated(attr2_nets[[i]]), ])
}


attr2AUD <- attr2_nets[[1]][Network == "AUD"]
attr2CON <- attr2_nets[[1]][Network == "CON"]
attr2DAN <- attr2_nets[[1]][Network == "DAN"]
attr2DMN <- attr2_nets[[1]][Network == "DMN"]
attr2FPN <- attr2_nets[[1]][Network == "FPN"]
attr2MEM <- attr2_nets[[1]][Network == "MEM"]
attr2SAL <- attr2_nets[[1]][Network == "SAL"]
attr2SMH <- attr2_nets[[1]][Network == "SMH"]
attr2SMM <- attr2_nets[[1]][Network == "SMM"]
attr2SUB <- attr2_nets[[1]][Network == "SUB"]
attr2UNC <- attr2_nets[[1]][Network == "UNC"]
attr2VIS <- attr2_nets[[1]][Network == "VIS"]
attr2WB <- attr2_nets[[1]][Network == "WB"]


all_nets2 <- attr2_nets[[1]] %>% 
    filter(Network != "WB") %>% 
    gather("variable", "value", Lp:vulnerability) %>%
    mutate(metric = paste(Network, variable, sep = "_")) %>% 
    select(-Network, -variable, -threshold) %>% 
    spread(metric, value) %>% 
    select(-108, -109, -110, -119, -125, -127, -236, -245, -251)

write_rds(all_nets2, "subnets_conn_density.rds")
write_rds(attr2WB, "whole_brain_conn_density.rds")


# Set up - dataframe Consistency --------------------------------------------------------------

attr3_nets <- dt_swx3 <- all_nets3 <- vector('list', length=length(thresh2))

for (i in seq_along(thresh2)){
    # dt_swx3[[i]] <- rbindlist(c(sw3AUD[i],
    #                             sw3CON[i],
    #                             sw3DAN[i],
    #                             sw3DMN[i],
    #                             sw3FPN[i],
    #                             sw3SAL[i],
    #                             sw3SMH[i],
    #                             sw3SMM[i],
    #                             sw3SUB[i],
    #                             sw3UNC[i],
    #                             sw3VIS[i],
    #                             sw3WB[i])) %>% 
    #     select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group)
    attr3_nets[[i]] <- rbindlist(list(graph_attr_dt(g3AUD[[1]][[i]]),
                                      graph_attr_dt(g3AUD[[2]][[i]]),
                                      graph_attr_dt(g3CON[[1]][[i]]),
                                      graph_attr_dt(g3CON[[2]][[i]]),
                                      graph_attr_dt(g3DAN[[1]][[i]]),
                                      graph_attr_dt(g3DAN[[2]][[i]]),
                                      graph_attr_dt(g3DMN[[1]][[i]]),
                                      graph_attr_dt(g3DMN[[2]][[i]]),
                                      graph_attr_dt(g3FPN[[1]][[i]]),
                                      graph_attr_dt(g3FPN[[2]][[i]]),
                                      # graph_attr_dt(g3MEM[[1]][[i]]),
                                      # graph_attr_dt(g3MEM[[2]][[i]]),
                                      graph_attr_dt(g3SAL[[2]][[i]]),
                                      graph_attr_dt(g3SAL[[1]][[i]]),
                                      graph_attr_dt(g3SMH[[1]][[i]]),
                                      graph_attr_dt(g3SMH[[2]][[i]]),
                                      # graph_attr_dt(g3SMM[[1]][[i]]),
                                      # graph_attr_dt(g3SMM[[2]][[i]]),
                                      graph_attr_dt(g3SUB[[1]][[i]]),
                                      graph_attr_dt(g3SUB[[2]][[i]]),
                                      graph_attr_dt(g3UNC[[1]][[i]]),
                                      graph_attr_dt(g3UNC[[2]][[i]]),
                                      graph_attr_dt(g3VAN[[1]][[i]]),
                                      graph_attr_dt(g3VAN[[2]][[i]]),
                                      graph_attr_dt(g3VIS[[1]][[i]]),
                                      graph_attr_dt(g3VIS[[2]][[i]]),
                                      graph_attr_dt(g3WB[[1]][[i]]),
                                      graph_attr_dt(g3WB[[2]][[i]])))
    # attr3_nets[[i]] <- left_join(attr3_nets[[i]], dt_swx3[[i]])
    attr3_nets[[i]] <- select(attr3_nets[[i]], 22, 26, 23, 16, 2, 1, 3, 20, 4:15, 19, 21) %>% data.table()
    names(attr3_nets[[i]])[3] <- "Network"
    attr3_nets[[i]]$Network <- str_replace_all(attr3_nets[[i]]$Network, "p", "")
    # attr3_nets[[i]] <- data.table(attr3_nets[[i]][!duplicated(attr3_nets[[i]]), ])
    
    all_nets3[[i]] <- attr3_nets[[i]] %>% 
        filter(Network != "WB") %>% 
        gather("variable", "value", Lp:vulnerability) %>%
        mutate(metric = paste(Network, variable, sep = "_")) %>% 
        select(-Network, -variable, -threshold) %>% 
        spread(metric, value) 
}


attr3AUD <- attr3_nets[[1]][Network == "AUD"]
attr3CON <- attr3_nets[[1]][Network == "CON"]
attr3DAN <- attr3_nets[[1]][Network == "DAN"]
attr3DMN <- attr3_nets[[1]][Network == "DMN"]
attr3FPN <- attr3_nets[[1]][Network == "FPN"]
# attr3MEM <- attr3_nets[[1]][Network == "MEM"]
attr3SAL <- attr3_nets[[1]][Network == "SAL"]
attr3SMH <- attr3_nets[[1]][Network == "SMH"]
# attr3SMM <- attr3_nets[[1]][Network == "SMM"]
attr3SUB <- attr3_nets[[1]][Network == "SUB"]
attr3UNC <- attr3_nets[[1]][Network == "UNC"]
attr3VIS <- attr3_nets[[1]][Network == "VIS"]
attr3WB <- attr3_nets[[1]][Network == "WB"]




write_rds(all_nets3, "subnets_conn_consistency.rds")
write_rds(attr3WB, "whole_brain_conn_consistency.rds")
