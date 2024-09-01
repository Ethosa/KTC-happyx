import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations


proc getTeacherName*(branchId, teacherId: int): Teacher =
  result = Teacher()
  var c = teachersList.val[branchId-1]
  for teacher in c.teachers:
    if teacher.id == $teacherId:
      return teacher


proc TeachersHeader*(branchId, teacherId: int): TagRef =
  buildHtml:
    tDiv(class = "flex flex-col -mt-1 -mb-1"):
      tDiv(class = "font-bold"):
        nim:
          var x = getTeacherName(branchId, teacherId).name.strip().split(" ")
          for i in 1..<x.len:
            var str = cstring x[i]
            var cstr: cstring
            {.emit: """//js
            `cstr` = `str`[0];
            """.}
            x[i] = $cstr & "."
        { x.join(" ") }
      tDiv(class = "font-medium opacity-80 text-sm"):
        { teacherTimetable.title.replace("расписание на ", "") }


proc TeachersTimetable*(teacherId: int): TagRef =
  buildHtml:
    tDiv(class = "-mt-10 flex flex-col justify-center gap-4 px-4 overflow-x-hidden duration-300 transition-all"):
      BranchAnimation
      ChooseRoleAnimation
      CoursesAnimation
      TeachersAnimation
      tDiv(class = fmt"flex flex-col gap-4 divide-y divide-[{Fg}50]"):
        for i in teacherTimetable.week:
          if i.title != "":
            tDiv(class = "flex flex-col gap-2 py-4"):
              tDiv(class = "flex justify-between w-full"):
                tDiv(class = fmt"text-nowrap font-semibold text-lg text-[{Primary}]"):
                  { i.title }
              tDiv(class = fmt"flex flex-col gap-2 divide-y divide-[{Fg}20]"):
                for lesson in i.lessons:
                  tDiv(class = "flex gap-2"):
                    tDiv(class = "flex gap-2 items-center"):
                      tDiv(class = "text-base font-medium"):
                        { lesson.number }
                    tDiv(class = "flex w-full items-center"):
                      tDiv(class = "flex flex-col w-5/6"):
                        tDiv(class = "font-semibold"):
                          { lesson.title }
                        tDiv(class = "text-sm opacity-65"):
                          { lesson.group }
                      tDiv(class = "flex h-full items-center justify-end h-full w-1/6 text-right"):
                        { lesson.classroom }
