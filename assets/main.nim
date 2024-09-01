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
    animations,
    courses_page,
    teachers_list_page,
    student_timetable_page,
    teacher_timetable_page,
    news_page
  ]


# Object for working with HappyX Native
var
  hpxNative {.importc, nodecl.}: JsObject


proc loadData*(lastPage, readedStrotiesStr: cstring, branch: cint) {.exportc.} =
  {.emit: """//js
  rt(`lastPage`);
  """.}
  readedStories = parseJson($readedStrotiesStr)
  lastBranch = branch.int


proc updateNews*(val: News) {.exportc.} =
  news.set(val)
proc updateBranches*(val: seq[Branch]) {.exportc.} =
  var x = val
  for i in 0..<x.len:
    x[i].title = x[i].title
      .replace("Краевое государственное бюджетное профессиональное образовательное учреждение", "КГБПОУ")
      .replace("краевого государственного бюджетного профессионального образовательного учреждения", "КГБПОУ")
  branches.set(x)
proc updateCourses*(val: seq[seq[Course]]) {.exportc.} =
  courses.set(val)
proc updateTeachersList*(val: seq[TeachersList]) {.exportc.} =
  teachersList.set(val)


{.emit: """//js
window.addEventListener('load', () => {
  fetchBranches().then(branches => {
    updateBranches(branches);
    fetchCourses(branches).then(x => updateCourses(x));
    fetchTeachersList(branches).then(x => updateTeachersList(x));
  });
  fetchNews().then(x => {
    updateNews(x);
    hpxNative.callNim("loadAppData");
  });
})
""".}


appRoutes "app":
  "/":
    PageContainer:
      Navigation()
      Header:
        BackTo("")
        HeaderTitle("Главная")
      NewsPage
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
      StudentOrTeacher(branchId)
  "/timetable/$branchId:int/student":
    PageContainer:
      Navigation()
      Header:
        BackTo("/timetable/" & $branchId)
        HeaderTitle("Ваш курс")
      Courses(courses.val[branchId-1], branchId)
  "/timetable/$branchId:int/teacher":
    PageContainer:
      Navigation()
      Header:
        BackTo("/timetable/" & $branchId)
        HeaderTitle("Ваше имя")
      Teachers(teachersList.val[branchId-1], branchId)
  "/timetable/$branchId:int/student/$groupId:int":
    PageContainer:
      Navigation()
      Header:
        BackTo("/timetable/" & $branchId & "/student")
        StudentsHeader(branchId, groupId)
        # HeaderTitle("Расписание")
      StudentsTimetable(groupId)
  "/timetable/$branchId:int/teacher/$teacherId:int":
    PageContainer:
      Navigation()
      Header:
        BackTo("/timetable/" & $branchId & "/teacher")
        TeachersHeader(branchId, teacherId)
        # HeaderTitle("Расписание")
      TeachersTimetable(teacherId)
  "/settings":
    PageContainer:
      Navigation()
      Header:
        BackTo("")
        HeaderTitle("Настройки")
      AnimationHolder
