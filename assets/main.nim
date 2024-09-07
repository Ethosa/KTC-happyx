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
    news_page,
    announcement_page,
    settings_page,
    search_form
  ]


proc loadData*(lastPage: cstring, branch: cint, useBlurVal: bool, appThemeVal: cstring) {.exportc.} =
  lastBranch.val = branch.int
  useBlur.val = useBlurVal
  appTheme.val = $appThemeVal
  saveLoaded = true
  {.emit: """//js
  rt(`lastPage`);
  """.}
  changeTheme($appThemeVal)


{.emit: """//js
window.addEventListener('load', () => {
  hpxNative.callNim("loadAppData");
  fetchBranches().then(branches => {
    updateBranches(branches);
    fetchCourses(branches).then(x => updateCourses(x));
    fetchTeachersList(branches).then(x => updateTeachersList(x));
  });
  fetchNews().then(x => {
    updateNews(x);
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
  "/news/id{id:int}":
    PageContainer:
      Navigation()
      Header:
        BackTo("/")
        HeaderTitle("Главная")
      AnnouncementPage
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
        tDiv(class = "w-full h-full flex justify-end items-center"):
          SearchForm
      Courses(branchId)
      SearchHolder("Найти группу")
  "/timetable/$branchId:int/teacher":
    PageContainer:
      Navigation()
      Header:
        BackTo("/timetable/" & $branchId)
        HeaderTitle("Ваше имя")
        tDiv(class = "w-full h-full flex justify-end items-center"):
          SearchForm
      Teachers(branchId)
      SearchHolder("Найти преподавателя")
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
      SettingsPage
