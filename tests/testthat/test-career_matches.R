
test_that("WTA match data is parsed correctly", {
  match <- c(
    "19951030", "Canadian Open", "Carpet", "W", "L",
    "", "", "WC", "Q1", "6-1 6-1", "3",
    "Anne Miller", "149", "7", "", "R", "19770119"
  )

  data <- parse_career_matches(list(match), "1981-09-26")

  expect_s3_class(data, "data.frame")
  expect_equal(nrow(data), 1L)
  expect_equal(data$opponent, "Anne Miller")
  expect_equal(data$result, "L")
  expect_equal(data$match_date, as.Date("1995-10-30"))
  expect_equal(data$age_gap, data$player_age - data$opponent_age)
})

test_that("ATP match data is parsed correctly", {
  match <- c(
    "20010910", "Spain F10", "Hard", "S", "L",
    "", "", "WC", "R32", "2-6 7-5 6-2", "3",
    "Guillermo Platel", "731", "", "", "R", "22.264202601"
  )

  data <- parse_career_matches(list(match), "1986-06-03")

  expect_equal(data$opponent, "Guillermo Platel")
  expect_equal(data$result, "L")
  expect_equal(data$opponent_age, 22.264202601)
  expect_equal(data$age_gap, data$player_age - data$opponent_age)
})

test_that("incomplete match records are rejected", {
  match <- c("19951030", "Canadian Open", "Carpet")

  expect_error(
    parse_career_matches(list(match), "1981-09-26"),
    "incomplete"
  )
})
