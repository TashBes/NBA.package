#' Protection level bar plot
#'
#' Horizontal barplots for the protection level.
#' This function requires a dataframe that contains a columns of the
#' the ecosystem functional groups or taxa, the protection level,
#' and the number and percentage of ecosystems or species that fall within that
#' protection level.
#'
#' The colours and axis titels are created within the function.
#'
#'
#' @param DF The data frame that contains the information on protection level
#' @param X The groups
#' @param Y The protection level percentages
#' @param FILL The protection level categories
#' @param COUNT The frequency counts of the number of ecosystems within each protection level
#'
#' @return Returns a bar graph of protection level per functional group or taxa
#'
#' @importFrom ggplot2  ggplot
#' @importFrom ggplot2  geom_bar
#' @importFrom ggplot2  geom_text
#' @importFrom ggplot2  scale_fill_manual
#' @importFrom ggplot2  ylab
#' @importFrom ggplot2  xlab
#' @importFrom ggplot2  guides
#' @importFrom ggplot2  labs
#' @importFrom ggplot2  scale_y_continuous
#' @importFrom ggplot2  theme_minimal
#' @importFrom ggplot2  theme
#' @importFrom ggplot2  coord_flip
#'
#'@examples
#'#test <- prot_efg(mydata, ecosystem_functional_grps, percentages, protection level, number_of_ecosystems)
#'
#' @export
#'
#'
prot_efg <-function(DF, X, Y, FILL, COUNT) {

  cols <- c("#466a31","#80a952","#d5dec3","#a4a3a3")
  breaks <- c("Well Protected","Moderately Protected","Poorly Protected","No Protection")


  ggplot2::ggplot(DF, aes(y = {{Y}}, x = {{X}}, fill = {{FILL}})) +
    ggplot2::geom_bar(stat = "identity", width = 0.5) + ## change width of bars
    ggplot2::geom_text(aes(label = {{COUNT}}), position = position_stack(vjust = 0.5), # add count labels to the bars and adjust "vjust" value to place text at the beginning, centre or end of bars
              size = 3, color = "black", show.legend = FALSE) + # adjust size of labels with no legend being shown
    ggplot2::scale_fill_manual(values = cols,
                               breaks = breaks) +  # order the colours of the bars in the reversed order
    ggplot2::ylab("Percentage of ecosystem functional types") +
    ggplot2::xlab("") +
    ggplot2::guides(fill = guide_legend(reverse = TRUE, nrow = 2)) +  # display legend in 2 rows
    ggplot2::labs(fill = "") + # change the legend title
    ggplot2::scale_y_continuous(labels = function(x) paste0(x, "%"), breaks = c(0, 50, 100)) + # set the y-axis to show 0%, 50%, and 100%
    ggplot2::theme_minimal() + # create a black bounding box around the plot
    ggplot2::theme(legend.position = "bottom", # position legend to the bottom
          panel.grid.minor = element_blank(), # remove grid lines on every second x-axis value
          axis.line = element_blank(), # remove all x-axis grid lines from
          panel.grid.major.y = element_blank(), # include the horizontal grid line on 1st , 3rd and 5 ... x-axis
          legend.text = element_text(size = 8),
          plot.background = element_rect(color = "black", fill = NA),  # add black border around the entire plot
          plot.margin = margin(10, 10, 10, 10)) +   # extend plot margins to accommodate the border)
    ggplot2::coord_flip()
}

#######################################################################################################
###
#' Threat status bar plot
#'
#' Horizontal barplots for the Threat status.
#' This function requires a dataframe that contains a columns of the
#' the ecosystem functional groups or taxa, the Threat status,
#' and the number and percentage of ecosystems or species that fall within that
#' Threat status.
#'
#' The colours and axis titels are created within the function.
#'
#' @param DF The data frame that contains the information on threat status
#' @param X The groups
#' @param Y The threat status percentages
#' @param FILL The threat status categories
#' @param COUNT The frequency counts of the number of ecosystems within each protection level
#'
#' @return Returns a bar graph of threat status per functional group or taxa
#'
#'
#' @importFrom ggplot2  ggplot
#' @importFrom ggplot2  geom_bar
#' @importFrom ggplot2  geom_text
#' @importFrom ggplot2  scale_fill_manual
#' @importFrom ggplot2  ylab
#' @importFrom ggplot2  xlab
#' @importFrom ggplot2  guides
#' @importFrom ggplot2  labs
#' @importFrom ggplot2  scale_y_continuous
#' @importFrom ggplot2  theme_minimal
#' @importFrom ggplot2  theme
#' @importFrom ggplot2  coord_flip
#'
#' @examples
#' #test <- thr_efg(mydata, ecosystem_functional_grps, percentages, threat_status, number_of_ecosystems)
#' @export
thr_efg <-function(DF, X, Y, FILL, COUNT){

  cols <- c("#b1d798", "#eeeea3", "#fff02a", "#f97835", "#e9302c")
  breaks <- c("Least Concern","Vulnerable", "Endangered", "Critically Endangered")


  ggplot2::ggplot(DF, aes(y = {{Y}}, x = {{X}}, fill = {{FILL}})) +
    ggplot2::geom_bar(stat = "identity", width = 0.5) + # change width of bars
    ggplot2::geom_text(aes(label = {{COUNT}}), position = position_stack(vjust = 0.5), # add count labels to the bars and adjust "vjust" value to place text at the beginning, centre or end of bars
              size = 3, color = "black", show.legend = FALSE) + # adjust size of labels with no legend being shown
    ggplot2::scale_fill_manual(values = cols, breaks = breaks) +  # order the colours of the bars in the reversed order
    ggplot2::ylab("Percentage of ecosystem functional types") +
    ggplot2::xlab("") + ## remove the heading for the y-axis
    ggplot2::guides(fill = guide_legend(reverse = TRUE, nrow = 2)) +  # display legend in 2 rows
    ggplot2::labs(fill = "") + ## change the legend title here
    ggplot2::scale_y_continuous(labels = function(x) paste0(x, "%"), breaks = c(0, 50, 100)) + # set the y-axis to show 0%, 50%, and 100%
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "bottom", # position legend to the bottom
          panel.grid.minor = element_blank(), # remove grid lines on every second x-axis value
          axis.line = element_blank(), # remove all x-axis grid lines
          panel.grid.major.y = element_blank(), # remove the horizontal lines only on 1st , 3rd and 5 ... x-axis
          legend.text = element_text(size = 8), # change legend text size
          plot.background = element_rect(color = "black", fill = NA),  # add border around the entire plot include legend
          plot.margin = margin(10, 10, 10, 10)) +   # extend plot margins to accommodate the border)
    ggplot2::coord_flip()  # flip the orientation of the chart
}

#######################################################################################################
###
#' Threat status donut plot
#'
#' Donut plots for the threat status.
#' This function requires a dataframe that contains a columns of the
#' the ecosystem function groups or taxa, ecosystem types or species, and their threat status.
#'
#' The function will group the ecosystem types or species by the functional
#' group or taxa and threat status, and calculate the number of ecosystem types or species within each functional
#' group or taxa with that threat status.
#' It will also create the colours and axis titles.
#'
#' @param DF The data frame that contains the information on threat status
#' @param FILL The groups
#'
#' @return Returns a bar donut plot of threat status
#'
#'
#' @importFrom ggplot2  ggplot
#' @importFrom ggplot2  geom_rect
#' @importFrom ggplot2  geom_text
#' @importFrom ggplot2  coord_polar
#' @importFrom ggplot2  xlim
#' @importFrom ggplot2  scale_fill_manual
#' @importFrom ggplot2  labs
#' @importFrom ggplot2  theme_void
#' @importFrom ggplot2  theme
#'
#' @export
#'
#' @examples
#' #test <- thr_donut_plot(mydata, threat_status)
#'
thr_donut_plot <-function(DF, FILL)
{

  ### generate a frequency table for the categorical data
  df <- dplyr::count(DF, {{FILL}})

  ### define the order of the protection levels
  ord <- c("Critically Endangered", "Endangered", "Vulnerable", "Near Threatened", "Least Concern")

  ## Prepare the data frame by arranging and setting colors
  df <- df %>%
    dplyr::arrange(factor({{FILL}}, levels = ord))

  df <- df %>%
    dplyr::mutate(ymax = cumsum(n)) %>%
    dplyr::mutate(ymin = ymax -n)

  cols <- c("#e9302c","#f97835","#fff02a","#eeeea3","#b1d798")
  breaks <- c("Critically Endangered", "Endangered", "Vulnerable", "Near Threatened", "Least Concern")

  ggplot2::ggplot(df, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = {{FILL}})) +
    ggplot2::geom_rect() +
    ggplot2::geom_text(aes(x = 3.5, y = (ymin + ymax) / 2, label = n), color = "black", size = 5) +  ## Add this line to include count values
    ggplot2::coord_polar(theta = "y") + ## convert to polar coordinates
    ggplot2::xlim(c(2, 4)) + ## limit x-axis to create a donut chart
    ggplot2::scale_fill_manual(values = cols, breaks = breaks) +
    ggplot2::labs(fill = "Threat Status") +
    ggplot2::theme_void() + ## removes the lines around chart and grey background
    ggplot2::theme(
      panel.background = element_rect(fill = "white", color = NA),  ## set panel background to white
      plot.background = element_rect(fill = "white", color = NA)  ## set plot background to white
    )
}

#######################################################################################################
###
#' Protection level donut plot
#'
#' Donut plot for the protection level.
#' This function requires a dataframe that contains a columns of the
#' the ecosystem function groups or taxa, ecosystem types or species, and their protection level.
#'
#' The function will group the ecosystem types or species by the functional
#' group or taxa and protection level, and calculate the number of ecosystem types or species within each functional
#' group or taxa with that protection level.
#' It will also create the colours and axis titles.
#'
#' @param DF The data frame that contains the information on protection level
#' @param FILL The protection level categories
#'
#' @return Returns a bar donut plot of protection level
#'
#'
#' @importFrom ggplot2  ggplot
#' @importFrom ggplot2  geom_rect
#' @importFrom ggplot2  geom_text
#' @importFrom ggplot2  coord_polar
#' @importFrom ggplot2  xlim
#' @importFrom ggplot2  scale_fill_manual
#' @importFrom ggplot2  labs
#' @importFrom ggplot2  theme_void
#' @importFrom ggplot2  theme
#' @importFrom dplyr count
#' @importFrom dplyr arrange
#' @importFrom dplyr mutate
#'
#'
#' @export
#'
#' @examples
#' #test <- pro_donut_plot(mydata, ecosystem_functional_grps)
#'
pro_donut_plot <-function(DF, FILL)
{

  ### generate a frequency table for the categorical data
  df <- dplyr::count(DF, {{FILL}})


  ### define the order of the protection levels
  ord <- c("Well Protected", "Moderately Protected", "Poorly Protected", "No Protection")

  # Prepare the data frame by arranging and setting colors
  df <- df %>%
    dplyr::arrange(factor({{FILL}}, levels = ord))

  df <- df %>%
    dplyr::mutate(ymax = cumsum(n)) %>%
    dplyr::mutate(ymin = ymax -n)


  cols <- c("#466a31","#80a952","#d5dec3","#a4a3a3")
  breaks <- c("Well Protected","Moderately Protected","Poorly Protected","No Protection")

  ggplot2::ggplot(df, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = {{FILL}})) +
    ggplot2::geom_rect() +
    ggplot2::geom_text(aes(x = 3.5, y = (ymin + ymax) / 2, label = n), color = "black", size = 5) +  # Add this line to include values
    ggplot2::coord_polar(theta = "y") + # convert to polar coordinates
    ggplot2::xlim(c(2, 4)) + # limit x-axis to create a donut chart
    ggplot2::scale_fill_manual(values = cols, breaks = breaks) +
    ggplot2::labs(fill = "Protection Levels") +
    ggplot2::theme_void() + # removes the lines around chart and grey background
    ggplot2::theme(
      panel.background = element_rect(fill = "white", color = NA),  # set panel background to white
      plot.background = element_rect(fill = "white", color = NA)  # set plot background to white

  )

}


#######################################################################################################
###
#' NBA plot function
#'
#' NBA plots for protection level, threat status, and condition.
#' The function expects that the groups are in a column, with one
#' group per row, and the protection level, threat status, or condition
#' categories are the headings of each colunm. Please look at the example
#' data example_NBA_data to see the correct structure for the data. The
#' name of the groups column is irrelevant, but the caterogries must be
#' spelt correctly (there is a list of the standard spellings/ cases
#' of NBA_categories named NBA_categories, which can be accessed for reference).
#'
#'
#'
#' @param DF The data frame that contains the information on protection level
#' @param GROUPS The variables to graph (ecosystem type, taxa, etc)
#' @param COLS The categories to describe the groups (protection level, threat status, condition, etc)
#' @param CHRT A choice of either "bar" or "donut" plot
#' @param NUM A choice to show numbers in the plot, Flase for no numbers
#' @param LAB The x axis label of the plot
#' @param GRP A choice of whether or not to plot the donut graphs by group, TRUE will plot a donut plot for each group.
#' @param SAVE The name of the output file that will be saved to the output folder. If you do not have an outputs folder you will be prompted to make one.
#'
#' @return Returns a plot
#'
#'
#' @importFrom ggplot2  ggplot
#' @importFrom ggplot2  geom_rect
#' @importFrom ggplot2  geom_text
#' @importFrom ggplot2  coord_polar
#' @importFrom ggplot2  xlim
#' @importFrom ggplot2  scale_fill_manual
#' @importFrom ggplot2  labs
#' @importFrom ggplot2  theme_void
#' @importFrom ggplot2  theme
#' @importFrom ggplot2  geom_bar
#' @importFrom ggplot2  ylab
#' @importFrom ggplot2  xlab
#' @importFrom ggplot2  guides
#' @importFrom ggplot2  labs
#' @importFrom ggplot2  scale_y_continuous
#' @importFrom ggplot2  theme_minimal
#' @importFrom ggplot2  theme
#' @importFrom ggplot2  coord_flip
#' @importFrom dplyr count
#' @importFrom dplyr arrange
#' @importFrom dplyr mutate
#' @importFrom tidyr pivot_longer
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @importFrom dplyr ungroup
#' @importFrom dplyr mutate
#'
#'
#'
#' @export
#'
#' @examples
#' #test <- NBA_plot(Fig1a,OVERALL_types,2:5,CHRT = "bar",NUM = TRUE,LAB = "Percentage of ecosystem types",SAVE = "Fig1a")
#'

NBA_plot <- function(DF, GROUPS, COLS, CHRT = c("bar", "donut"), NUM = FALSE, LAB, GRP = TRUE, SAVE){

  cols <- c("#6e9fd4",
            "#6e9fd4",
            "#a5c5c7",
            "#81aba7",
            "#88814e",
            "#88812e",
            "#466a31",
            "#80a952",
            "#d5dec3",
            "#a4a3a3",
            "#a4a3a3",
            "black",
            "#e9302c",
            "#f97835",
            "#fff02a",
            "#eeeea3",
            "brown",
            "grey" ,
            "#b1d798",
            "#DB7D15",
            "#B36611",
            "#808080",
            "#F5C592",
            "#0071C0")

  breaks <- c("Natural",
              "Natural/near-natural",
              "Near-natural",
              "Moderately modified",
              "Heavily modified",
              "Severely/critically modified",
              "Well Protected",
              "Moderately Protected",
              "Poorly Protected",
              "No Protection",
              "Not Protected",
              "Extinct",
              "Critically Endangered",
              "Endangered",
              "Vulnerable",
              "Near Threatened",
              "Data Deficient",
              "Rare",
              "Least Concern",
              "Cropland",
              "Plantation",
              "Built up",
              "Mine",
              "Artificial waterbody")

  if(CHRT == "donut"){

    if(GRP == FALSE) {

      ## Prepare the data frame by arranging and setting colors
      dat <- DF %>%
        tidyr::pivot_longer({{COLS}}, names_to = "FILL", values_to = "COUNT")%>%
        dplyr::group_by(FILL) %>%
        dplyr::summarise(COUNT = sum(COUNT, na.rm = T))  %>%
        dplyr::mutate(FILL = factor(FILL, levels = breaks))%>%
        dplyr::mutate(ymax = cumsum(COUNT)) %>%
        dplyr::mutate(ymin = ymax -COUNT) %>%
        dplyr::ungroup()


      plot <- ggplot2::ggplot(dat, aes(ymax = ymax, ymin = ymin,xmax = 4, xmin = 3,  fill = FILL)) +
        ggplot2::geom_rect() +
        ggplot2::geom_text(aes(x = 3.5, y = (ymin + ymax) / 2, label = COUNT), color = "black", size = 5) +  ## Add this line to include count values
        ggplot2::coord_polar(theta = "y") + ## convert to polar coordinates
        ggplot2::xlim(c(2, 4)) + ## limit x-axis to create a donut chart
        ggplot2::scale_fill_manual(values = cols, breaks = breaks) +
        ggplot2::labs(fill = LAB) +
        ggplot2::theme_void() + ## removes the lines around chart and grey background
        ggplot2::theme(
          panel.background = element_rect(fill = "white", color = NA),  ## set panel background to white
          plot.background = element_rect(fill = "white", color = NA)  ## set plot background to white
        )

    }

    else {


      ## Prepare the data frame by arranging and setting colors
      dat <- DF %>%
        tidyr::pivot_longer({{COLS}}, names_to = "FILL", values_to = "COUNT")%>%
        dplyr::mutate(TOT = sum(COUNT, na.rm = T), .by = {{GROUPS}} )%>%
        dplyr::mutate(PERCENTAGE = (COUNT/TOT)*100)%>%
        dplyr::mutate(FILL = factor(FILL, levels = breaks))%>%
        dplyr::mutate(ymax = cumsum(PERCENTAGE), .by = {{GROUPS}}) %>%
        dplyr::mutate(ymin = ymax -PERCENTAGE)

      plot <-ggplot2::ggplot(dat, aes(ymax = ymax, ymin = ymin,xmax = 4, xmin = 3,  fill = FILL)) +
        ggplot2::geom_rect() +
        ggplot2::facet_wrap(vars({{GROUPS}}))+
        ggplot2::geom_text(aes(x = 3.5, y = (ymin + ymax) / 2, label = COUNT), color = "black", size = 3) +  ## Add this line to include count values
        ggplot2::coord_polar(theta = "y") + ## convert to polar coordinates
        ggplot2::xlim(c(2, 4)) + ## limit x-axis to create a donut chart
        ggplot2::scale_fill_manual(values = cols, breaks = breaks) +
        ggplot2::labs(fill = LAB) +
        ggplot2::theme_void() + ## removes the lines around chart and grey background
        ggplot2::theme(
          panel.background = element_rect(fill = "white", color = NA),  ## set panel background to white
          plot.background = element_rect(fill = "white", color = NA)  ## set plot background to white
        )
    }
  }


  ## if chart is bar:
  else {

    ord <-   DF %>%
      dplyr::pull({{GROUPS}})

    dat <- DF %>%
      tidyr::pivot_longer({{COLS}}, names_to = "FILL", values_to = "COUNT")%>%
      dplyr::mutate(TOT = sum(COUNT, na.rm = T), .by = {{GROUPS}} )%>%
      dplyr::mutate(PERCENTAGE = (COUNT/TOT)*100)%>%
      dplyr::mutate(across(COUNT, ~na_if(., 0))) %>%
      dplyr::mutate(FILL = factor(FILL, levels = breaks))

    if(NUM == TRUE){



      plot <-ggplot2::ggplot(dat, aes(y = PERCENTAGE, x = factor({{GROUPS}}, level = ord), fill = FILL)) +
        ggplot2::geom_bar(stat = "identity", position =  position_stack(reverse = TRUE), width = 0.5) + # change width of bars
        ggplot2::geom_text(aes(label = COUNT),
                           position = position_stack(vjust = 0.5, reverse = TRUE), # add count labels to the bars and adjust "vjust" value to place text at the beginning, centre or end of bars
                           size = 3,
                           color = "black",
                           show.legend = FALSE) + # adjust size of labels with no legend being shown
        ggplot2::scale_fill_manual(values = cols, breaks = breaks)+  # order the colours of the bars in the reversed order
        ggplot2::ylab({{LAB}}) +
        ggplot2::xlab("") + ## remove the heading for the y-axis
        ggplot2::guides(fill = guide_legend(reverse = F, nrow = 1, size = 0.5)) +  # display legend in 2 rows
        ggplot2::labs(fill = "") + ## change the legend title here
        ggplot2::scale_y_continuous(labels = function(x) paste0(x, "%"), breaks = c(0, 50, 100)) + # set the y-axis to show 0%, 50%, and 100%
        ggplot2::theme_minimal() +
        ggplot2::theme(legend.position = "bottom", # position legend to the bottom
                       panel.grid.minor = element_blank(), # remove grid lines on every second x-axis value
                       axis.line = element_blank(), # remove all x-axis grid lines
                       panel.grid.major.y = element_blank(), # remove the horizontal lines only on 1st , 3rd and 5 ... x-axis
                       legend.text = element_text(size = 8), # change legend text size
                       plot.background = element_rect(color = "black", fill = NA),  # add border around the entire plot include legend
                       plot.margin = margin(10, 10, 10, 10)) +   # extend plot margins to accommodate the border)
        ggplot2::coord_flip()  # flip the orientation of the chart
    }

    ## if NUM == FALSE
    else {

      plot <- ggplot2::ggplot(dat, aes(y = PERCENTAGE, x = factor({{GROUPS}}, level = ord), fill = FILL)) +
        ggplot2::geom_bar(stat = "identity", position =  position_stack(reverse = TRUE), width = 0.5) + # change width of bars
        ggplot2::scale_fill_manual(values = cols, breaks = breaks) +  # order the colours of the bars in the reversed order
        ggplot2::ylab({{LAB}}) +
        ggplot2::xlab("") + ## remove the heading for the y-axis
        ggplot2::guides(fill = guide_legend(reverse = F, nrow = 1, size = 0.5)) +  # display legend in 2 rows
        ggplot2::labs(fill = "") + ## change the legend title here
        ggplot2::scale_y_continuous(labels = function(x) paste0(x, "%"), breaks = c(0, 50, 100)) + # set the y-axis to show 0%, 50%, and 100%
        ggplot2::theme_minimal() +
        ggplot2::theme(legend.position = "bottom", # position legend to the bottom
                       panel.grid.minor = element_blank(), # remove grid lines on every second x-axis value
                       axis.line = element_blank(), # remove all x-axis grid lines
                       panel.grid.major.y = element_blank(), # remove the horizontal lines only on 1st , 3rd and 5 ... x-axis
                       legend.text = element_text(size = 8), # change legend text size
                       plot.background = element_rect(color = "black", fill = NA),  # add border around the entire plot include legend
                       plot.margin = margin(10, 10, 10, 10)) +   # extend plot margins to accommodate the border)
        ggplot2::coord_flip()  # flip the orientation of the chart


    }
  }

  ggsave(paste0("outputs/", SAVE, ".png"), height = 10, width = 16, units = 'cm')

  plot

}


#######################################################################################################
###
#' RLI_plot
#'
#'
#'
#' @param DF The data frame that contains the information on protection level
#' @param YEAR The protection level categories
#' @param RLI The protection level categories
#' @param min The protection level categories
#' @param max The protection level categories
#' @param GRP The protection level categories
#'
#' @return Returns a RLI plot
#'
#'
#' @importFrom ggplot2  ggplot
#' @importFrom ggplot2  geom_line
#' @importFrom ggplot2  geom_ribbon
#' @importFrom ggplot2  theme_classic
#' @importFrom ggplot2  ylim
#' @importFrom ggplot2  scale_fill_manual
#' @importFrom ggplot2  labs
#' @importFrom ggplot2  theme_void
#' @importFrom ggplot2  theme
#' @importFrom dplyr count
#' @importFrom dplyr arrange
#' @importFrom dplyr mutate
#'
#'
#' @export
#'
#' @examples
#' #test <- pro_donut_plot(mydata, ecosystem_functional_grps)
#'
RLI_plot <- function(DF,YEAR, RLI, min, max, GRP = FALSE){

if(GRP == TRUE){

  ggplot2::ggplot(DF, aes(x = {{YEAR}}, y = {{RLI}}, group = {{GROUP}}, color = {{GROUP}})) +
    ggplot2::geom_line(linetype="dashed") +
    ggplot2::geom_ribbon(aes(ymin = {{min}}, ymax = {{max}}), fill = "grey", alpha = .2, colour = NA)+
    ggplot2::theme_classic()+
    ggplot2::ylim(0.7,1)

}
else {

  ggplot2::ggplot(DF, aes(x = {{YEAR}}, y = {{RLI}})) +
    ggplot2::geom_line(aes(y = {{RLI}})) +
    ggplot2::geom_ribbon(aes(ymin = {{min}}, ymax = {{max}}),alpha = .3, colour = NA)+
    ggplot2::theme_classic()+
    ggplot2::ylim(0.7,1)


}
}



#######################################################################################################
