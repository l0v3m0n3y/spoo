# spoo
api for spoo.me free short url service
# Example
```nim
import asyncdispatch, spoo, json, strutils
let data = waitFor short_url("link")
echo data["short_url"].getStr()
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
