import
  happyx,
  std/strformat,
  ../ui/[colors, data]


proc PageContainer*(stmt: TagRef): TagRef =
  buildHtml:
    tDiv(class = fmt"pb-12 pt-6 w-screen min-h-screen overflow-x-hidden overflow-y-auto h-full bg-[{BgMain}] text-[{Fg}]"):
      stmt
    tStyle: {fmt"""
    ::-webkit-scrollbar {{
      display:none;
      width: 6px;
      position: fixed;
    }}
    ::-webkit-scrollbar-track {{
      background: transparent;
      display: none;
    }}
    ::-webkit-scrollbar-thumb {{
      background-color: {Primary};
      border-radius: 20px;
      border: 3px solid {Primary}90;
    }}
    """}
