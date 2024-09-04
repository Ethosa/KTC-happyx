import
  happyx,
  std/times,
  std/math,
  std/json,
  ../types,
  ./colors


var
  hpxNative* {.importc, nodecl.}: JsObject
  studentTimetable* = remember StudentTimetable()
  teacherTimetable* = remember TeacherTimetable()
  currentAnnounce* = remember Announce()
  teachersList* = remember newSeq[TeachersList]()
  branches* = remember newSeq[Branch]()
  courses* = remember newSeq[seq[Course]]()
  news* = remember News()
  prefetchComplete* = false
  lastBranch* = remember 0
  useBlur* = remember false
  appTheme* = remember "dark"
  saveLoaded* = false


proc changeTheme*(val: string) =
  case val:
    of "dark":
      Bg.val = "#191718"
      BgMain.val = "#221F20"
      Primary.val = "#eed29e"
      Secondary.val = "#ba9c42"
      Fg.set("#fdfffd")
    of "dark-red":
      Bg.val = "#141d1f"
      BgMain.val = "#1c282b"
      Primary.val = "#f44336"
      Secondary.val = "#d32f2f"
      Fg.set("#f1dcc1")
    of "dark-purple":
      Bg.val = "#250c1d"
      BgMain.val = "#351c2d"
      Primary.val = "#e3c022"
      Secondary.val = "#ae9f93"
      Fg.set("#f8f9f9")
    of "pastel-blue":
      Bg.val = "#cef5fa"
      BgMain.val = "#aed5da"
      Primary.val = "#4ac7e9"
      Secondary.val = "#34a5d9"
      Fg.set("#575a8b")
    of "hacking":
      Bg.val = "#0a0801"
      BgMain.val = "#2a2821"
      Primary.val = "#9bd74d"
      Secondary.val = "#9bd74d"
      Fg.set("#aaf323")
    of "simple-green":
      Bg.val = "#ffffff"
      BgMain.val = "#cecece"
      Primary.val = "#3cd359"
      Secondary.val = "#007919"
      Fg.set("#0e0701")
    of "simple-blue":
      Bg.val = "#ffffff"
      BgMain.val = "#cecece"
      Primary.val = "#1867f9"
      Secondary.val = "#7372ff"
      Fg.set("#040000")


appTheme.watch(oldVal, newVal):
  if newVal == oldVal:
    return
  var val: cstring = cstring newVal
  hpxNative.callNim("saveAppTheme", val)
  changeTheme(newVal)


useBlur.watch(oldVal, newVal):
  hpxNative.callNim("saveUseBlur", newVal)


lastBranch.watch(oldVal, newVal):
  hpxNative.callNim("saveLastBranch", newVal)


proc updateStudentTimetable*(val: StudentTimetable) =
  studentTimetable.set(val)

proc updateTeacherTimetable*(val: TeacherTimetable) =
  teacherTimetable.set(val)

proc updateAnnounce*(val: Announce) =
  currentAnnounce.set(val)


proc updateNews*(val: News) {.exportc.} =
  news.set(val)

proc updateBranches*(val: seq[Branch]) {.exportc.} =
  var x = val
  for i in 0..<x.len:
    x[i].title = x[i].title
      .replace("Краевое государственное бюджетное профессиональное образовательное учреждение", "КГБПОУ")
      .replace("краевого государственного бюджетного профессионального образовательного учреждения", "КГБПОУ")
  branches.set(x)

proc updateCourses*(val: seq[seq[Course]]) {.exportc.} =
  courses.set(val)

proc updateTeachersList*(val: seq[TeachersList]) {.exportc.} =
  teachersList.set(val)


proc countStudentHours(lessons: seq[StudentLesson]): int =
  result = 0
  for i in lessons:
    let
      x = i.time[1].split(":")
      y = i.time[2].split(":")
      minutesX = parseInt(x[0]) * 60 + parseInt(x[1])
      minutesY = parseInt(y[0]) * 60 + parseInt(y[1])
    result += abs(minutesY - minutesX).int


proc studentHours*(lessons: seq[StudentLesson]): string =
  let diff = round(countStudentHours(lessons) / 60).int
  return case ($diff)[^1]:
    of '2'..'4':
      $diff & " часа"
    of '0', '5'..'9':
      $diff & " часов"
    else:
      $diff & " час"
