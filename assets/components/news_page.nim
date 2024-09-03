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
        tDiv(class = "flex flex-col gap-4 p-4 duration-300 transition-all h-[4rem] justify-center items-center w-full h-full"):
          Loading(fmt"animate-spin fill-[{Primary}]")
      else:
        tDiv(class = fmt"flex flex-col gap-4 p-4 duration-300 transition-all "):
          for i in news.val.announce:
            tDiv(class = fmt"cursor-pointer flex flex-col gap-2 bg-[{Bg}] rounded-md"):
              tImg(class = "rounded-t-md", src = i.image, loading = "lazy", decoding = "async")
              tDiv(class = "flex flex-col px-4"):
                tDiv(class = fmt"text-lg font-semibold text-[{Primary}]"):
                  { i.title }
                tDiv(class = "text-sm opacity-65"):
                  { i.date }
              tDiv(class = "px-4 pb-4"):
                { i.body }
              # @click:
              #   {.emit: """//js
              #   fetchNewsById(`i`.id).then(res => {
              #     `updateAnnounce`(res);
              #   });
              #   """.}
              #   route("/news/id" & $i.id)
          for i in news.val.news:
            tDiv(class = fmt"cursor-pointer flex flex-col gap-2 bg-[{Bg}] rounded-md"):
              tImg(class = "rounded-t-md", src = i.image, loading = "lazy", decoding = "async")
              tDiv(class = "flex flex-col px-4"):
                tDiv(class = fmt"text-lg font-semibold text-[{Primary}]"):
                  { i.title }
                tDiv(class = "text-sm opacity-65"):
                  { i.date }
              tDiv(class = "px-4 pb-4"):
                { i.body }
              # @click:
              #   {.emit: """//js
              #   fetchNewsById(`i`.id).then(res => {
              #     `updateAnnounce`(res);
              #   });
              #   """.}
              #   route("/news/id" & $i.id)
      AnnouncementAnimation
