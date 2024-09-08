import
  happyx,
  ../ui/[colors, data]


proc Styles*(): TagRef =
  buildHtml:
    tStyle: {fmt"""
      .skeleton-screen {{
        background: linear-gradient(110deg, {BgMain} 8%, {Bg} 18%, {BgMain} 33%);
        background-size: 200% 100%;
        animation: 1s shine linear infinite;
      }}
      .skeleton-screen-main {{
        background: linear-gradient(110deg, {Bg} 8%, {BgMain} 18%, {Bg} 33%);
        background-size: 200% 100%;
        animation: 1s shine linear infinite;
      }}
      .skeleton-screen-primary {{
        background: linear-gradient(110deg, {Primary} 8%, {Secondary} 18%, {Primary} 33%);
        background-size: 200% 100%;
        animation: 1s shine linear infinite;
      }}
      """}
