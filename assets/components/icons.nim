import
  happyx,
  std/strformat


proc SvgIcon*(class: string, stmt: TagRef): TagRef = buildHtml:
  tSvg(
    viewBox = "0 0 32 32",
    width = "32",
    height = "32",
    fill = "none",
    xmlns = "http://www.w3.org/2000/svg",
    class = fmt"transition-all duration-300 {class}"
  ):
    stmt


proc Archive*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", d = "M12 17.3333H20")
    tPath("stroke-width" = "2.66667", "stroke-linejoin" = "round", d = "M4 8.66665C4 8.0471 4 7.73734 4.05124 7.47974C4.26165 6.4219 5.08859 5.59497 6.14643 5.38455C6.40403 5.33331 6.71379 5.33331 7.33333 5.33331H16H24.6667C25.2863 5.33331 25.596 5.33331 25.8536 5.38455C26.9115 5.59497 27.7384 6.4219 27.9488 7.47974C28 7.73734 28 8.0471 28 8.66665C28 9.28619 28 9.59595 27.9488 9.85355C27.7384 10.9114 26.9115 11.7383 25.8536 11.9487C25.596 12 25.2863 12 24.6667 12H16H7.33333C6.71379 12 6.40403 12 6.14643 11.9487C5.08859 11.7383 4.26165 10.9114 4.05124 9.85355C4 9.59595 4 9.28619 4 8.66665Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", d = "M5.33331 12V21.3332C5.33331 23.8475 5.33331 25.1045 6.11437 25.8856C6.89541 26.6665 8.15249 26.6665 10.6666 26.6665H12H20H21.3333C23.8474 26.6665 25.1045 26.6665 25.8856 25.8856C26.6666 25.1045 26.6666 23.8475 26.6666 21.3332V12")


proc ArrowLeftAlt*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", d = "M5.33334 16H26.6667")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", d = "M13.3334 8L5.41669 15.9167C5.37066 15.9627 5.37066 16.0373 5.41669 16.0833L13.3334 24")


proc ArrowUpLeftSquare*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M4 16C4 6.118 6.118 4 16 4C25.882 4 28 6.118 28 16C28 25.882 25.882 28 16 28C6.118 28 4 25.882 4 16Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12.6667 12.6667L20 20")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M18.6667 12H12.4378C12.196 12 12 12.196 12 12.4378V18.6667")


proc Barcode*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M10.6667 10.6667V21.3334")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16 10.6667V21.3334")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M21.3333 10.6667V21.3334")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M11.968 28C5.40638 28 4.00003 26.5937 4.00003 20.032")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M27.9999 20.032C27.9999 26.5937 26.5936 28 20.0319 28")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M20.0319 4C26.5936 4 27.9999 5.40635 27.9999 11.968")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M4.00003 11.968C4.00003 5.40635 5.40638 4 11.968 4")


proc Beaker*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M20.0648 5.33331H11.9352C11.287 5.33331 11.0808 6.20703 11.6605 6.49689C11.8686 6.60093 12 6.81361 12 7.04625V13.5621C12 14.2693 11.7191 14.9476 11.2189 15.4477L4.78105 21.8856C4.28095 22.3857 4 23.064 4 23.7712V24C4 25.4728 5.19391 26.6666 6.66667 26.6666H25.3333C26.8061 26.6666 28 25.4728 28 24V23.7712C28 23.064 27.7191 22.3857 27.2189 21.8856L20.7811 15.4477C20.2809 14.9476 20 14.2693 20 13.5621V7.04625C20 6.81361 20.1315 6.60093 20.3395 6.49689C20.9192 6.20703 20.7129 5.33331 20.0648 5.33331Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M6.66666 20H25.3333")


proc Box*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M5.33331 21.1059V21V10.6667C5.33331 10.2549 5.55543 9.87506 5.91437 9.67316L5.93506 9.66152L15.4909 4.28634L15.5636 4.24548C15.8345 4.09306 16.1654 4.09306 16.4364 4.24548L26.1473 9.7079C26.4681 9.88834 26.6666 10.2278 26.6666 10.5958V10.6667V21V21.1059C26.6666 21.4825 26.4674 21.8311 26.143 22.0223L16.5053 27.7021C16.1934 27.8859 15.8065 27.8859 15.4946 27.7021L5.85687 22.0223C5.53245 21.8311 5.33331 21.4825 5.33331 21.1059Z")
    tPath("stroke-width" = "2.66667", "d" = "M16 28V16")
    tPath("stroke-width" = "2.66667", "d" = "M16 16L5.33331 10")
    tPath("stroke-width" = "2.66667", "d" = "M26.6667 10L16 16")


proc Building*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M4 28H28")
    tPath("stroke-width" = "2.66667", "stroke-linejoin" = "round", "d" = "M25.3334 28V20V9.33333C25.3334 6.81917 25.3334 5.56209 24.5523 4.78105C23.7712 4 22.5142 4 20 4H16H12C9.48586 4 8.22878 4 7.44774 4.78105C6.66669 5.56209 6.66669 6.81917 6.66669 9.33333V20V28")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 10.6667H13.3333")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 16H13.3333")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 21.3333H13.3333")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M18.6667 10.6667H20")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M18.6667 16H20")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M18.6667 21.3333H20")


proc Case*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linejoin" = "round", "d" = "M4 13.3333C4 12.0908 4 11.4696 4.20299 10.9795C4.47364 10.3261 4.99277 9.80695 5.64617 9.5363C6.13624 9.33331 6.75749 9.33331 8 9.33331H24C25.2425 9.33331 25.8637 9.33331 26.3539 9.5363C27.0072 9.80695 27.5264 10.3261 27.7971 10.9795C28 11.4696 28 12.0908 28 13.3333V22.6666C28 25.1808 28 26.4378 27.2189 27.2189C26.4379 28 25.1808 28 22.6667 28H21.3333H10.6667H9.33333C6.81917 28 5.56209 28 4.78105 27.2189C4 26.4378 4 25.1808 4 22.6666V13.3333Z")
    tPath("stroke-width" = "2.66667", "stroke-linejoin" = "round", "d" = "M10.6667 9.33333V6.66667C10.6667 5.19391 11.8606 4 13.3334 4H18.6667C20.1395 4 21.3334 5.19391 21.3334 6.66667V9.33333")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M4 13.3333C4.24819 15.0888 4.97999 16.7117 6.07411 18.0952C8.25949 20.8586 11.8904 22.6666 16 22.6666C20.1096 22.6666 23.7405 20.8586 25.9259 18.0952C27.02 16.7117 27.7519 15.0888 28 13.3333")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M15.3333 17.3333H16.6666")


proc ChartBubbles*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M28 10.6667C28 14.3485 25.0152 17.3333 21.3334 17.3333C17.6515 17.3333 14.6667 14.3485 14.6667 10.6667C14.6667 6.98477 17.6515 4 21.3334 4C25.0152 4 28 6.98477 28 10.6667Z")
    tPath("stroke-width" = "2.66667", "d" = "M13.3333 20.6667C13.3333 23.244 11.244 25.3333 8.66667 25.3333C6.08933 25.3333 4 23.244 4 20.6667C4 18.0893 6.08933 16 8.66667 16C11.244 16 13.3333 18.0893 13.3333 20.6667Z")
    tPath("stroke-width" = "2.66667", "d" = "M25.3334 24.6666C25.3334 26.5076 23.841 28 22 28C20.1591 28 18.6667 26.5076 18.6667 24.6666C18.6667 22.8257 20.1591 21.3333 22 21.3333C23.841 21.3333 25.3334 22.8257 25.3334 24.6666Z")


proc ChartHistogram*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16 9.33331V21.3333")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M21.3333 12V21.3333")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M10.6667 14.6667V21.3334")
    tPath("stroke-width" = "2.66667", "d" = "M4 16C4 6.118 6.118 4 16 4C25.882 4 28 6.118 28 16C28 25.882 25.882 28 16 28C6.118 28 4 25.882 4 16Z")


proc ChartPie*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M6.66667 16C5.19387 16 3.96933 17.2091 4.29267 18.6459C5.4976 24.0003 10.2817 28 16 28C22.6274 28 28 22.6275 28 16C28 10.2817 24.0003 5.49758 18.6459 4.29266C17.2091 3.96933 16 5.19391 16 6.66667V13.3333C16 14.8061 14.8061 16 13.3333 16H6.66667Z")
    tPath("stroke-width" = "2.66667", "d" = "M4.43827 9.38159C5.2388 7.06962 7.0696 5.23875 9.3816 4.4383C10.7733 3.95647 12 5.19389 12 6.66665V9.33331C12 10.8061 10.8061 12 9.33333 12H6.66667C5.19387 12 3.95653 10.7733 4.43827 9.38159Z")


proc CheckAlt*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M9.33334 16L13.1877 19.8543C13.2682 19.9347 13.3987 19.9348 13.4792 19.8543L22.6667 10.6667")


proc CheckSquare*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M4 16C4 6.118 6.118 4 16 4C25.882 4 28 6.118 28 16C28 25.882 25.882 28 16 28C6.118 28 4 25.882 4 16Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 16L14.2437 18.2437C14.4773 18.4773 14.856 18.4773 15.0896 18.2437L20 13.3333")


proc ChevronLeftAlt*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M20 8L12.2835 15.7165C12.1269 15.8731 12.1269 16.1269 12.2835 16.2835L20 24")


proc ChevronRightAlt*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 24L19.7165 16.2835C19.8731 16.1269 19.8731 15.8731 19.7165 15.7165L12 8")


proc Clock*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M28 16C28 22.6275 22.6275 28 16 28C9.37259 28 4 22.6275 4 16C4 9.37259 9.37259 4 16 4C22.6275 4 28 9.37259 28 16Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16 9.33331V15.3333V15.3594C16 15.7596 16.2 16.1333 16.5331 16.3553L20 18.6666")


proc CloseSquare*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 12L20 20")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M20 12L12 20")
    tPath("stroke-width" = "2.66667", "d" = "M4 16C4 6.118 6.118 4 16 4C25.882 4 28 6.118 28 16C28 25.882 25.882 28 16 28C6.118 28 4 25.882 4 16Z")


proc Close*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 12L20 20")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M20 12L12 20")


proc Coffee*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linejoin" = "round", "d" = "M4 12C4 10.7575 4 10.1362 4.20299 9.64617C4.47364 8.99277 4.99277 8.47364 5.64617 8.20299C6.13624 8 6.75749 8 8 8H13.3333H18.6667C19.9092 8 20.5304 8 21.0205 8.20299C21.6739 8.47364 22.1931 8.99277 22.4637 9.64617C22.6667 10.1362 22.6667 10.7575 22.6667 12V20.8889C22.6667 26.6667 21.5333 28 13.3333 28C5.13332 28 4 26.6667 4 20.8889V12Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M22.6667 12H25.3334C26.8062 12 28 13.1939 28 14.6667V18.6667C28 20.1395 26.8062 21.3333 25.3334 21.3333H22.6667")


proc Settings*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M13.6733 26.4159C13.1236 25.0966 11.5821 24.5006 10.2844 25.0995C8.1372 26.0905 5.90948 23.8628 6.90048 21.7156C7.49942 20.4179 6.90341 18.8764 5.58409 18.3267C3.51592 17.4649 3.51592 14.5351 5.58409 13.6733C6.90341 13.1236 7.49942 11.582 6.90048 10.2844C5.90948 8.13719 8.1372 5.90946 10.2844 6.90053C11.5821 7.49946 13.1236 6.90346 13.6733 5.58413C14.5351 3.51586 17.4649 3.51586 18.3267 5.58413C18.8764 6.90346 20.418 7.49946 21.7156 6.90053C23.8628 5.90946 26.0905 8.13719 25.0995 10.2844C24.5005 11.582 25.0965 13.1236 26.4159 13.6733C28.4841 14.5351 28.4841 17.4649 26.4159 18.3267C25.0965 18.8764 24.5005 20.4179 25.0995 21.7156C26.0905 23.8628 23.8628 26.0905 21.7156 25.0995C20.418 24.5006 18.8764 25.0966 18.3267 26.4159C17.4649 28.4841 14.5351 28.4841 13.6733 26.4159Z")
    tPath("stroke-width" = "2.66667", "d" = "M20 16C20 13.7908 18.2092 12 16 12C13.7908 12 12 13.7908 12 16C12 18.2092 13.7908 20 16 20C18.2092 20 20 18.2092 20 16Z")


proc Copy*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M10.6667 21.282C5.23553 20.966 4 19.0809 4 12.6667C4 5.52967 5.52967 4 12.6667 4C19.0809 4 20.966 5.23553 21.282 10.6667")
    tPath("stroke-width" = "2.66667", "d" = "M10.6667 19.3334C10.6667 12.1964 12.1964 10.6667 19.3334 10.6667C26.4703 10.6667 28 12.1964 28 19.3334C28 26.4703 26.4703 28 19.3334 28C12.1964 28 10.6667 26.4703 10.6667 19.3334Z")


proc Filter*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M25.3333 4H6.66667C5.19391 4 4 5.19391 4 6.66667V8.22876C4 8.93601 4.28095 9.61428 4.78105 10.1144L12.5523 17.8856C13.0524 18.3857 13.3333 19.064 13.3333 19.7712V26.6667V27.0476C13.3333 27.8911 14.3532 28.3135 14.9496 27.7171L16 26.6667L17.8856 24.7811C18.3857 24.2809 18.6667 23.6027 18.6667 22.8955V19.7712C18.6667 19.064 18.9476 18.3857 19.4477 17.8856L27.2189 10.1144C27.7191 9.61428 28 8.93601 28 8.22876V6.66667C28 5.19391 26.8061 4 25.3333 4Z")


proc Gift*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linejoin" = "round", "d" = "M4 12.6666C4 12.0471 4 11.7373 4.05124 11.4797C4.26165 10.4219 5.08859 9.59497 6.14643 9.38455C6.40403 9.33331 6.71379 9.33331 7.33333 9.33331H16H24.6667C25.2863 9.33331 25.596 9.33331 25.8536 9.38455C26.9115 9.59497 27.7384 10.4219 27.9488 11.4797C28 11.7373 28 12.0471 28 12.6666C28 13.2862 28 13.596 27.9488 13.8536C27.7384 14.9114 26.9115 15.7384 25.8536 15.9488C25.596 16 25.2863 16 24.6667 16H16H7.33333C6.71379 16 6.40403 16 6.14643 15.9488C5.08859 15.7384 4.26165 14.9114 4.05124 13.8536C4 13.596 4 13.2862 4 12.6666Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M5.33334 16V21.3333C5.33334 23.8475 5.33334 25.1045 6.1144 25.8856C6.89544 26.6667 8.15252 26.6667 10.6667 26.6667H12H20H21.3333C23.8475 26.6667 25.1045 26.6667 25.8856 25.8856C26.6667 25.1045 26.6667 23.8475 26.6667 21.3333V16")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16 9.33331V26.6666")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M15.1671 8.29217L12.5279 4.99316C11.535 3.75208 9.68137 3.65197 8.55752 4.77583C6.87761 6.45573 8.06217 9.33333 10.4379 9.33333H14.6667C15.204 9.33333 15.5028 8.71177 15.1671 8.29217Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16.8329 8.29217L19.4721 4.99316C20.4651 3.75208 22.3187 3.65197 23.4425 4.77583C25.1224 6.45573 23.9379 9.33333 21.5621 9.33333H17.3333C16.796 9.33333 16.4972 8.71177 16.8329 8.29217Z")


proc Globe*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M28 16C28 22.6275 22.6275 28 16 28C9.37259 28 4 22.6275 4 16C4 9.37259 9.37259 4 16 4C22.6275 4 28 9.37259 28 16Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M4.66666 14.6667H7.99999C9.47275 14.6667 10.6667 15.8606 10.6667 17.3334C10.6667 18.8062 11.8606 20 13.3333 20C14.8061 20 16 21.1939 16 22.6667V27.3334")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M10.6667 5.33331V6.66665C10.6667 8.13941 11.8606 9.33331 13.3333 9.33331H13.5279C14.8932 9.33331 16 10.4401 16 11.8054C16 12.7418 16.5291 13.5978 17.3665 14.0166L17.4741 14.0704C18.2248 14.4457 19.1085 14.4457 19.8592 14.0704L19.9668 14.0166C20.8043 13.5978 21.3333 12.7418 21.3333 11.8054C21.3333 10.4401 22.4401 9.33331 23.8055 9.33331H26")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M21.3333 26V22.6667C21.3333 21.1939 22.5272 20 24 20H26.6667")


proc HelpSquare*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M14 11.5695C14.4887 11.0159 15.2036 10.6667 16 10.6667C17.4728 10.6667 18.6667 11.8606 18.6667 13.3334C18.6667 14.5783 17.8135 15.624 16.6599 15.9178C16.3031 16.0086 16 16.2986 16 16.6667V17.3334")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16 21.3334H16.0133")
    tPath("stroke-width" = "2.66667", "d" = "M4 16C4 6.118 6.118 4 16 4C25.882 4 28 6.118 28 16C28 25.882 25.882 28 16 28C6.118 28 4 25.882 4 16Z")


proc Help*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M14 11.5695C14.4887 11.0159 15.2036 10.6667 16 10.6667C17.4728 10.6667 18.6667 11.8606 18.6667 13.3334C18.6667 14.5783 17.8135 15.624 16.6599 15.9178C16.3031 16.0086 16 16.2986 16 16.6667V17.3334")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16 21.3334H16.0133")


proc License*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M25.3333 4H12C9.48583 4 8.22875 4 7.44771 4.78105C6.66666 5.56209 6.66666 6.81917 6.66666 9.33333V14V22.6667")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M18.6667 22.6667V25.3333C18.6667 26.8061 19.8605 28 21.3333 28C22.8061 28 24 26.8061 24 25.3333V12V6C24 4.89543 24.8955 4 26 4C27.1045 4 28 4.89543 28 6C28 7.10457 27.1045 8 26 8H24.6667")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M21.3333 28H6.66667C5.19391 28 4 26.8062 4 25.3334C4 23.8606 5.19391 22.6667 6.66667 22.6667H18.6667")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 9.33331H18.6667")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 14.6667H18.6667")


proc Maximaize*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M4.00003 16C4.00003 6.118 6.11803 4 16 4C25.882 4 28 6.118 28 16C28 25.882 25.882 28 16 28C6.11803 28 4.00003 25.882 4.00003 16Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M10.6667 16V20.6667C10.6667 21.0348 10.9652 21.3333 11.3334 21.3333H16")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M21.3334 16L21.3335 11.3334C21.3335 10.9652 21.0348 10.6667 20.6667 10.6667H16")


proc Minimaize*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M4.00003 16C4.00003 6.118 6.11803 4 16 4C25.882 4 28 6.118 28 16C28 25.882 25.882 28 16 28C6.11803 28 4.00003 25.882 4.00003 16Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M14.6667 22.6666L14.6665 18C14.6665 17.6318 14.3681 17.3333 14 17.3333H9.33334")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M17.3333 9.33331V14C17.3333 14.3681 17.6319 14.6666 18 14.6666H22.6667")


proc MoreVertical*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M4 16C4 25.882 6.118 28 16 28C25.882 28 28 25.882 28 16C28 6.118 25.882 4 16 4C6.118 4 4 6.118 4 16Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16.0065 10.6603V10.6733")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16.0065 15.9936V16.0067")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16.0065 21.3269V21.34")


proc Percent*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M21.3334 10.6667L10.6667 21.3334")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 12.0133V12")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M20 20.0133V20")
    tPath("stroke-width" = "2.66667", "d" = "M4 16C4 6.118 6.118 4 16 4C25.882 4 28 6.118 28 16C28 25.882 25.882 28 16 28C6.118 28 4 25.882 4 16Z")


proc Plus*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 16H20")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16 20V12")
    tPath("stroke-width" = "2.66667", "d" = "M4 16C4 25.882 6.118 28 16 28C25.882 28 28 25.882 28 16C28 6.118 25.882 4 16 4C6.118 4 4 6.118 4 16Z")


proc QrCode*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linejoin" = "round", "d" = "M20 8C20 6.75749 20 6.13624 20.2029 5.64617C20.4736 4.99277 20.9928 4.47364 21.6461 4.20299C22.1363 4 22.7575 4 24 4C25.2425 4 25.8637 4 26.3539 4.20299C27.0072 4.47364 27.5264 4.99277 27.7971 5.64617C28 6.13624 28 6.75749 28 8C28 9.24251 28 9.86376 27.7971 10.3538C27.5264 11.0072 27.0072 11.5264 26.3539 11.797C25.8637 12 25.2425 12 24 12C22.7575 12 22.1363 12 21.6461 11.797C20.9928 11.5264 20.4736 11.0072 20.2029 10.3538C20 9.86376 20 9.24251 20 8Z")
    tPath("stroke-width" = "2.66667", "stroke-linejoin" = "round", "d" = "M4 8C4 6.75749 4 6.13624 4.20299 5.64617C4.47364 4.99277 4.99277 4.47364 5.64617 4.20299C6.13624 4 6.75749 4 8 4C9.24251 4 9.86376 4 10.3538 4.20299C11.0072 4.47364 11.5264 4.99277 11.797 5.64617C12 6.13624 12 6.75749 12 8C12 9.24251 12 9.86376 11.797 10.3538C11.5264 11.0072 11.0072 11.5264 10.3538 11.797C9.86376 12 9.24251 12 8 12C6.75749 12 6.13624 12 5.64617 11.797C4.99277 11.5264 4.47364 11.0072 4.20299 10.3538C4 9.86376 4 9.24251 4 8Z")
    tPath("stroke-width" = "2.66667", "stroke-linejoin" = "round", "d" = "M4 24C4 22.7575 4 22.1363 4.20299 21.6461C4.47364 20.9928 4.99277 20.4736 5.64617 20.2029C6.13624 20 6.75749 20 8 20C9.24251 20 9.86376 20 10.3538 20.2029C11.0072 20.4736 11.5264 20.9928 11.797 21.6461C12 22.1363 12 22.7575 12 24C12 25.2425 12 25.8637 11.797 26.3539C11.5264 27.0072 11.0072 27.5264 10.3538 27.7971C9.86376 28 9.24251 28 8 28C6.75749 28 6.13624 28 5.64617 27.7971C4.99277 27.5264 4.47364 27.0072 4.20299 26.3539C4 25.8637 4 25.2425 4 24Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16 4V8")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M24 24H20")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M28 20H24")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M12 16H4")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M28 16H17.3333C16.5969 16 16 15.4031 16 14.6667V12")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M19.3334 28H26.6667C27.4031 28 28 27.4031 28 26.6667V24")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M16 28V21.6V21.3333C16 20.5969 16.5969 20 17.3333 20H20")


proc Search*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M4 16C4 6.118 6.118 4 16 4C25.882 4 28 6.118 28 16C28 25.882 25.882 28 16 28C6.118 28 4 25.882 4 16Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M18.6667 18.6667L21.3333 21.3334")
    tPath("stroke-width" = "2.66667", "d" = "M20 15.3334C20 17.9107 17.9107 20 15.3333 20C12.756 20 10.6667 17.9107 10.6667 15.3334C10.6667 12.756 12.756 10.6667 15.3333 10.6667C17.9107 10.6667 20 12.756 20 15.3334Z")


proc TgStar*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linejoin" = "round", "d" = "M22.6112 14.7221L20.5647 16.7687C19.9343 17.3991 19.6606 18.3029 19.8355 19.1772L20.2667 21.3333L20.3275 21.6375C20.4563 22.2815 19.7546 22.7687 19.1962 22.4231L17.4036 21.3133C16.5436 20.7809 15.4564 20.7809 14.5964 21.3133L12.8038 22.4231C12.2455 22.7687 11.5437 22.2815 11.6725 21.6375L11.7334 21.3333L12.1646 19.1772C12.3394 18.3029 12.0658 17.3991 11.4353 16.7687L9.33336 14.6667C8.84133 14.1747 9.1898 13.3333 9.88564 13.3333H10H11.9218C13.0373 13.3333 14.035 12.6389 14.4224 11.5928L15.2592 9.33332C15.5139 8.64589 16.4862 8.64589 16.7408 9.33332L17.5776 11.5928C17.9651 12.6389 18.9627 13.3333 20.0783 13.3333H22H22.036C22.7607 13.3333 23.1238 14.2096 22.6112 14.7221Z")
    tPath("stroke-width" = "2.66667", "d" = "M4 16C4 6.118 6.118 4 16 4C25.882 4 28 6.118 28 16C28 25.882 25.882 28 16 28C6.118 28 4 25.882 4 16Z")


proc Ticket*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M20 6.66669V10.6667")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M20 21.3333V25.3333")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M20 14.6667V17.3334")
    tPath("stroke-width" = "2.66667", "d" = "M5.92212 13.941C5.05668 12.9784 3.95574 11.9129 4.1053 10.6272C4.47773 7.42538 5.94694 6.66669 10.1973 6.66669H21.8027C26.0531 6.66669 27.5223 7.42538 27.8947 10.6272C28.0443 11.9129 26.9433 12.9784 26.0779 13.941C25.6565 14.4096 25.3333 15.0716 25.3333 16C25.3333 16.9284 25.6565 17.5904 26.0779 18.0591C26.9433 19.0216 28.0443 20.0871 27.8947 21.3728C27.5223 24.5747 26.0531 25.3334 21.8027 25.3334H10.1973C5.94694 25.3334 4.47773 24.5747 4.1053 21.3728C3.95574 20.0871 5.05668 19.0216 5.92212 18.0591C6.34346 17.5904 6.66665 16.9284 6.66665 16C6.66665 15.0716 6.34346 14.4096 5.92212 13.941Z")


proc UserSquare*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "d" = "M4 16C4 6.118 6.118 4 16 4C25.882 4 28 6.118 28 16C28 25.882 25.882 28 16 28C6.118 28 4 25.882 4 16Z")
    tPath("stroke-width" = "2.66667", "d" = "M20 13.3333C20 15.5425 18.2092 17.3333 16 17.3333C13.7908 17.3333 12 15.5425 12 13.3333C12 11.1242 13.7908 9.33331 16 9.33331C18.2092 9.33331 20 11.1242 20 13.3333Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M8 25.3333C8.85092 22.257 11.04 21.3333 16 21.3333C20.96 21.3333 23.1491 22.19 24 25.2662")


proc Users*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M20.8415 9.54021C21.2024 9.40641 21.5927 9.33331 22.0001 9.33331C23.8411 9.33331 25.3335 10.8257 25.3335 12.6666C25.3335 14.5076 23.8411 16 22.0001 16C21.5927 16 21.2024 15.9269 20.8415 15.793")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M4 25.3333C4.92183 22.257 7.29331 21.3333 12.6667 21.3333C18.04 21.3333 20.4115 22.257 21.3333 25.3333")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "d" = "M22.6667 20C25.8707 20.1267 27.3723 20.8511 28 22.6667")
    tPath("stroke-width" = "2.66667", "d" = "M17.3333 12.6667C17.3333 15.244 15.244 17.3333 12.6667 17.3333C10.0893 17.3333 8 15.244 8 12.6667C8 10.0893 10.0893 8 12.6667 8C15.244 8 17.3333 10.0893 17.3333 12.6667Z")


proc Home*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath("stroke-width" = "2.66667", "stroke-linejoin" = "round", d = "M23.6291 10.4175C24.4688 11.1973 24.8888 11.5872 25.1111 12.097C25.3334 12.6067 25.3334 13.1797 25.3334 14.3258V22.6667C25.3334 25.1808 25.3334 26.4379 24.5523 27.2189C23.7712 28 22.5142 28 20 28H18.6667H13.3334H12C9.48586 28 8.22878 28 7.44774 27.2189C6.66669 26.4379 6.66669 25.1808 6.66669 22.6667V14.3258C6.66669 13.1797 6.66669 12.6067 6.88898 12.097C7.11129 11.5872 7.53117 11.1973 8.37095 10.4175L11.3334 7.66668L12.371 6.7032C14.0922 5.10488 14.9528 4.30573 16 4.30573C17.0472 4.30573 17.9079 5.10488 19.6291 6.7032L20.6667 7.66668L23.6291 10.4175Z")
    tPath("stroke-width" = "2.66667", "stroke-linecap" = "round", "stroke-linejoin" = "round", d = "M13.3333 28V22.6667C13.3333 21.1939 14.5272 20 16 20C17.4728 20 18.6666 21.1939 18.6666 22.6667V28")


proc Loading*(class = "stroke-[#212121]"): TagRef = buildHtml:
  SvgIcon(class):
    tPath(class="opacity-75", d="M4 16a8 8 0 018-8V0C5.373 0 0 5.373 0 16h4zm2 5.291A7.962 7.962 0 014 16H0c0 3.042 1.135 5.824 3 7.938l3-2.647z")
