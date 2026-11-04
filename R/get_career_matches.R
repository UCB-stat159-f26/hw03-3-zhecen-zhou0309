#' Get a Tennis Player's Career Matches
#'
#' Download and process career match data from Tennis Abstract.
#'
#' @param player_name A player's name, such as "Serena Williams".
#' @return A data frame with match dates, opponents, results,
#'   player ages, opponent ages, and age gaps.
#' @export
#'
#' @examples
#' \dontrun{
#' get_career_matches("Serena Williams")
#' }
get_career_matches <- function(player_name) {
  slug <- player_slug(player_name)
  matches <- fetch_career_js(slug)
  player_dob <- fetch_player_dob(slug)

  parse_career_matches(matches, player_dob)
}
