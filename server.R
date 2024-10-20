
# Define server logic
server <- function(input, output) {
  
  # Define the distances
  main_distances <- c(5, 10, 21.1, 42.2)
  marathon_splits <- c(5, 10, 15, 20, 21.1, 25, 30, 35, 40, 42.2)
  
  # Output for main distances
  output$main_distances_output <- renderTable({
    min <- as.numeric(input$min)
    sec <- as.numeric(input$sec)
    
    # Perform calculations
    main_distances_output <- 
      tibble(split_km = main_distances,
             predicted_splits = as.character(hms::hms(minutes = round(main_distances * (min + sec/60), 1)))) %>% 
      mutate(split_km = as.character(round(split_km,1))) %>%
      mutate(split_km = case_when(split_km == "42.2" ~ "Marathon", 
                                  split_km == "21.1" ~ "Half marathon",
                                  TRUE ~ split_km))
    
    # Return dataframe
    main_distances_output
  })
  
  # Output for marathon splits
  output$marathon_splits_output <- renderTable({
    min <- as.numeric(input$min)
    sec <- as.numeric(input$sec)
    
    # Perform calculations
    marathon_splits_output <- 
      tibble(split_km = marathon_splits,
             predicted_splits = as.character(hms::hms(minutes = round(marathon_splits * (min + sec/60), 1)))) %>% 
      mutate(split_km = as.character(round(split_km,1))) %>%
      mutate(split_km = case_when(split_km == "42.2" ~ "Marathon", 
                                  split_km == "21.1" ~ "Half marathon",
                                  TRUE ~ split_km))
    
    
    # Return dataframe
    marathon_splits_output
  })
}

