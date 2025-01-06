require(httr)
require(dplyr)
require(jsonlite)

Sys.setenv(BEARER_TOKEN = "AAAAAAAAAAAAAAAAAAAAAEtc9wAAAAAAxBJFcCGdrebTTJU3KiO9s78wyeQ%3DJxQpivNye3ovQYSWRXbKNHSeKGm23mlhmUMYouFXWs4amm0ltn")


bearer_token <- Sys.getenv("BEARER_TOKEN")
headers <- c(`Authorization` = sprintf('Bearer %s', bearer_token))


params <- list(`user.fields` = 'description',
               `expansions` = 'pinned_tweet_id')


handle <- readline('$USERNAME')
url_handle <-
  sprintf('https://api.x.com/2/users/by?usernames=%s', handle)


response <-
  httr::GET(url = url_handle,
            httr::add_headers(.headers = headers),
            query = params)
obj <- httr::content(response, as = "text")
print(obj)