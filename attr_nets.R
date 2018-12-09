
# Set up - dataframe --------------------------------------------------------------------------

attr_nets <- dt_swx <- vector('list', length=length(thresholds))

for (i in seq_along(thresholds)){
    dt_swx[[i]] <- rbindlist(c(swAUD[i],
                                  swCON[i],
                                  swDAN[i],
                                  swDMN[i],
                                  swFPN[i],
                                  swSAL[i],
                                  swSMH[i],
                                  swSMM[i],
                                  swSUB[i],
                                  swUNC[i],
                                  swVIS[i],
                                  swWB[i])) %>% 
        select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group)
    attr_nets[[i]] <- rbindlist(list(graph_attr_dt(gAUD[[1]][[i]]),
                                     graph_attr_dt(gAUD[[2]][[i]]),
                                     graph_attr_dt(gCON[[1]][[i]]),
                                     graph_attr_dt(gCON[[2]][[i]]),
                                     graph_attr_dt(gDAN[[1]][[i]]),
                                     graph_attr_dt(gDAN[[2]][[i]]),
                                     graph_attr_dt(gDMN[[1]][[i]]),
                                     graph_attr_dt(gDMN[[2]][[i]]),
                                     graph_attr_dt(gFPN[[1]][[i]]),
                                     graph_attr_dt(gFPN[[2]][[i]]),
                                     graph_attr_dt(gMEM[[1]][[i]]),
                                     graph_attr_dt(gMEM[[2]][[i]]),
                                     graph_attr_dt(gSAL[[2]][[i]]),
                                     graph_attr_dt(gSAL[[1]][[i]]),
                                     graph_attr_dt(gSMH[[1]][[i]]),
                                     graph_attr_dt(gSMH[[2]][[i]]),
                                     graph_attr_dt(gSMM[[1]][[i]]),
                                     graph_attr_dt(gSMM[[2]][[i]]),
                                     graph_attr_dt(gSUB[[1]][[i]]),
                                     graph_attr_dt(gSUB[[2]][[i]]),
                                     graph_attr_dt(gUNC[[1]][[i]]),
                                     graph_attr_dt(gUNC[[2]][[i]]),
                                     graph_attr_dt(gVAN[[1]][[i]]),
                                     graph_attr_dt(gVAN[[2]][[i]]),
                                     graph_attr_dt(gVIS[[1]][[i]]),
                                     graph_attr_dt(gVIS[[2]][[i]]),
                                     graph_attr_dt(gWB[[1]][[i]]),
                                     graph_attr_dt(gWB[[2]][[i]])))
     attr_nets[[i]] <- left_join(attr_nets[[i]], dt_swx[[i]])
     attr_nets[[i]] <- attr_nets[[i]][c(22, 26, 23, 16, 2, 27, 1, 28, 29, 3, 20, 4:15, 19, 21)]
     names(attr_nets[[i]])[3] <- "Network"
     attr_nets[[i]]$Network <- str_replace_all(attr_nets[[i]]$Network, "power", "WB")
     attr_nets[[i]]$Network <- str_replace_all(attr_nets[[i]]$Network, "p", "")
     attr_nets[[i]] <- data.table(attr_nets[[i]][!duplicated(attr_nets[[i]]), ])
}


attrAUD <- attr_nets[[1]][Network == "AUD"]
attrCON <- attr_nets[[1]][Network == "CON"]
attrDAN <- attr_nets[[1]][Network == "DAN"]
attrDMN <- attr_nets[[1]][Network == "DMN"]
attrFPN <- attr_nets[[1]][Network == "FPN"]
attrMEM <- attr_nets[[1]][Network == "MEM"]
attrSAL <- attr_nets[[1]][Network == "SAL"]
attrSMH <- attr_nets[[1]][Network == "SMH"]
attrSMM <- attr_nets[[1]][Network == "SMM"]
attrSUB <- attr_nets[[1]][Network == "SUB"]
attrUNC <- attr_nets[[1]][Network == "UNC"]
attrVIS <- attr_nets[[1]][Network == "VIS"]
attrWB <- attr_nets[[1]][Network == "WB"]


all_nets <- attr_nets[[1]] %>% 
    filter(Network != "WB") %>% 
    gather("variable", "value", Lp:vulnerability) %>%
    mutate(metric = paste(Network, variable, sep = "_")) %>% 
    select(-Network, -variable, -threshold) %>% 
    spread(metric, value) %>% 
    select(-108, -109, -110, -119, -125, -127, -236, -245, -251)

write_rds(all_nets, "subnets_conn.rds")
write_rds(attrWB, "whole_brain_conn.rds")
