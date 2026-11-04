parse_player_dob <- function(html) {
  text <- paste(html, collapse = "\n")
  pattern <- "var\\s+dob\\s*=\\s*['\"]?([0-9]{8})"
  found <- regmatches(text, regexec(pattern, text, perl = TRUE))[[1]]

  if (length(found) < 2) {
    stop("Player birth date not found in profile.", call. = FALSE)
  }

  dob <- as.Date(found[2], format = "%Y%m%d")
  if (is.na(dob)) stop("Invalid player birth date.", call. = FALSE)

  dob
}