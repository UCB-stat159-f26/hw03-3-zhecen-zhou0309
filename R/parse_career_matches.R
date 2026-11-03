parse_career_matches <- function(matches, player_dob) {
  if (any(lengths(matches) < 17)) {
    stop("Some match records are incomplete.", call. = FALSE)
  }

  dates <- vapply(matches, function(x) x[[1]], character(1))
  results <- vapply(matches, function(x) x[[5]], character(1))
  opponents <- vapply(matches, function(x) x[[12]], character(1))
  ages <- vapply(matches, function(x) x[[17]], character(1))

  match_date <- as.Date(dates, format = "%Y%m%d")
  player_age <- as.numeric(match_date - as.Date(player_dob)) / 365.25
  opponent_age <- parse_opponent_age(dates, ages)

  data.frame(
    match_date, opponent = opponents, result = results,
    player_age, opponent_age,
    age_gap = player_age - opponent_age
  )
}