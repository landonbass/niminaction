import 
    httpclient, json

let client = newHttpClient()
let res    = client.request("http://www.mocky.io/v2/5834f2660f00008c13bba867", httpMethod = HttpGet)

echo res.headers["x-server"]
echo res.body