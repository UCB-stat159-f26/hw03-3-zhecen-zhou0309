read_career_js <- function(path) {
  if (!file.exists(path)) {
    stop("Career JS file not found: ", path, call. = FALSE)
  }

  js <- paste(readLines(path, warn = FALSE), collapse = "\n")
  js <- sub("^\\s*var\\s+morematchmx\\s*=\\s*", "", js, perl = TRUE)
  js <- sub(";\\s*$", "", js, perl = TRUE)

  jsonlite::fromJSON(js, simplifyVector = FALSE)
}