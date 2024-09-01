

type
  Version* = object
    actual_version*: seq[int]  # @[major, minor, patch]
    description*: string
  
  Branch* = object
    id*: int
    title*: string
  
  CourseGroup* = object
    id*: int
    title*: string
  
  Course* = object
    course*: int
    groups*: seq[CourseGroup]
  
  Teacher* = object
    name*: string
    id*: string
  
  TeachersList* = object
    teachers*: seq[Teacher]
  
  TeacherLesson* = object
    number*: string
    classroom*: string
    group*: string
    title*: string
  
  TeacherDayTimetable* = object
    title*: string
    lessons*: seq[TeacherLesson]
  
  TeacherTimetable* = object
    teacher*: string
    title*: string
    week*: seq[TeacherDayTimetable]
  
  StudentLesson* = object
    time*: seq[string]
    title*: string
    teacher*: string
    classroom*: string
  
  StudentDayTimetable* = object
    title*: string
    lessons*: seq[StudentLesson]
  
  StudentTimetable* = object
    week_number*: string
    days*: seq[StudentDayTimetable]
  
  Announce* = object
    id*: int
    title*: string
    image*: string
    body*: string
    date*: string
    likes*: seq[string]
  
  News* = object
    announce*: seq[Announce]
    news*: seq[Announce]
