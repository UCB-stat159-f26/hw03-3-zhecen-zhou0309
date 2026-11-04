
fetch_player_dob <- function(slug) {
  url <- paste0("https://www.tennisabstract.com/jsmatches/",
                slug, ".js")

  js <- tryCatch(
    readLines(url, warn = FALSE),
    error = function(e) {
      stop("Could not load player info for ", slug, ".", call. = FALSE)
    }
  )

  parse_player_dob(js)
}
