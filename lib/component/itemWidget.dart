import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWidget extends StatefulWidget {
  ItemWidget(
      {Key key,
      this.num,
      this.title,
      this.onClick,
      this.width,
      this.height,
      this.image = 'assets/images/smile.png',
      this.color = const Color.fromRGBO(255, 244, 118, 1),
      this.imageWidth})
      : super(key: key);

  final int num;
  final String title;
  final GestureTapCallback onClick;
  final double width;
  final double height;
  final String image;
  final Color color;
  final double imageWidth;

  @override
  _ItemWidgetState createState() {
    return _ItemWidgetState();
  }
}

class _ItemWidgetState extends State<ItemWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 50), vsync: this);
    CurvedAnimation cAnimation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation = Tween(begin: 1.0, end: 0.85).animate(cAnimation);
    cAnimation.addListener(() {
      if(animation.value==0.85 && animation.status==AnimationStatus.completed) {
         controller.reverse();
      }
    });
  }

  _onTap() {
    controller.forward();
    widget.onClick();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: _onTap,
            child: ScaleTransition(
              scale: animation,
              child: Image.asset(
                widget.image,
                alignment: Alignment.bottomCenter,
                height: widget.height / 2,
                width: widget.imageWidth ?? widget.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            //decoration: BoxDecoration(border:Border.all(width: 1.0), color: Colors.white),
            height: widget.height / 2,
            width: widget.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(68),
                        color: widget.color),
                  ),
                  Text(
                    widget.num.toString(),
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(57),
                        color: widget.color),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
