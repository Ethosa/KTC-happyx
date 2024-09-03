import
  happyx,
  ../[api, types],
  ../ui/[colors, data]


proc BranchAnimation*(): TagRef = buildHtml:
  # Animation for branches
  tDiv(class = "flex flex-col items-center justify-center -translate-y-[2rem] opacity-0 duration-300 transition-all")


proc ChooseRoleAnimation*(): TagRef = buildHtml:
  # Animation for roles
  tDiv(class = "flex flex-col items-center justify-center translate-y-[2rem] opacity-0 duration-300 transition-all")


proc CoursesAnimation*(): TagRef = buildHtml:
  # Animation for roles
  tDiv(class = "flex flex-col items-center justify-center translate-y-[2rem] opacity-0 duration-300 transition-all"):
    for i in 0..<5:
      tDiv(class = fmt"flex flex-col gap-2 translate-y-[4rem] opacity-0 duration-[{(i+1)*150}ms] transition-all")


proc TeachersAnimation*(): TagRef = buildHtml:
  # Animation for roles
  tDiv(class = "flex flex-col items-center justify-center translate-y-[2rem] opacity-0 duration-300 transition-all"):
    for i in 0..<15:
      tDiv(class = fmt"flex flex-col gap-2 translate-y-[4rem] opacity-0 duration-[{(i+1)*100}ms] transition-all")


proc TimetableAnimation*(): TagRef = buildHtml:
  # Animation for roles
  tDiv(class = "flex flex-col items-center justify-center translate-y-[2rem] opacity-0 duration-300 transition-all"):
    for i in 0..<7:
      tDiv(class = fmt"flex flex-col gap-2 translate-y-[4rem] opacity-0 duration-[{(i+1)*100}ms] transition-all")


proc AnnouncementAnimation*(): TagRef = buildHtml:
  # Animation for roles
  tDiv(class = "flex flex-col items-center justify-center translate-y-[10rem] scale-60 opacity-0 duration-300 transition-all"):
    discard


proc AnimationHolder*(): TagRef =
  buildHtml:
    tDiv(class = ""):
      BranchAnimation
      ChooseRoleAnimation
      CoursesAnimation
      TeachersAnimation
      TimetableAnimation
      AnnouncementAnimation
