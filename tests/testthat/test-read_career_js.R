
test_that("career JS data can be read from a local file", {
  path <- tempfile(fileext = ".js")
  on.exit(unlink(path))

  js <- paste0(
    'var morematchmx = [',
    '["19951030", "Canadian Open"],',
    '["20010910", "Spain F10"]',
    '];'
  )
  writeLines(js, path)

  matches <- read_career_js(path)

  expect_length(matches, 2)
  expect_equal(matches[[1]][[1]], "19951030")
  expect_equal(matches[[1]][[2]], "Canadian Open")
  expect_equal(matches[[2]][[2]], "Spain F10")
})

test_that("missing JS files produce an error", {
  path <- tempfile(fileext = ".js")

  expect_error(read_career_js(path))
})
