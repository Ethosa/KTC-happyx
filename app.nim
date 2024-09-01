# Main native file
import
  happyx_native,
  ./assets/types


var
  lastPage = "/"
  readedStories: JsonNode = newJArray()
  lastBranch = 0


callback:
  # HappyX Native helloWorld callback
  proc loadAppData() =
    lastPage = loadString("hapticx.ktc_hpx.lastPage")
    lastBranch = loadInt("hapticx.ktc_hpx.lastBranch")
    let readedStoriesStr = loadString("hapticx.ktc_hpx.readedStories")
    if readedStoriesStr.len > 0:
      readedStories = parseJson(readedStoriesStr)
    callJs("loadData", lastPage, $readedStories, lastBranch)


nativeApp(
  "/assets",
  resizeable = false,
  title = "KTC",
  w = 360,
  h = 720,
  port = 5234,
  establish = true
)
