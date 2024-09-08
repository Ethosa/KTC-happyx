import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations,
  ./icons


proc NewsPage*(): TagRef =
  buildHtml:
    tDiv(class = "-mt-10 flex flex-col justify-center gap-4 overflow-x-hidden duration-300 transition-all"):
      BranchAnimation
      ChooseRoleAnimation
      CoursesAnimation
      TeachersAnimation
      if news.val.announce.len == 0 and news.val.news.len == 0:
        tDiv(class = "flex flex-col gap-4 p-4 duration-300 transition-all"):
          for i in 0..5:
            tDiv(class = fmt"cursor-pointer flex flex-col gap-2 bg-[{Bg}] {roundedSize}"):
              tDiv(class = fmt"{roundedT} skeleton-screen-main w-full h-24")
              tDiv(class = "flex flex-col px-4"):
                tDiv(class = fmt"text-lg font-semibold text-[{Primary}] skeleton-screen-main {roundedSize} w-24 h-8")
                tDiv(class = fmt"text-sm opacity-65 skeleton-screen-main {roundedSize} w-16 h-8")
              tDiv(class = fmt"px-4 pb-4 w-full h-32 skeleton-screen-main {roundedSize}")
      else:
        tDiv(class = fmt"flex flex-col gap-4 p-4 duration-300 transition-all "):
          for i in news.val.announce:
            tDiv(class = fmt"cursor-pointer flex flex-col gap-2 bg-[{Bg}] {roundedSize}"):
              tImg(class = roundedT, src = i.image, loading = "lazy", decoding = "async")
              tDiv(class = "flex flex-col px-4"):
                tDiv(class = fmt"text-lg font-semibold text-[{Primary}]"):
                  { i.title }
                tDiv(class = "text-sm opacity-65"):
                  { i.date }
              tDiv(class = "px-4 pb-4"):
                { i.body }
          for i in news.val.news:
            tDiv(class = fmt"cursor-pointer flex flex-col gap-2 bg-[{Bg}] {roundedSize}"):
              tImg(class = roundedT, src = i.image, loading = "lazy", decoding = "async")
              tDiv(class = "flex flex-col px-4"):
                tDiv(class = fmt"text-lg font-semibold text-[{Primary}]"):
                  { i.title }
                tDiv(class = "text-sm opacity-65"):
                  { i.date }
              tDiv(class = "px-4 pb-4"):
                { i.body }
      AnnouncementAnimation
