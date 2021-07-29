import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController _controller;

  CurvedAnimation _curve;

  Animation<double> _tween;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack);
    _tween = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _tween.addListener(() {
      setState(() {});
    });
    setState(() {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
              top: -400,
              right: -400,
              child: Transform.translate(
                  offset:
                  Offset(-200.0 * _curve.value, 200.0 * _curve.value),
                  child: Image.asset(
                    'assets/images/blue_round.png',
                    width: 400.0,
                    height: 400.0,
                    fit: BoxFit.fill,
                  ))),
          Positioned(
              bottom: -200,
              left: -200,
              child: Transform.translate(
                  offset:
                  Offset(100.0 * _curve.value, -100.0 * _curve.value),
                  child: Image.asset(
                    'assets/images/purple_round.png',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.fill,
                  ))),
          Positioned(
              bottom: -400,
              right: -400,
              child: Transform.translate(
                  offset: Offset(
                      -200.0 * _curve.value, -200.0 * _curve.value),
                  child: Image.asset(
                    'assets/images/yellow_round.png',
                    width: 400.0,
                    height: 400.0,
                    fit: BoxFit.fill,
                  ))),
          Positioned.fill(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: (ScreenUtil().screenHeight - 500 ) / 2,),
                    Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(20),
                            top: ScreenUtil().setWidth(5),
                            bottom: ScreenUtil().setWidth(5),
                            right: ScreenUtil().setWidth(20)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/yellow_round.png',
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: ScreenUtil().setWidth(5),
                            ),
                            Text(
                              "欢迎登录/注册纸糊日报",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setWidth(23)),
                            ),
                            SizedBox(
                              height: ScreenUtil().setWidth(70),
                            ),
                            Text(
                              "手机号",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setWidth(18)),
                            ),
                            SizedBox(
                              height: ScreenUtil().setWidth(10),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  icon: Icon(Icons.phone_android,
                                      color: Colors.blue, size: 18),
                                  hintText: "请输入手机号",
                                  hintStyle:
                                  TextStyle(color: Colors.grey),
                                  counterText: "",
                                  contentPadding: EdgeInsets.only(
                                      top: 3, bottom: 3),
                                  border: InputBorder.none),
                              keyboardType: TextInputType.phone,
                              maxLength: 11,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setWidth(18)),
                              onChanged: (String s) {

                              },
                            ),
                            Divider(
                              height: 0.5,
                              color: Colors.grey,
                              indent: ScreenUtil().setWidth(40),
                            ),
                            SizedBox(
                              height: ScreenUtil().setWidth(15),
                            ),
                            Text(
                              "验证码",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setWidth(18)),
                            ),
                            SizedBox(
                              height: ScreenUtil().setWidth(10),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.verified_user,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  hintText: "请输入验证码",
                                  hintStyle:
                                  TextStyle(color: Colors.grey),
                                  counterText: "",
                                  contentPadding: EdgeInsets.only(
                                      top: 1, bottom: 1),
                                  border: InputBorder.none),
                              keyboardType: TextInputType.number,
                              maxLength: 6,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setWidth(18)),
                              onChanged: (s) {

                              },
                            ),
                            Divider(
                              height: 0.5,
                              color: Colors.grey,
                              indent: ScreenUtil().setWidth(40),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: ScreenUtil().setWidth(40),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(20),
                        ),
                        Expanded(
                          child: RaisedButton(
                            color: Colors.blue,
                            highlightColor: Colors.blue[700],
                            colorBrightness: Brightness.dark,
                            splashColor: Colors.grey,
                            child: Text("登录"),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20.0)),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(20),
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          highlightColor: Colors.blue[700],
                          colorBrightness: Brightness.dark,
                          splashColor: Colors.grey,
                          child: Text("密码登录"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0))),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
