import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations


proc StudentOrTeacher*(branchId: int): TagRef =
  buildHtml:
    tDiv(class = "fixed w-screen top-12 bottom-12 flex flex-col justify-center items-center gap-4 px-4 duration-300 transition-all"):
      BranchAnimation
      tDiv(class = "flex flex-col gap-4 items-center justify-center duration-300 transition-all"):
        tDiv(
          class = fmt"w-fit px-4 py-2 font-semibold select-none cursor-pointer bg-[{Primary}] hover:bg-[{Primary}CC] active:bg-[{Primary}AA] text-[{Bg}] rounded-lg transition-all duration-300"
        ):
          "Я студент"
          @click:
            route("/timetable/" & $branchId & "/student")
        tDiv(
          class = fmt"w-fit px-4 py-2 font-semibold select-none cursor-pointer bg-[{Primary}] hover:bg-[{Primary}CC] active:bg-[{Primary}AA] text-[{Bg}] rounded-lg transition-all duration-300"
        ):
          "Я преподаватель"
          @click:
            route("/timetable/" & $branchId & "/teacher")
      CoursesAnimation
      TeachersAnimation
      TimetableAnimation
      AnnouncementAnimation
