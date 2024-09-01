import
  happyx,
  std/jsffi,
  std/json,
  ./types,
  ./api,
  ./ui/[
    colors,
    data
  ],
  ./components/[
    header,
    navigation,
    page_container,
    branches_page,
    student_or_teacher_page,
    animations
  ]


# Object for working with HappyX Native
var
  hpxNative {.importc, nodecl.}: JsObject
  readedStories: JsonNode = newJArray()
  teachersList = remember newSeq[TeachersList]()
  branches = remember newSeq[Branch]()
  courses = remember newSeq[seq[Course]]()
  news = remember News()
  prefetchComplete = false
  lastBranch: int = 0


proc loadData*(lastPage, readedStrotiesStr: cstring, branch: cint) {.exportc.} =
  {.emit: """//js
  window.addEventListener('load', rt(`lastPage`));
  """.}
  readedStories = parseJson($readedStrotiesStr)
  lastBranch = branch.int


proc isPrefetchComplete*(completed: bool) {.exportc.} =
  {.emit: """//js
  if (`completed`) {
    clearTimeout(_t);
    hpxNative.callNim('loadPrefetchData');
  }
  """.}


proc loadPrefetchData*(branchesStr, coursesStr, teachersListStr: cstring) {.exportc.} =
  branches.set(parseJson($branchesStr).to(seq[Branch]))
  courses.set(parseJson($coursesStr).to(seq[seq[Course]]))
  teachersList.set(parseJson($teachersListStr).to(seq[TeachersList]))


{.emit: """//js
hpxNative.callNim("loadAppData")
const _t = setInterval(() => hpxNative.callNim("isPrefetchComplete"), 100)
fetchNews().then(news => {
  `news`.set(news);
})
""".}


appRoutes "app":
  "/":
    PageContainer:
      Navigation()
      Header:
        BackTo("")
        HeaderTitle("Главная")
      AnimationHolder
  "/timetable":
    PageContainer:
      Navigation()
      Header:
        BackTo("")
        HeaderTitle("Расписание")
      Branches(branches)
  "/timetable/$branchId:int":
    PageContainer:
      Navigation()
      Header:
        BackTo("/timetable")
        HeaderTitle("Ваша роль")
      StudentOrTeacehr(branchId)
  "/timetable/$branchId:int/student":
    PageContainer:
      Navigation()
      Header:
        BackTo("/timetable/" & $branchId)
        HeaderTitle("Ваш курс")
      AnimationHolder
  "/timetable/$branchId:int/teacher":
    PageContainer:
      Navigation()
      Header:
        BackTo("/timetable/" & $branchId)
        HeaderTitle("Ваше имя")
      AnimationHolder
  "/settings":
    PageContainer:
      Navigation()
      Header:
        BackTo("")
        HeaderTitle("Настройки")
      AnimationHolder
