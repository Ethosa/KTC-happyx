import
  happyx,
  std/jsffi,
  std/json,
  ./types


var
  API_URL*: cstring = "https://mob.kansk-tc.ru"


proc fetchNews*(): Future[News] {.async, exportc.} =
  var data: cstring
  {.emit: """//js
  const response = await fetch(`API_URL` + '/ktc-api/news/');
  `data` = await response.text();
  """.}
  if data.len > 0:
    return parseJson($data).to(News)
  return News()


proc fetchBranches*(): Future[seq[Branch]] {.async, exportc.} =
  var data: cstring
  {.emit: """//js
  const response = await fetch(`API_URL` + '/ktc-api/branches/');
  `data` = await response.text();
  """.}
  if data.len > 0:
    return parseJson($data).to(seq[Branch])
  return newSeq[Branch]()


proc fetchCourses*(branches: seq[Branch]): Future[seq[seq[Course]]] {.async, exportc.} =
  var res: seq[seq[Course]] = @[]
  for i in branches:
    var data: cstring
    {.emit: """//js
    const response = await fetch(`API_URL` + '/ktc-api/courses/' + `i`.id);
    `data` = await response.text();
    """.}
    if data.len > 0:
      res.add parseJson($data).to(seq[Course])
  return res


proc fetchTeachersList*(branches: seq[Branch]): Future[seq[TeachersList]] {.async, exportc.} =
  var res: seq[TeachersList] = @[]
  for i in branches:
    var data: cstring
    {.emit: """//js
    const response = await fetch(`API_URL` + '/ktc-api/teachers-list/' + `i`.id);
    `data` = await response.text();
    """.}
    if data.len > 0:
      res.add parseJson($data).to(TeachersList)
  return res
