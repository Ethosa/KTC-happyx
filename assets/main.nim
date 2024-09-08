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
    search_form,
    styles
  ]


proc loadData*(lastPage: cstring, branch: cint, useBlurVal: bool, appThemeVal, roundedSizeVal: cstring) {.exportc.} =
  lastBranch.val = branch.int
  useBlur.val = useBlurVal
  appTheme.val = $appThemeVal
  saveLoaded = true
  # Rounded
  roundedSize.val = $roundedSizeVal
  let newSize = ($roundedSizeVal).split("-")[^1]
  roundedL = "rounded-l-" & newSize
  roundedR = "rounded-r-" & newSize
  roundedB = "rounded-b-" & newSize
  roundedT = "rounded-t-" & newSize
  roundedTL = "rounded-tl-" & newSize
  roundedTR = "rounded-tr-" & newSize
  roundedBL = "rounded-bl-" & newSize
  roundedBR = "rounded-br-" & newSize
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
    Styles
  "/news/id{id:int}":
    PageContainer:
      Navigation()
      Header:
        BackTo("/")
        HeaderTitle("Главная")
      AnnouncementPage
    Styles
  "/timetable":
    PageContainer:
      Navigation()
      Header:
        BackTo("")
        HeaderTitle("Расписание")
      Branches(branches)
    Styles
  "/timetable/$branchId:int":
    PageContainer:
      Navigation()
      Header:
        BackTo("/timetable")
        HeaderTitle("Ваша роль")
      StudentOrTeacher(branchId)
    Styles
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
    Styles
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
    Styles
  "/timetable/$branchId:int/student/$groupId:int":
    PageContainer:
      Navigation()
      Header:
        BackTo("/timetable/" & $branchId & "/student")
        StudentsHeader(branchId, groupId)
        # HeaderTitle("Расписание")
      StudentsTimetable(groupId)
    Styles
  "/timetable/$branchId:int/teacher/$teacherId:int":
    PageContainer:
      Navigation()
      Header:
        BackTo("/timetable/" & $branchId & "/teacher")
        TeachersHeader(branchId, teacherId)
        # HeaderTitle("Расписание")
      TeachersTimetable(teacherId)
    Styles
  "/settings":
    PageContainer:
      Navigation()
      Header:
        BackTo("")
        HeaderTitle("Настройки")
      SettingsPage
    Styles
