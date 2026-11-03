player_slug <- function(name) {
  if (!is.character(name) || length(name) != 1 ||
      is.na(name) || !nzchar(trimws(name))) {
    stop("Please enter a valid player name.", call. = FALSE)
  }

  name <- trimws(name)

  # Keep names that already use Tennis Abstract's format.
  if (!grepl("\\s", name) && grepl("[a-z][A-Z]", name)) {
    return(name)
  }

  name <- gsub("\\s+", " ", tolower(name))
  gsub(" ", "", tools::toTitleCase(name), fixed = TRUE)
}