#####################################################################################
##
## Script name: data
##
## Purpose of script:document the packages example data
##
## Author: Natasha Besseling
##
## Date Created: 2024-10-23
##
##
## Notes:
##
##
#####################################################################################
#' NBA ecosystem type threat status data
#'
#'This data is used to make a bar plot of threat status of ecosystems within a functional group.
#'This dataset has a totals column, but this is not necessary.
#'
#' @format ## `NBA_example_bar_plot`
#' A data frame with 8 rows and 6 columns:
#' \describe{
#'   \item{OVERALL types}{Ecosystem functional group name}
#'   \item{Critically Endangered,Endangered,Vulnerable,Least Concern}{Threat status}
#'   \item{TOT}{Total number of ecosystems}
#'   ...
#' }
#' @source SANBI
"NBA_example_bar_plot"

#' NBA ecosystem type protection level data
#'
#'This data is used to make a donut plot of protection level of ecosystems
#'within a functional group.
#'
#' @format ## `NBA_example_donut_plot`
#' A data frame with 8 rows and 5 columns:
#' \describe{
#'   \item{OVERALL types}{Ecosystem functional group name}
#'   \item{Well Protected,Moderately Protected,Poorly Protected,Not Protected}{Protection levels}
#'   ...
#' }
#' @source SANBI
"NBA_example_donut_plot"


#' NBA Redlist index data
#'
#'This data is used to make a line plot of the redlist index across a number of years
#'
#' @format ## `NBA_example_RLI_plot`
#' A data frame with 26 rows and 4 columns:
#' \describe{
#'   \item{Years}{years}
#'   \item{min}{Minimum value}
#'   \item{RLI}{Redlist index}
#'   \item{max}{Maximum value}
#'   ...
#' }
#' @source SANBI
"NBA_example_RLI_plot"

#' NBA category words/ phrases used in threat status/ protection level/ and condition
#' categorisation
#'
#'This data is used to enable users to verify that they are using the
#'standard format for their headings.
#'
#' @format ## `NBA_categories`
#' A vector of names:

#' @source SANBI
"NBA_categories"

