
# Mean ----------------------------------------------------------------------------------------

smallAUD %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallCON %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallDAN %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallDMN %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallFPN %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallMEM %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallSAL %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallSMH %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallSMM %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallSUB %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallUNC %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallVAN %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallVIS %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))

smallWB %>% 
    group_by(threshold, Group) %>% 
    dplyr::summarize(sigma_mean = mean(sigma), 
                     Lp_mean = mean(Lp), 
                     Cp_mean = mean(Cp))


# T-test --------------------------------------------------------------------------------------

smallAUD %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallCON %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallDAN %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallDMN %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallFPN %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallMEM %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallSAL %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallSMH %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallSMM %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallSUB %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallUNC %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallVAN %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallVIS %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)

smallWB %>% 
    group_by(threshold) %>% 
    dplyr::summarise(sigma_t_test = t.test(sigma ~ Group)$p.value, 
                     Lp_t_test = t.test(Lp ~ Group)$p.value, 
                     Cp_t_test = t.test(Cp ~ Group)$p.value)