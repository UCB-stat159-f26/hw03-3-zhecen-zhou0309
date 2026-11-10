test_that("plot data keeps valid matches", {
  matches <- data.frame(
    player_age = c(18, 20, NA, 24),
    age_gap = c(-3, 1, 2, -1),
    result = c("L", "W", "W", "Unknown")
  )

  clean <- prepare_plot_data(matches)

  expect_equal(nrow(clean), 2L)
  expect_equal(clean$result, c("L", "W"))
})

test_that("invalid plot data is rejected", {
  expect_error(
    prepare_plot_data(data.frame(x = 1:3)),
    "valid career match data"
  )

  expect_error(
    prepare_plot_data(data.frame(
      player_age = "twenty",
      age_gap = 2,
      result = "W"
    )),
    "Age columns must be numeric"
  )
})

test_that("age gap plot returns a ggplot object", {
  matches <- data.frame(
    player_age = c(18, 20, 22),
    age_gap = c(-3, 1, 4),
    result = c("L", "W", "W")
  )

  p <- plot_age_gap(matches)

  expect_s3_class(p, "ggplot")
  expect_equal(nrow(p$data), 3L)
})
