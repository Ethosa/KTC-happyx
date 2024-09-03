import
  happyx,
  ../[api, types],
  ../ui/[colors, data],
  ./animations


proc AnnouncementPage*(): TagRef =
  buildHtml:
    tDiv(class = "flex flex-col justify-center gap-4 px-4 overflow-x-hidden duration-300 transition-all"):
      BranchAnimation
      ChooseRoleAnimation
      CoursesAnimation
      TeachersAnimation
      TimetableAnimation
      tDiv(class = "flex flex-col gap-4 transition-all duration-300"):
        if currentAnnounce.val.image != "":
          tImg(
            class = "w-full object-cover object-center h-48",
            src = currentAnnounce.val.image,
            loading = "lazy",
            decoding = "async"
          )
        tDiv(class = "flex flex-col px-4"):
          tDiv(class = fmt"text-2xl font-semibold text-[{Primary}]"):
            { currentAnnounce.val.title }
          tDiv(class = "text-sm opacity-65"):
            { currentAnnounce.val.date }
        tDiv(class = "px-4 pb-4"):
          { currentAnnounce.val.body }
