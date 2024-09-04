# Main native file
import
  happyx_native,
  ./assets/types


var
  lastPage = "/"
  useBlur: bool = false
  lastBranch = 0
  appTheme = "dark"


when defined(export2android):
  jclass com.hapticx.ktc.hpx.MainActivity of Activity:
    proc setAppColor*(color: jint)
    proc setAppColor*(color: jint, isLight: jboolean)


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
    {.gcsafe.}:
      when defined(export2android):
        runOnUiThread:
          case appTheme:
            of "dark":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#191718"), JVM_FALSE)
            of "dark-red":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#141d1f"), JVM_FALSE)
            of "pastel-blue":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#cef5fa"), JVM_TRUE)
            of "hacking":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#0a0801"), JVM_FALSE)
            of "dark-purple":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#250c1d"), JVM_FALSE)
            of "simple-blue", "simple-green":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#ffffff"), JVM_TRUE)
  
  proc saveLastPage(val: string) =
    save("hapticx.ktc_hpx.lastPage", val)
  
  proc saveLastBranch(val: int) =
    save("hapticx.ktc_hpx.lastBranch", val)
  
  proc saveUseBlur(val: bool) =
    save("hapticx.ktc_hpx.useBlur", val)
  
  proc saveAppTheme(val: string) =
    appTheme = val
    save("hapticx.ktc_hpx.appTheme", val)
    {.gcsafe.}:
      when defined(export2android):
        runOnUiThread:
          case appTheme:
            of "dark":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#191718"), JVM_FALSE)
            of "dark-red":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#141d1f"), JVM_FALSE)
            of "pastel-blue":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#cef5fa"), JVM_TRUE)
            of "hacking":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#0a0801"), JVM_FALSE)
            of "dark-purple":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#250c1d"), JVM_FALSE)
            of "simple-blue", "simple-green":
              cast[MainActivity](appContext).setAppColor(AndroidColor.parseColor("#ffffff"), JVM_TRUE)


nativeApp(
  "/assets",
  resizeable = false,
  title = "KTC",
  w = 360,
  h = 720,
  port = 5234
)
