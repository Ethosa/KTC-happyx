import
  happyx,
  std/strformat,
  ../ui/[colors, data]


proc PageContainer*(stmt: TagRef): TagRef =
  buildHtml:
    tDiv(class = fmt"w-screen min-h-screen overflow-x-hidden overflow-y-auto h-full bg-[{BgMain}] text-[{Fg}]"):
      stmt
