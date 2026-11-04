test_that("WTA opponent birth dates are converted to ages", {
  age <- parse_opponent_age("19951030", "19770119")

  expected <- as.numeric(
    as.Date("1995-10-30") - as.Date("1977-01-19")
  ) / 365.25

  expect_equal(age, expected)
})

test_that("ATP opponent ages are already numeric", {
  age <- parse_opponent_age("20010910", "22.264202601")

  expect_equal(age, 22.264202601)
})

test_that("missing opponent ages stay missing", {
  dates <- c("19951030", "20010910")
  values <- c("", NA_character_)

  ages <- parse_opponent_age(dates, values)

  expect_true(all(is.na(ages)))
})
