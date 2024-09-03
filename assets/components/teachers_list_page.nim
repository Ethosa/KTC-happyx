import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations


proc Teachers*(teachers: TeachersList, branchId: int): TagRef =
  buildHtml:
    tDiv(class = fmt"flex flex-col justify-center gap-4 px-4 pb-8 overflow-x-hidden duration-300 transition-all"):
      BranchAnimation
      ChooseRoleAnimation
      CoursesAnimation
      tDiv(class = "flex flex-col gap-4 transition-all duration-300"):
        for i in 0..<teachers.teachers.len:
          tDiv(class = fmt"flex flex-col items-center justify-center gap-2 transition-all duration-[{(i+1) * 100}ms]"):
            tDiv(class = fmt"font-semibold select-none cursor-ponter w-fit px-2 py-2 rounded-md bg-[{Primary}] hover:bg-[{Primary}CC] active:bg-[{Primary}AA] text-[{Bg}] transition-all duration-300"):
              { teachers.teachers[i].name }
              @click:
                let id: cstring = teachers.teachers[i].id
                let b: cint = branchId
                {.emit: """//js
                fetchTeacherTimetable(`b`, `id`).then(res => {
                  `updateTeacherTimetable`(res);
                });
                """.}
                route("/timetable/" & $branchId & "/teacher/" & $teachers.teachers[i].id)
      TimetableAnimation
      AnnouncementAnimation
