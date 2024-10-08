import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations


proc Teachers*(branchId: int): TagRef =
  buildHtml:
    tDiv(class = fmt"flex flex-col justify-center gap-4 px-4 pb-8 overflow-x-hidden duration-300 transition-all"):
      BranchAnimation
      ChooseRoleAnimation
      CoursesAnimation
      tDiv(class = "flex flex-col gap-4 transition-all duration-300"):
        if teachersList.val.len > 0:
          for i in 0..<teachersList.val[branchId-1].teachers.len:
            if (search.val == "") or (search.val != "" and search.val in teachersList.val[branchId-1].teachers[i].name.toLower()):
              tDiv(class = fmt"flex flex-col items-center justify-center gap-2 transition-all duration-[{(i+1) * 100}ms]"):
                tDiv(class = fmt"font-semibold select-none cursor-ponter w-fit px-2 py-2 {roundedSize} bg-[{Primary}] hover:bg-[{Primary}CC] active:bg-[{Primary}AA] text-[{Bg}] transition-all duration-300"):
                  { teachersList.val[branchId-1].teachers[i].name }
                  @click:
                    let id: cstring = teachersList.val[branchId-1].teachers[i].id
                    let b: cint = branchId
                    {.emit: """//js
                    fetchTeacherTimetable(`b`, `id`).then(res => {
                      `updateTeacherTimetable`(res);
                    });
                    """.}
                    route("/timetable/" & $branchId & "/teacher/" & $teachersList.val[branchId-1].teachers[i].id)
        else:
          tSection(class = "flex flex-col gap-4"):
            for i in 0..10:
              tDiv(class = fmt"flex flex-col items-center justify-center gap-2 transition-all duration-[{(i+1) * 100}ms]"):
                tDiv(class = fmt"font-semibold select-none cursor-ponter w-full h-10 w-fit px-2 py-2 {roundedSize} skeleton-screen-primary transition-all duration-300")
      TimetableAnimation
      AnnouncementAnimation
