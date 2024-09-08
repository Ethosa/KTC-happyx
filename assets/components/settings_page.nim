import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations,
  ./icons,
  ./checkbox


var themes = @[
  ("dark", "Темная"),
  ("dark-red", "Темно-красная"),
  ("dark-purple", "Темно-бардовая"),
  ("pastel-blue", "Синяя пастель"),
  ("hacking", "Хакер"),
  ("simple-green", "Простая зеленая"),
  ("simple-blue", "Простая синяя"),
]


proc SettingsPage*(): TagRef =
  buildHtml:
    tDiv(class = "-mt-16 flex flex-col justify-center gap-4 overflow-x-hidden duration-300 transition-all"):
      BranchAnimation
      ChooseRoleAnimation
      CoursesAnimation
      TimetableAnimation
      AnnouncementAnimation
      tDiv(class = fmt"flex flex-col gap-4 p-4 duration-300 transition-all "):
        tSpan
        CheckBox(useBlur):
          "Использовать блюр"
        tDiv(class = "text-xl font-semibold"):
          "Тема:"
        tSelect(
          class = fmt"flex w-full px-4 py-2 {roundedSize} bg-[{Primary}] text-[{Bg}] duration-300 transition-all "
        ):
          for i in themes:
            if appTheme.val == i[0]:
              tOption(
                selected = "true",
                value = i[0]
              ):
                { i[1] }
            else:
              tOption(
                value = i[0]
              ):
                { i[1] }
          @change:
            var val: cstring
            {.emit: """//js
            `val` = `ev`.target.value;
            """.}
            appTheme.set($val)
        tDiv(class = "text-xl font-semibold"):
          "Закругленность:"
        tDiv(class = "flex flex-col gap-4 items-center"):
          tDiv(class = fmt"w-16 h-16 bg-[{Primary}] duration-300 transition-all {roundedSize}")
          tDiv(class = "flex"):
            tDiv(class = fmt"cursor-pointer select-none font-semibold px-6 py-2 {roundedL} duration-300 transition-all bg-[{Primary}] text-[{Bg}]"):
              "md"
              @click:
                roundedSize.set("rounded-md")
            tDiv(class = fmt"cursor-pointer select-none font-semibold px-6 py-2 duration-300 border-l border-r border-[{Bg}] transition-all bg-[{Primary}] text-[{Bg}]"):
              "lg"
              @click:
                roundedSize.set("rounded-lg")
            tDiv(class = fmt"cursor-pointer select-none font-semibold px-6 py-2 duration-300 border-l border-r border-[{Bg}] transition-all bg-[{Primary}] text-[{Bg}]"):
              "xl"
              @click:
                roundedSize.set("rounded-xl")
            tDiv(class = fmt"cursor-pointer select-none font-semibold px-6 py-2 {roundedR} duration-300 transition-all bg-[{Primary}] text-[{Bg}]"):
              "2xl"
              @click:
                roundedSize.set("rounded-2xl")
