import
  happyx,
  std/strformat,
  ../ui/[colors, data],
  ./icons


proc SearchHolder*(placeholder: string = "Найти преподавателя"): TagRef =
  buildHtml:
    tDiv(
      class = "flex items-center justify-center fixed left-0 right-0 top-0 bottom-0 duration-300 transition-all " & (
        if showSearchForm and useBlur:
          fmt"bg-[#00000030] backdrop-blur-md"
        elif showSearchForm:
          fmt"bg-[#00000070]"
        else:
          "pointer-events-none"
      )
    ):
      tDiv(
        class = fmt"flex flex-col gap-6 items-center pt-4 {roundedSize} text-[{Fg}] duration-300 transition-all " & (
          if useBlur and showSearchForm:
            fmt"bg-[{Bg}A0] backdrop-blur-xl"
          elif showSearchForm:
            fmt"bg-[{Bg}]"
          else:
            "scale-0 opacity-0"
        )
      ):
        tSpan(class = "text-xl font-semibold"):
          "Поиск"
        tInput(
          class = fmt"{roundedSize} bg-[{BgMain}] mx-2 px-4 py-1 placeholder:text-[{Fg}] text-[{Fg}]",
          placeholder = placeholder,
          value = search.val
        ):
          @input:
            search.set($ev.target.InputElement.value)
        tDiv(class = "flex w-full"):
          tDiv(class = fmt"w-full font-bold px-4 py-2 {roundedBL} bg-[{BgMain}] text-[{Primary}] cursor-pointer select-none duration-300 transition-all"):
            "отмена"
            @click:
              search.val = ""
              showSearchForm.set(false)
          tDiv(class = fmt"w-full font-bold text-right px-4 py-2 {roundedBR} bg-[{Primary}] text-[{Bg}] cursor-pointer select-none duration-300 transition-all"):
            "поиск"
            @click:
              showSearchForm.set(false)


proc SearchForm*(): TagRef =
  buildHtml:
    tDiv(class = "cursor-pointer"):
      Search(fmt"w-8 h-8 stroke-[{Primary}]")
      @click:
        echo 1
        showSearchForm.set(true)
