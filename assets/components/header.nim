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
          echo "go to ", backTo
          route(backTo)


proc HeaderTitle*(title: string): TagRef =
  result = buildHtml:
    tDiv(class = fmt"font-bold text-3xl select-none"):
      { title }


proc Header*(stmt: TagRef): TagRef =
  buildHtml:
    tDiv(class = fmt"flex gap-4 items-center w-full h-full px-4 py-2 bg-[{Bg}] text-[{Fg}] drop-shadow-xl"):
      stmt
