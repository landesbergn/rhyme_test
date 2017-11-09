library(httr)
library(dplyr)
library(jsonlite)

datamuse_api <- function(path) {
  url <- modify_url("https://api.datamuse.com", path = path)
  
  resp <- GET(url)
  if (http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  parsed <- jsonlite::fromJSON(content(resp, "text"))
  
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

get_rhyme <- function(word = "test") {
  x <- datamuse_api(paste0("/words?rel_rhy=", word))
  content <- x$content
  
  if ("score" %in% colnames(content)) {
    content <- content %>% top_n(10, score)
  }

  return(content)
}

get_rhyme("forge")
