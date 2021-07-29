import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:zhihu_daily/common/widgets/custom_painters.dart';
import 'package:zhihu_daily/common/widgets/tabbar_item.dart';
import 'package:zhihu_daily/ui/pages/home_page.dart';
import 'package:zhihu_daily/ui/pages/mine_page.dart';
import 'package:zhihu_daily/ui/pages/web_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _currentSelectIndex = 0;
  final PageController _pageController = PageController();

  var tabPageList = [
    HomePage(),
    WebViewPage(
      "https://www.baidu.com",
      showTitleBar: false,
    ),
    WebViewPage(
      "https://www.hao123.com/",
      showTitleBar: false,
    ),
    MinePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 900));
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: tabPageList,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              painter: BottomAppBarPainter(
                  gapRadius: Radius.circular(30), cornerRadius: Radius.circular(30)),
              child: Container(
                height: ScreenUtil().setWidth(70),
                child: Row(
                  children: [
                    Expanded(
                        child: TabBarItem(
                          unSelectedTabIcon:
                          Icon(Icons.house_outlined, color: Colors.grey),
                          selectedTabIcon: Icon(Icons.house, color: Colors.blue),
                          unSelectedTabText:
                          Text("首页", style: TextStyle(color: Colors.grey)),
                          selectedTabText: Text(
                            "首页",
                            style: TextStyle(color: Colors.blue),
                          ),
                          showText: false,
                          isSelected: _currentSelectIndex == 0,
                          onPressed: () {
                            setState(() {
                              _currentSelectIndex = 0;
                            });
                            _pageController.jumpToPage(_currentSelectIndex);
                          },
                        )),
                    Expanded(
                        child: TabBarItem(
                          unSelectedTabIcon:
                          Icon(Icons.album_outlined, color: Colors.grey),
                          selectedTabIcon: Icon(Icons.album, color: Colors.blue),
                          unSelectedTabText:
                          Text("关注", style: TextStyle(color: Colors.grey)),
                          selectedTabText:
                          Text("关注", style: TextStyle(color: Colors.blue)),
                          showText: false,
                          isSelected: _currentSelectIndex == 1,
                          onPressed: () {
                            setState(() {
                              _currentSelectIndex = 1;
                            });
                            _pageController.jumpToPage(_currentSelectIndex);
                          },
                        )),
                    SizedBox(
                      width: ScreenUtil().setWidth(70),
                    ),
                    Expanded(
                        child: TabBarItem(
                          unSelectedTabIcon:
                          Icon(Icons.emoji_objects_outlined, color: Colors.grey),
                          selectedTabIcon: Icon(Icons.emoji_objects, color: Colors.blue),
                          unSelectedTabText:
                          Text("想法", style: TextStyle(color: Colors.grey)),
                          selectedTabText:
                          Text("想法", style: TextStyle(color: Colors.blue)),
                          showText: false,
                          isSelected: _currentSelectIndex == 2,
                          onPressed: () {
                            setState(() {
                              _currentSelectIndex = 2;
                            });
                            _pageController.jumpToPage(_currentSelectIndex);
                          },
                        )),
                    Expanded(
                        child: TabBarItem(
                          unSelectedTabIcon:
                          Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                          selectedTabIcon: Icon(Icons.emoji_emotions, color: Colors.blue),
                          unSelectedTabText:
                          Text("我的", style: TextStyle(color: Colors.grey)),
                          selectedTabText:
                          Text("我的", style: TextStyle(color: Colors.blue)),
                          showText: false,
                          isSelected: _currentSelectIndex == 3,
                          onPressed: () {
                            setState(() {
                              _currentSelectIndex = 3;
                            });
                            _pageController.jumpToPage(_currentSelectIndex);
                          },
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: ScreenUtil().setWidth(40),
        ),
      ),
      floatingActionButtonLocation: _BottomCenterFabLocation(),
    );
  }
}

class _BottomCenterFabLocation extends StandardFabLocation
    with FabCenterOffsetX, FabBottomOffsetY {
  const _BottomCenterFabLocation();

  @override
  String toString() => 'FloatingActionButtonLocation.bottomCenter';
}

mixin FabBottomOffsetY on StandardFabLocation {
  @override
  double getOffsetY(ScaffoldPrelayoutGeometry scaffoldGeometry, double adjustment) {
    return scaffoldGeometry.contentBottom - ScreenUtil().setWidth(70) - scaffoldGeometry.floatingActionButtonSize.height / 2;
  }
}
