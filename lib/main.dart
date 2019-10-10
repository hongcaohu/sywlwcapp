import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as su;
//import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String dateTime = "";
 TimerUtil timer;

  @override
  void initState() {
    super.initState();
    timer = TimerUtil();
    timer.setInterval(1000);
    timer.setOnTimerTickCallback((i) {
      setState(() {
        this.dateTime =DateUtil.formatDate(DateTime.now(), format: DataFormats.zh_y_mo_d_h_m); 
      });
    });
    if(timer != null) {
      timer.startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    su.ScreenUtil.instance = su.ScreenUtil(width: 1920, height: 1200)..init(context);
    double cH = su.ScreenUtil.getInstance().setHeight(1200 * 0.6);
    double cW = MediaQuery.of(context).size.width - 60;
    double itemW = cW / 4 - 50;
    double hTop = cH * 0.6;
    double hBottom = cH * 0.3;

    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Color.fromRGBO(84, 120, 208, 1),
                  //Color.fromRGBO(113, 134, 199, 1),
                  Color.fromRGBO(131, 135, 183, 1),
                  Color.fromRGBO(65, 29, 90, 1),
                  //Color.fromRGBO(92, 57, 113, 1),
                  //Color.fromRGBO(32, 14, 76, 1),
                ])),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Align(
                      child: Text(dateTime, style: TextStyle(fontSize: su.ScreenUtil.instance.setSp(74), fontWeight: FontWeight.normal, color: Colors.white),),
                      alignment: Alignment(0.9, 0),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(width: 1.0, color: Colors.white),
                      color: Color.fromRGBO(255, 255, 255, 0.1)),
                  width: cW,
                  height: su.ScreenUtil.getInstance().setHeight(1200 * 0.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/smile.png",
                            height: hTop,
                            width: itemW,
                            fit: BoxFit.fitWidth,
                          ),
                          Container(
                            //decoration: BoxDecoration(border:Border.all(width: 1.0), color: Colors.white),
                            height: hBottom,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "满意",
                                    style: TextStyle(
                                        fontSize:
                                            su.ScreenUtil.getInstance().setSp(68),
                                        color:
                                            Color.fromRGBO(255, 244, 118, 1)),
                                  ),
                                  Text(
                                    "300",
                                    style: TextStyle(
                                        fontSize:
                                            su.ScreenUtil.getInstance().setSp(57),
                                        color:
                                            Color.fromRGBO(255, 244, 118, 1)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/normal.png",
                            height: hTop,
                            width: itemW - 12,
                            fit: BoxFit.fitWidth,
                          ),
                          Container(
                            //decoration: BoxDecoration(border:Border.all(width: 1.0), color: Colors.white),
                            height: hBottom,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "一般",
                                    style: TextStyle(
                                        fontSize:
                                            su.ScreenUtil.getInstance().setSp(68),
                                        color: Color.fromRGBO(255, 106, 6, 1)),
                                  ),
                                  Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize:
                                            su.ScreenUtil.getInstance().setSp(57),
                                        color: Color.fromRGBO(255, 106, 6, 1)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/sad.png",
                            height: hTop,
                            width: itemW,
                            fit: BoxFit.fitWidth,
                          ),
                          Container(
                            //decoration: BoxDecoration(border:Border.all(width: 1.0), color: Colors.white),
                            height: hBottom,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "不满意",
                                    style: TextStyle(
                                        fontSize:
                                            su.ScreenUtil.getInstance().setSp(68),
                                        color: Color.fromRGBO(255, 50, 50, 1)),
                                  ),
                                  Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize:
                                            su.ScreenUtil.getInstance().setSp(57),
                                        color: Color.fromRGBO(255, 50, 50, 1)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Image.asset("assets/images/wc.png"),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(""),
                  ),
                )
              ],
            )));
  }

  @override
  void dispose() {
    super.dispose();
    if(timer != null) {
      timer.cancel();
    }
  }
}
