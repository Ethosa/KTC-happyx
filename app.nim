# Main native file
import
  happyx_native,
  std/asyncdispatch,
  std/httpclient,
  ./assets/types


const
  API_URL* = "https://mob.kansk-tc.ru/"


var
  lastPage = "/"
  readedStories: JsonNode = newJArray()
  lastBranch = 0
  teachersList: seq[TeachersList] = @[]
  branches: seq[Branch] = @[]
  courses: seq[seq[Course]] = @[]
  news: News = News()
  prefetchComplete = false


proc prefetch() {.async.} =
  var
    client = newAsyncHttpClient()
    response = await client.get(API_URL & "ktc-api/branches")
    body = await response.bodyStream.readAll()
  if body.len > 0:
    branches = parseJson(body).to(seq[Branch])
  
  for branch in branches:
    response = await client.get(API_URL & "ktc-api/courses/" & $branch.id)
    body = await response.bodyStream.readAll()
    if body.len > 0:
      courses.add parseJson(body).to(seq[Course])
    response = await client.get(API_URL & "ktc-api/teachers-list/" & $branch.id)
    body = await response.bodyStream.readAll()
    if body.len > 0:
      teachersList.add parseJson(body).to(TeachersList)
  
  prefetchComplete = true
  client.close()


asyncCheck prefetch()


callback:
  # HappyX Native helloWorld callback
  proc loadAppData() =
    lastPage = loadString("hapticx.ktc_hpx.lastPage")
    lastBranch = loadInt("hapticx.ktc_hpx.lastBranch")
    let readedStoriesStr = loadString("hapticx.ktc_hpx.readedStories")
    if readedStoriesStr.len > 0:
      readedStories = parseJson(readedStoriesStr)
    callJs("loadData", lastPage, $readedStories, lastBranch)
  
  proc isPrefetchComplete() =
    callJs("isPrefetchComplete", prefetchComplete)
  
  proc loadPrefetchData() =
    callJs("loadPrefetchData", $(%branches), $(%courses), $(%teachersList))


nativeApp(
  "/assets",
  resizeable = false,
  title = "KTC",
  w = 360,
  h = 720,
  port = 5234,
  establish = true
)
