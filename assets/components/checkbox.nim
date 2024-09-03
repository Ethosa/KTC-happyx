import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./icons


proc CheckBox*(val: State[bool], stmt: TagRef): TagRef =
  buildHtml:
    tDiv(class = "flex gap-4 text-lg font-semibold items-center cursor-pointer "):
      tDiv(class = "w-6 h-6 flex items-center justify-center duration-300 transition-all rounded-md " & (
        if val:
          fmt"bg-[{Primary}] ring ring-[{Primary}]"
        else:
          fmt"bg-[{Bg}] ring ring-[{Primary}]"
      )):
        CheckAlt(" " & (
          if val:
            fmt"stroke-[{Bg}]"
          else:
            fmt"stroke-[{Primary}]"
        ))
      stmt
      @click:
        val.set(not val.val)
