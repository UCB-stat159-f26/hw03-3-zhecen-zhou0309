#' Plot Age Gaps Across Tennis Matches
#'
#' Create a NYT-style scatter plot of tennis career matches.
#'
#' @param matches A data frame returned by get_career_matches().
#' @return A ggplot object.
#' @importFrom rlang .data
#' @export
plot_age_gap <- function(matches) {
  plot_data <- prepare_plot_data(matches)
  # nolint start: object_usage_linter.
  mapping <- ggplot2::aes(
    x = .data$player_age, y = .data$age_gap, color = .data$result
  )
  # nolint end: object_usage_linter.
  p <- ggplot2::ggplot(plot_data, mapping)
  p <- p + ggplot2::geom_hline(yintercept = 0, color = "gray60")
  p <- p + ggplot2::geom_point(size = 1.6, alpha = 0.85)
  p <- p + ggplot2::scale_x_continuous(position = "top")
  p <- p + ggplot2::scale_color_manual(
    values = c(W = "#42C5E5", L = "#95358B"),
    breaks = c("W", "L"), labels = c("Match won", "Match lost")
  )
  p <- p + ggplot2::labs(title = "Professional Tennis Matches")
  p <- p + ggplot2::labs(x = "Player age", y = "Age difference")
  p <- p + ggplot2::labs(color = NULL, caption = "Source: Tennis Abstract")
  p <- p + ggplot2::theme_minimal(base_size = 12)
  title_style <- ggplot2::element_text(hjust = 0.5, face = "bold")
  p + ggplot2::theme(legend.position = "top", plot.title = title_style)
}
