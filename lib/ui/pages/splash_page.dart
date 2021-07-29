import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zhihu_daily/routers/router_manager.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State {
  Timer jumpTimer;

  @override
  void initState() {
    super.initState();
    jumpTimer = Timer(Duration(milliseconds: 1000), () {
      Navigator.of(context).pushReplacementNamed(RouterNames.main);
    });
  }

  @override
  void dispose() {
    jumpTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl: "https://upload-images.jianshu.io/upload_images/13222938-74a4dc4115d76790.png",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
