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


proc AnimationHolder*(): TagRef =
  buildHtml:
    tDiv(class = ""):
      BranchAnimation
      ChooseRoleAnimation
