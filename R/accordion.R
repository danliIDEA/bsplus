#' Builds an accordion panel-group.
#'
#' An accordion is a group of panels where, at most, one panel body is visible.
#'
#' This constructor takes a single argument, an id.
#' It is your responsibility to ensure that id is unique
#' among html elements in your page. If you have non-unique id's, strange things may
#' happen as your page is rendered.
#'
#' The constructor is a part of a family of function to set the options for
#' panels, and a function to append a panel to the panel group.
#'
#' All of these functions return a \code{bsplus_accordion} object, so you can
#' compose an accordion by piping. The \code{bsplus_accordion} class inherits
#' from htmltools' \code{shiny.tag} class.
#'
#' The \code{set_opts} method is used to modify panels that have yet to
#' be appended. There are two options that can be set for accordions:
#'
#' \describe{
#'   \item{\code{panel_type}}{One of \code{c("default", "primary", "success", "info", "warning", "danger")}.
#'   These are the standard Bootstrap types; the default is \code{"default"}.}
#'   \item{\code{use_heading_link}}{Indicates if the entire panel-heading shall be
#'   made clickable; the default is \code{FALSE}.}
#' }
#'
#' The \code{append} method is used to build and append a panel to an accordion. Such a
#' panel is built using two additional arguments:
#'
#' \describe{
#'   \item{\code{title}}{Usually text for the panel heading, but HTML can be used as well}
#'   \item{\code{content}}{Content for the panel body, can be HTML or an htmltools
#'   \code{\link[htmltools]{tagList}}}
#' }
#'
#' @param id character, id for div
#' @param panel_type character, one of the standard Bootstrap types
#'   \code{c("default", "primary", "success", "info", "warning", "danger")}
#' @param use_heading_link logical, indicates whether to use the entire panel heading
#'   as a link. If \code{FALSE}, uses construction shown in
#'   \url{http://getbootstrap.com/javascript/#collapse-example-accordion};
#'   if \code{TRUE}, makes the entire panel heading clickable.
#' @param title HTML or text, used for the panel heading
#' @param content HTML or \code{\link[htmltools]{tagList}}}, used for the panel body.
#'
#' @return \code{bsplus_accordion} object
#'
#' @examples
#' accordion(id = "meet_the_beatles") %>%
#'   set_opts(panel_type = "success", use_heading_link = TRUE) %>%
#'   append(title = "John Lennon", content = "Rhythm guitar, vocals") %>%
#'   set_opts(panel_type = "info") %>%
#'   append(title = "Paul McCartney", content = "Bass guitar, vocals")
#'
#' @seealso \url{http://getbootstrap.com/javascript/#collapse-example-accordion}
#' @export
#
accordion <- function(id){

  div <- htmltools::tags$div(id = id, class = "panel-group", role="tablist")
  div <- structure(div, class = c("bsplus_accordion", class(div)))
  div <- set_bsaria(div, multiselectable = TRUE)
  div <- set_opts(div, panel_type = "default", use_heading_link = FALSE)

  div
}