
fetch_career_js <- function(slug) {
  url <- paste0("https://www.tennisabstract.com/jsmatches/",
                slug, "Career.js")
  path <- tempfile(fileext = ".js")
  on.exit(unlink(path))

  tryCatch(
    utils::download.file(url, path, quiet = TRUE, mode = "wb"),
    error = function(e) {
      stop("Could not download career data for ", slug, ".", call. = FALSE)
    }
  )

  read_career_js(path)
}
