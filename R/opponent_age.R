parse_opponent_age <- function(match_date, value) {
  age <- suppressWarnings(as.numeric(value))
  is_dob <- !is.na(value) & grepl("^[0-9]{8}$", value)

  age[is_dob] <- as.numeric(
    as.Date(match_date[is_dob], format = "%Y%m%d") -
      as.Date(value[is_dob], format = "%Y%m%d")
  ) / 365.25

  age
}