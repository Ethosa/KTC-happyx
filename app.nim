# Main native file
import
  happyx_native,
  ./assets/types


var
  lastPage = "/"
  useBlur: bool = false
  lastBranch = 0
  appTheme = "dark"


callback:
  # HappyX Native helloWorld callback
  proc loadAppData() =
    lastPage = loadString("hapticx.ktc_hpx.lastPage")
    lastBranch = loadInt("hapticx.ktc_hpx.lastBranch")
    useBlur = loadBool("hapticx.ktc_hpx.useBlur")
    appTheme = loadString("hapticx.ktc_hpx.appTheme")
    if appTheme == "":
      appTheme = "dark"
    callJs("loadData", lastPage, lastBranch, useBlur, appTheme)
  
  proc saveLastPage(val: string) =
    save("hapticx.ktc_hpx.lastPage", val)
  
  proc saveLastBranch(val: int) =
    save("hapticx.ktc_hpx.lastBranch", val)
  
  proc saveUseBlur(val: bool) =
    save("hapticx.ktc_hpx.useBlur", val)
  
  proc saveAppTheme(val: string) =
    save("hapticx.ktc_hpx.appTheme", val)


nativeApp(
  "/assets",
  resizeable = false,
  title = "KTC",
  w = 360,
  h = 720,
  port = 5234,
  establish = true
)
