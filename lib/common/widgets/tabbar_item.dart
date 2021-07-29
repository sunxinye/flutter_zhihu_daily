import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class TabBarItem extends StatefulWidget {
  final Widget selectedTabText;
  final Widget unSelectedTabText;
  final Widget selectedTabIcon;
  final Widget unSelectedTabIcon;
  final bool isSelected;
  final bool showText;
  final Function onPressed;

  const TabBarItem(
      {Key key,
      this.unSelectedTabIcon,
      this.selectedTabIcon,
      this.unSelectedTabText,
      this.selectedTabText,
      this.isSelected,
      this.showText: true,
      this.onPressed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabBarStatus();
}

class _TabBarStatus extends State<TabBarItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isSelected
                ? widget.selectedTabIcon
                : widget.unSelectedTabIcon,
            widget.showText
                ? SizedBox(height: ScreenUtil().setWidth(5))
                : SizedBox(width: 0, height: 0),
            widget.showText
                ? (widget.isSelected
                    ? widget.selectedTabText
                    : widget.unSelectedTabText)
                : SizedBox(width: 0, height: 0)
          ],
        ),
      ),
    );
  }
}
