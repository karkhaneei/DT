dropNULL = function(x) {
  if (length(x) == 0 || !is.list(x)) return(x)
  x[!unlist(lapply(x, is.null))]
}

isFALSE = function(x) identical(x, FALSE)

is.Date = function(x) inherits(x, c('Date', 'POSIXlt', 'POSIXct'))

# for CSS propertices: fontWeight -> font-weight, backgroundColor ->
# background-color, etc
upperToDash = function(x) {
  x = gsub('^(.)', '\\L\\1', x, perl = TRUE)
  x = gsub('([A-Z])', '-\\L\\1', x, perl = TRUE)
  x
}

# not rigorous, but should work in most cases
inShiny = function() 'shiny' %in% loadedNamespaces()

in_dir = function(dir, expr) {
  owd = setwd(dir); on.exit(setwd(owd))
  expr
}

existing_files = function(x) x[file.exists(x)]

# a temporary workaround before htmltools >= 0.3.5 is on CRAN
htmlDependency = function(..., all_files = TRUE) {
  FUN = htmltools::htmlDependency
  if (packageVersion('htmltools') >= '0.3.5') {
    FUN(..., all_files = all_files)
  } else FUN(...)
}
