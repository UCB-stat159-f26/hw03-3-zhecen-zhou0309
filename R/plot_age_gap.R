#' Plot Age Gaps Across Tennis Matches
#'
#' Create a scatter plot of player age and age differences.
#'
#' @param matches A data frame returned by get_career_matches().
#' @return A ggplot object.
#' @export
plot_age_gap <- function(matches) {
  plot_data <- prepare_plot_data(matches)

  ggplot2::ggplot(plot_data, ggplot2::aes(
    x = rlang::.data$player_age, y = rlang::.data$age_gap,
    color = rlang::.data$result
  )) +
    # The zero line separates older and younger opponents.
    ggplot2::geom_hline(yintercept = 0, color = "gray70") +
    ggplot2::geom_point(alpha = 0.55, size = 1.5) +
    ggplot2::scale_color_manual(
      values = c(W = "#2878A8", L = "#D65A55"),
      labels = c(W = "Win", L = "Loss")
    ) +
    ggplot2::labs(
      title = "Age Gaps Across Career Matches",
      x = "Player Age", y = "Age Gap (Player - Opponent)", color = NULL
    ) +
    ggplot2::theme_minimal(base_size = 12) +
    ggplot2::theme(legend.position = "top")
}