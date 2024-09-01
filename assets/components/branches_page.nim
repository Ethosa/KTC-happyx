import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations


proc Branches*(branches: State[seq[Branch]]): TagRef =
  buildHtml:
    tDiv(class = "fixed w-screen h-screen flex flex-col justify-center gap-4 px-4 duration-300 transition-all"):
      tDiv(class = "flex flex-col gap-4 transition-all duration-300"):
        for branch in branches:
          tDiv(
            class = fmt"px-4 py-2 font-semibold truncate select-none cursor-pointer bg-[{Primary}] hover:bg-[{Primary}CC] active:bg-[{Primary}AA] text-[{Bg}] rounded-lg transition-all duration-300"
          ):
            { branch.title }
            @click:
              route("/timetable/" & $branch.id)
      ChooseRoleAnimation
      TeachersAnimation
