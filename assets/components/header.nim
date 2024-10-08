import
  happyx,
  ../ui/[colors, data],
  ./icons


var
  backTo = ""


proc BackTo*(path: string): TagRef =
  backTo = path
  buildHtml:
    tDiv(class = "cursor-pointer select-none transition-all duration-300 " & (
      if path == "":
        "opacity-0 -translate-x-[2rem] max-w-0 w-0"
      else:
        "opacity-100 translate-x-0 max-w-[2rem] w-[2rem]"
    )):
      ArrowLeftAlt(fmt"stroke-[{Fg}]")
      @click:
        if backTo != "":
          showSearchForm.val = false
          search.val = ""
          route(backTo)


proc HeaderTitle*(title: string): TagRef =
  result = buildHtml:
    tDiv(class = fmt"font-bold text-3xl select-none text-nowrap"):
      { title }


proc Header*(stmt: TagRef): TagRef =
  buildHtml:
    tDiv(
      class = fmt"fixed top-0 left-0 right-0 flex gap-4 z-50 items-center px-4 py-2 text-[{Fg}] duration-300 transition-all " & (
        if useBlur:
          fmt"bg-[{Bg}75] backdrop-blur-md "
        else:
          fmt"bg-[{Bg}] "
      )
    ):
      stmt
