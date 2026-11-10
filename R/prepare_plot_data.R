prepare_plot_data <- function(matches) {
  needed <- c("player_age", "age_gap", "result")

  if (!is.data.frame(matches) || !all(needed %in% names(matches))) {
    stop("Please provide valid career match data.", call. = FALSE)
  }

  if (!is.numeric(matches$player_age) || !is.numeric(matches$age_gap)) {
    stop("Age columns must be numeric.", call. = FALSE)
  }

  # Keep valid matches with known ages and win/loss results.
  valid <- is.finite(matches$player_age) &
    is.finite(matches$age_gap) &
    matches$result %in% c("W", "L")

  matches[valid, , drop = FALSE]
}
