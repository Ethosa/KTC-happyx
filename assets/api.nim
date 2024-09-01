import
  happyx,
  std/jsffi,
  std/json,
  ./types


var
  API_URL* = "https://mob.kansk-tc.ru/"


proc fetchNews*(): Future[News] {.async, exportc.} =
  var data: cstring
  {.emit: """//js
  const response = await fetch(`API_URL` + '/ktc-api/news/');
  `data` = await response.text();
  """.}
  if data.len > 0:
    return parseJson($data).to(News)
  return News()
