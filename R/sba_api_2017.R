sba_api_2017 <- function(TK) {
  
  url <- paste0("https://api.census.gov/data/2017/ecnbasic?get=EMP,ESTAB,PAYANN,PAYQTR1,RCPTOT,GEO_ID&for=county:*&NAICS2017=",
                TK,
                "&key=ec901d907020e0a48a8035d41c1b35c94c85468e")
  
  sbacounty_json <- GET(url = url, 
                        user_agent("Georgetown University Student (rdc74@georgetown.edu)"))
  
  sbacounty_json <- content(sbacounty_json, "text")
  
  sba_county <- fromJSON(sbacounty_json)
  
  sba_county <- header.true(as_tibble(sba_county))
  
  return(sba_county)
}

#include later:http_status(sbacounty_json)