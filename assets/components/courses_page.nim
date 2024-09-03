import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations


proc Group*(courseGroup: CourseGroup, branchId: int): TagRef =
  buildHtml:
    tDiv(class = fmt"font-semibold select-none cursor-ponter w-fit px-2 py-2 rounded-md bg-[{Primary}] hover:bg-[{Primary}CC] active:bg-[{Primary}AA] text-[{Bg}] transition-all duration-300"):
      { courseGroup.title }
      @click:
        {.emit: """//js
        fetchStudentTimetable(`courseGroup`.id, -1).then(res => {
          `updateStudentTimetable`(res);
        });
        """.}
        route("/timetable/" & $branchId & "/student/" & $courseGroup.id)


proc Courses*(courses: seq[Course], branchId: int): TagRef =
  buildHtml:
    tDiv(class = "flex flex-col justify-center gap-4 px-4 overflow-x-hidden duration-300 transition-all"):
      BranchAnimation
      ChooseRoleAnimation
      tDiv(class = "flex flex-col gap-4 transition-all duration-300"):
        for i in 0..<courses.len:
          tDiv(class = fmt"flex flex-col gap-2 transition-all duration-[{(i+1) * 150}ms]"):
            tDiv(class = "text-xl font-semibold"):
              "Курс: "
              { courses[i].course }
            tDiv(class = "flex flex-wrap gap-2"):
              for group in courses[i].groups:
                Group(group, branchId)
      TeachersAnimation
      TimetableAnimation
      AnnouncementAnimation
