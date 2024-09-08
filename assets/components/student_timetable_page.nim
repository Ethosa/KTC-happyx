import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations


proc getGroup*(branchId, groupId: int): CourseGroup =
  if courses.val.len == 0:
    {.emit: """//js
    fetchStudentTimetable(`groupId`, -1).then(res => {
      `updateStudentTimetable`(res);
    });
    """.}
    return CourseGroup()
  result = CourseGroup()
  var c = courses.val[branchId-1]
  for groups in c:
    for group in groups.groups:
      if group.id == groupId:
        return group


proc StudentsHeader*(branchId, groupId: int): TagRef =
  buildHtml:
    tDiv(class = "flex flex-col -mt-1 -mb-1"):
      tDiv(class = "font-bold text-xl"):
        { studentTimetable.val.weekNumber }
        " неделя"
      tDiv(class = "font-medium opacity-80 text-sm"):
        { getGroup(branchId, groupId).title }


proc StudentsTimetable*(groupId: int, week: int = -1): TagRef =
  buildHtml:
    tDiv(class = "-mt-10 flex flex-col justify-center gap-4 px-4 overflow-x-hidden duration-300 transition-all"):
      BranchAnimation
      ChooseRoleAnimation
      CoursesAnimation
      TeachersAnimation
      tDiv(class = fmt"flex flex-col gap-4 divide-y divide-[{Fg}50]"):
        if studentTimetable.val.days.len > 0:
          for i in studentTimetable.val.days:
            tDiv(class = "flex flex-col gap-2 py-4"):
              tDiv(class = "flex justify-between w-full"):
                tDiv(class = fmt"text-nowrap font-semibold text-lg text-[{Primary}]"):
                  { i.title }
                if i.lessons.len >= 1:
                  tDiv(class = "flex flex-col items-end text-nowrap"):
                    tDiv(class = "text-sm opacity-50"):
                      { i.lessons[0].time[1] }
                      " - "
                      { i.lessons[^1].time[2] }
                    tDiv(class = "text-sm opacity-50"):
                      "~ "
                      { studentHours(i.lessons) }
                else:
                  tDiv(class = "text-nowrap text-sm opacity-50"):
                    "нет пар"
              tDiv(class = fmt"flex flex-col gap-2 divide-y divide-[{Fg}20]"):
                for lesson in i.lessons:
                  tDiv(class = "flex gap-2"):
                    tDiv(class = "flex gap-2 items-center"):
                      tDiv(class = "text-base font-medium"):
                        { lesson.time[0] }
                      tDiv(class = fmt"flex flex-col gap-1 divide-y divide-[{Fg}50]"):
                        tDiv(class = "text-sm"):
                          { lesson.time[1] }
                        tDiv(class = "text-sm"):
                          { lesson.time[2] }
                    tDiv(class = "flex w-full items-center"):
                      tDiv(class = "flex flex-col w-5/6"):
                        tDiv(class = "font-semibold"):
                          { lesson.title }
                        tDiv(class = "text-sm opacity-65"):
                          { lesson.teacher }
                      tDiv(class = "flex h-full items-center justify-end h-full w-1/6 text-right"):
                        { lesson.classroom }
        else:
          tSection(class = "flex flex-col gap-4"):
            for i in 0..6:
              tDiv(class = "flex flex-col gap-2 py-4"):
                tDiv(class = "flex justify-between w-md"):
                  tDiv(class = fmt"text-nowrap font-semibold w-32 h-10 skeleton-screen-main {roundedSize}")
                  tDiv(class = "flex flex-col items-end text-nowrap"):
                    tDiv(class = fmt"text-sm opacity-50 w-12 h-6 skeleton-screen-main {roundedSize}")
                    tDiv(class = fmt"text-sm opacity-50 w-12 h-6 skeleton-screen-main {roundedSize}")
                tDiv(class = fmt"flex flex-col gap-2 divide-y divide-[{Fg}20]"):
                  for j in 0..4:
                    tDiv(class = "flex gap-2"):
                      tDiv(class = "flex gap-2 items-center"):
                        tDiv(class = fmt"w-6 h-8 skeleton-screen-main {roundedSize}")
                        tDiv(class = fmt"flex flex-col gap-1 divide-y divide-[{Fg}50]"):
                          tDiv(class = fmt"w-12 h-6 skeleton-screen-main {roundedT}")
                          tDiv(class = fmt"w-12 h-6 skeleton-screen-main {roundedB}")
                      tDiv(class = "flex w-full items-center"):
                        tDiv(class = "flex flex-col gap-1 w-5/6"):
                          tDiv(class = fmt"w-36 h-8 skeleton-screen-main {roundedSize}")
                          tDiv(class = fmt"w-24 h-6 skeleton-screen-main {roundedSize}")
                        tDiv(class = fmt"flex h-full items-center justify-end h-full w-1/6 h-6 skeleton-screen-main {roundedSize}")
