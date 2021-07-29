import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:zhihu_daily/res/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            title: Row(
              children: [
                SizedBox(
                  width: 228,
                  height: 40,
                  child: Image.asset(
                    "assets/images/diversion_product_home_title.png",
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.contact_support_outlined,
                  color: Colors.white,
                ),
                tooltip: "客服",
                onPressed: () => {},
              ) 
            ],
          ),
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topCenter,
              children: [
                Positioned(
                  top: -400,
                  left: 0,
                  right: 0,
                  child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        color: MyColors.app_main,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _createTopLayout(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, top: 13, right: 20, bottom: 4),
                      child: Text(
                        "智享推荐",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          _createRecommendProductLayout()
        ],
      ),
    );
  }

  Widget _createTopLayout() {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 10, end: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 0.0),
                blurRadius: 10.0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 18),
            child: Text("智享借款·最高可借(元)",
                style: TextStyle(color: Colors.black54, fontSize: 12)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text("200,000",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 45)),
                          )),
                      Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                              width: 120,
                              height: 40,
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                child: FlatButton(
                                  child: Text(
                                    "立即拿钱",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  onPressed: () {},
                                  color: MyColors.app_main,
                                  highlightColor: MyColors.app_main,
                                  colorBrightness: Brightness.dark,
                                  splashColor: Colors.grey,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              )))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: FlatButton.icon(
                      icon: Icon(
                        Icons.article_outlined,
                        color: MyColors.app_main,
                      ),
                      label: Text(
                        "借款记录",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                      color: Colors.grey[100],
                    ),
                  ),
                  Container(
                    width: 9,
                  ),
                  Expanded(
                    flex: 1,
                    child: FlatButton.icon(
                      icon: Icon(
                        Icons.article_outlined,
                        color: MyColors.app_main,
                      ),
                      label: Text(
                        "还款账单",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                      color: Colors.grey[100],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget _createRecommendProductLayout() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      //创建列表项
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0)
            ]),
        child: TextField(
          style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setWidth(20)),
        ),
      );
    }, childCount: 50));
  }

  @override
  bool get wantKeepAlive => true;
}
