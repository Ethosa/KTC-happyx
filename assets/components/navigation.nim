# Import HappyX
import 
  happyx,
  std/strutils,
  ../ui/[colors, data],
  ./icons


var
  current = remember "main"


proc NavigationItem*(route, title: string, icon: proc(clr: string): TagRef, canStartsWith: bool = false): TagRef =
  buildHtml:
    tDiv(
      class = "flex flex-col items-center relative select-none cursor-pointer"
    ):
      tDiv(
        class = "flex flex-col gap-1 items-center px-2 -mt-10 absolute w-fit h-[100px] z-40 rounded-t-full transition-all duration-300 " & (
          if canStartsWith and ($currentRoute).startsWith(route):
            fmt"drop-shadow-xl bg-[{Bg}] py-2"
          elif currentRoute == route:
            fmt"drop-shadow-xl bg-[{Bg}] py-2"
          else:
            "py-0 translate-y-[40px]"
        )
      ):
        icon(
          if canStartsWith and ($currentRoute).startsWith(route):
            fmt"stroke-[{Primary}]"
          elif currentRoute == route:
            fmt"stroke-[{Primary}]"
          else:
            fmt"stroke-[{Fg}]"
        )
        tSpan(class = fmt"transition-all duration-300 text-lg text-[{Primary}] " & (
          if canStartsWith and ($currentRoute).startsWith(route):
            ""
          elif currentRoute == route:
            ""
          else:
            "scale-y-0 opacity-0"
        )):
          { title }
      icon(fmt"opacity-0 stroke-[{Fg}]")
      @click:
        route(route)


proc Navigation*(): TagRef =
  buildHtml:
    tDiv(
      class = fmt"fixed py-2 bottom-0 left-0 z-50 right-0 flex justify-evenly rounded-t-2xl drop-shadow-xl bg-[{Bg}]"
    ):
      NavigationItem("/", "Главная", Home)
      NavigationItem("/timetable", "Расписание", Case, true)
      NavigationItem("/settings", "Настройки", Settings)
