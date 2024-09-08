import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations


proc Group*(courseGroup: CourseGroup, branchId: int): TagRef =
  buildHtml:
    tDiv(class = fmt"font-semibold select-none cursor-ponter w-fit px-2 py-2 {roundedSize} bg-[{Primary}] hover:bg-[{Primary}CC] active:bg-[{Primary}AA] text-[{Bg}] transition-all duration-300"):
      { courseGroup.title }
      @click:
        {.emit: """//js
        fetchStudentTimetable(`courseGroup`.id, -1).then(res => {
          `updateStudentTimetable`(res);
        });
        """.}
        route("/timetable/" & $branchId & "/student/" & $courseGroup.id)


proc Courses*(branchId: int): TagRef =
  buildHtml:
    tDiv(class = "flex flex-col justify-center gap-4 px-4 overflow-x-hidden duration-300 transition-all"):
      BranchAnimation
      ChooseRoleAnimation
      tDiv(class = "flex flex-col gap-4 transition-all duration-300"):
        if courses.val.len > 0:
          for i in 0..<courses.val[branchId-1].len:
            tDiv(class = fmt"flex flex-col gap-2 transition-all duration-[{(i+1) * 150}ms]"):
              tDiv(class = "text-xl font-semibold"):
                "Курс: "
                { courses.val[branchId-1][i].course }
              tDiv(class = "flex flex-wrap gap-2"):
                for group in courses.val[branchId-1][i].groups:
                  if search.val != "" and search.val in group.title.toLower():
                    Group(group, branchId)
                  elif search.val == "":
                    Group(group, branchId)
        else:
          tSection(class = "flex flex-col gap-4"):
            for i in 0..4:
              tDiv(class = fmt"flex flex-col gap-2 transition-all duration-[{(i+1) * 150}ms]"):
                tDiv(class = "text-xl font-semibold"):
                  "Курс: "
                  { i+1 }
                tDiv(class = "flex flex-wrap gap-2"):
                  for j in 0..12:
                    tDiv(class = fmt"font-semibold select-none cursor-ponter w-24 h-10 px-2 py-2 {roundedSize} skeleton-screen-primary transition-all duration-300")
      TeachersAnimation
      TimetableAnimation
      AnnouncementAnimation
