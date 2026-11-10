player_slug <- function(name) {
  if (!is.character(name) || length(name) != 1 ||
        is.na(name) || !nzchar(trimws(name))) {
    stop("Please enter a valid player name.", call. = FALSE)
  }

  name <- trimws(name)

  # Keep names already formatted for Tennis Abstract.
  if (!grepl("\\s", name) && grepl("[a-z][A-Z]", name)) {
    return(name)
  }

  # Convert names with spaces into the Tennis Abstract format.
  name <- gsub("\\s+", " ", tolower(name))
  gsub(" ", "", tools::toTitleCase(name), fixed = TRUE)
}
