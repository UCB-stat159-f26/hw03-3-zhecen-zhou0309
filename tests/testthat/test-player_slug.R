test_that("player names are normalized correctly", {
  expect_equal(player_slug("Serena Williams"), "SerenaWilliams")
  expect_equal(player_slug("serena williams"), "SerenaWilliams")
  expect_equal(player_slug("SerenaWilliams"), "SerenaWilliams")
  expect_equal(player_slug("  Serena   Williams  "), "SerenaWilliams")
  expect_equal(player_slug("Rafael Nadal"), "RafaelNadal")
})

test_that("invalid player names are rejected", {
  expect_error(player_slug(""), "valid player name")
  expect_error(player_slug("   "), "valid player name")
  expect_error(player_slug(NA_character_), "valid player name")
  expect_error(player_slug(123), "valid player name")
  expect_error(player_slug(c("Serena", "Nadal")), "valid player name")
})