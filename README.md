
# NBA.package

<!-- badges: start -->
<!-- badges: end -->

The goal of the NBA.package is to allow all graphs/ plots/ and maps
created for the NBA to be created easily with targeted functions that
enable ease of use and standardisation of results.

## Installation

You can install the development version of NBA.package from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("TashBes/NBA.package")
```

## Data

All data should be in a standard format where the groups/variables
(e.g. Functional ecosystem types/ taxa) are listed in the first column,
and the threat status/ protection level ect categories are in subsequent
columns. There is no need to have a totals column. Having extra columns
in not a problem, as long as you have the columns mentioned.

There are three example datasets in this package that can be use as
references (NBA_example_bar_plot, NBA_example_RLI_plot, and
NBA_example_donut_plot) as well as a list of all possible names to be
used in the categories columns (NBA_categories), please pay attention to
spelling and cases as the functions are case sensitive.

## Issues

If you find any issues with the package or functions, or if you have any
suggestions for improvements to the package please go to the git
repository and log an issue so it can be dealt with.
