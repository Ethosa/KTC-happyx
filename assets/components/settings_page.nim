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
  ("pastel-blue", "Синяя пастель"),
  ("hacking", "Хакер"),
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
          class = fmt"flex w-full rounded-md bg-[{Primary}] text-[{Bg}] duration-300 transition-all "
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
                
