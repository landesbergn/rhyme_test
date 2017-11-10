library(httr)
library(dplyr)
library(jsonlite)

datamuse_api <- function(path) {
  url <- modify_url("https://api.datamuse.com", path = path)
  
  resp <- GET(url)
  if (http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  parsed <- jsonlite::fromJSON(content(resp, "text", encoding = "UTF-8"))
  
  structure(
    list(
      content = parsed,
      path = path,
      response = resp
    ),
    class = "datamuse_api"
  )
}

print.datamuse_api <- function(x, ...) {
  cat("<datamuse ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}

get_data <- function(full_path) {
  x <- datamuse_api(full_path)
  content <- x$content
  
  if ("score" %in% colnames(content)) {
    content <- content %>% head(10)
  }
  
  return(content)
}

get_rhyme <- function(word = "test") {
  get_data(paste0("/words?rel_rhy=", word))
}

get_means_like <- function(word = "test") {
  get_data(paste0("/words?ml=", word))
}

get_sounds_like <- function(word = "test") {
  get_data(paste0("/words?sl=", word))
}

get_spelled_like <- function(word = "test") {
  get_data(paste0("/words?sp=", word))
}

get_spelled_like <- function(word = "test") {
  get_data(paste0("/words?sp=", word))
}

get_other_related <- function(word = "test", code = "jja") {
  get_data(paste0("/words?rel_", code, "=", word))
}

get_rhyme("forge")
get_means_like("forge")
get_sounds_like("forge")
get_spelled_like("forge")
get_other_related("forge", code = "jja")
