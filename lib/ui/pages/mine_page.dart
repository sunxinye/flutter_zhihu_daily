import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zhihu_daily/common/widgets/custom_painters.dart';
import 'package:zhihu_daily/routers/router_manager.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key key}) : super(key: key);
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin<MinePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Align(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomPaint(
                  painter: BottomAppBarPainter(
                      gapRadius: Radius.circular(30),
                      cornerRadius: Radius.circular(30)),
                  child: Container(
                    height: 100,
                    width: 50,
                    decoration: BoxDecoration(),
                    child: Text("状态"),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text("登录"),
            onPressed: () {
              Navigator.of(context).pushNamed(RouterNames.login);
            },
          )
          // Stack(
          //   children: [
          //     Container(
          //       width: double.infinity,
          //       height: 400,
          //       color: Colors.amber,
          //     ),
          //     ClipPath(
          //       clipper: BgClipper(topPartHeight: 100, centerCornerRadius: Radius.circular(50)),
          //       child: Stack(
          //         children: [
          //           SizedBox(
          //             width: double.infinity,
          //             height: 300,
          //             child: Image.asset(
          //               "assets/images/image_earth.png",
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //           BackdropFilter(
          //             filter: new ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          //             child: new Container(
          //               color: Colors.white.withOpacity(0.1),
          //               width: double.infinity,
          //               height: 300,
          //             ),
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // )
        ],
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
