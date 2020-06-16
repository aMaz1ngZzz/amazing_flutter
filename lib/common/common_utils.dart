class CommonUtils {
  static String makeUrl(String page, List<String> params) {
    String url = 'http://www.wsrtv.com.cn';

    if (page != null && page.isNotEmpty) {
      page = '/$page';
    }

    url = url + page;
    try {
      if (params != null && params.length > 0) {
        if (!url.contains("?")) {
          url += "?";
        } else if (url.contains("=") && !url.endsWith("=")) {
          url += "&";
        }
        for (int i = 0; i < params.length; i += 2) {
          url += params[i] + "=" + params[i + 1] + "&";
        }
        url = url.substring(0, url.length - 1);
      }
    } catch (e) {}
    print('url === $url');
    return url;
  }

  static Map<String, String> getNormalRequestHeader(String token) {
    Map<String, String> map = {'X-CSRF-Token': token};
    return map;
  }

  static List<String> matchImageSrc(String srcImageStr) {
    List<String> result = [];
    RegExp exp = new RegExp(r"<(img|IMG)(.*?)(/>|></img>|>)");
    for (var item in exp.allMatches(srcImageStr)) {
      String strImg = item.group(2);
      print('strImg == $strImg');
      RegExp pSrc = new RegExp(r"""(src|SRC)=(\"|\')(.*?)(\"|\')""");
      if (strImg != null && strImg.isNotEmpty) {
        var match = pSrc.firstMatch(strImg);
        if (match != null) {
          result.add(match.group(3));
        }
      }
    }
    return result;
  }

  static String getSrcImagePath(String srcImageStr) {
    List list = matchImageSrc(srcImageStr);
    String path = list?.first;

    print('src === $path');
    return path;
  }
}
