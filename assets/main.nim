import
  happyx,
  jsffi,
  ./types


# Object for working with HappyX Native
var hpxNative {.importc, nodecl.}: JsObject


appRoutes "app":
  "/":
    tDiv(class = "container"):
      tH1:
        "ktc-hpx-native"
      tDiv(class = "content"):
        "x is {x}"
        tButton:
          "increase"
          @click:
            # Call HappyX Native callback named helloWorld without arguments
            hpxNative.callNim("helloWorld")
            x->inc()
