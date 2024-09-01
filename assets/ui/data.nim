import
  happyx,
  std/times,
  std/math,
  std/json,
  ../types


var
  stories* = remember newSeq[Announce]()
  studentTimetable*: StudentTimetable
  teacherTimetable*: TeacherTimetable
  readedStories*: JsonNode = newJArray()
  teachersList* = remember newSeq[TeachersList]()
  branches* = remember newSeq[Branch]()
  courses* = remember newSeq[seq[Course]]()
  news* = remember News()
  prefetchComplete* = false
  lastBranch*: int = 0


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
