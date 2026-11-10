test_that("female player birth dates are parsed", {
  js <- "var dob=19810926;"
  expect_equal(parse_player_dob(js), as.Date("1981-09-26"))
})

test_that("male player birth dates are parsed", {
  js <- "var dob = 19860603;"
  expect_equal(parse_player_dob(js), as.Date("1986-06-03"))
})

test_that("DOB can be found across multiple lines", {
  js <- c(
    "var fullname = 'Serena Williams';",
    "var dob=19810926;",
    "var country = 'USA';"
  )

  expect_equal(parse_player_dob(js), as.Date("1981-09-26"))
})

test_that("missing and invalid birth dates give errors", {
  expect_error(
    parse_player_dob("var name = 'Serena';"),
    "birth date not found"
  )

  expect_error(
    parse_player_dob("var dob = 20261340;"),
    "Invalid player birth date"
  )
})
