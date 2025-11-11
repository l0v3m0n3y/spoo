import asyncdispatch, httpclient, json, strutils
const api = "https://spoo.me"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "user-agent": "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.3",
    "Host": "spoo.me",
    "Content-Type": "application/x-www-form-urlencoded",
    "accept": "application/json"
})

proc short_url*(url:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let json = %*{"url":url}
    let response = await client.post(api & "/",body= "url=" & url)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc stat_url*(url_name:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/stats/" & url_name)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
