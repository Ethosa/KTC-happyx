import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations


proc StudentsHeader*(): TagRef =
  buildHtml:
    tDiv(class = "font-bold text-3xl"):
      { studentTimetable.weekNumber }
      " неделя"


proc StudentsTimetable*(groupId: int, week: int = -1): TagRef =
  buildHtml:
    tDiv(class = "-mt-10 flex flex-col justify-center gap-4 px-4 overflow-x-hidden duration-300 transition-all overflow-y-hidden"):
      BranchAnimation
      ChooseRoleAnimation
      CoursesAnimation
      TeachersAnimation
      tDiv(class = fmt"flex flex-col gap-4 h-[calc(100vh-6.2rem)] divide-y divide-[{Fg}50] snap-y overflow-y-scroll"):
        for i in studentTimetable.days:
          tDiv(class = "snap-center flex flex-col gap-2 py-4"):
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
