import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as su;
import 'package:flustars/flustars.dart';
import 'package:sywlwcapp/component/itemWidget.dart';

void main() async {
  await SpUtil.getInstance();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  runApp(MyApp());
}

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
  int smileNum = 0, normalNum = 0, sadNum = 0;

  @override
  void initState() {
    super.initState();
    //初始化评价数
    smileNum = SpUtil.getInt("smileNum") ?? 0;
    normalNum = SpUtil.getInt("normalNum") ?? 0;
    sadNum = SpUtil.getInt("sadNum") ?? 0;

    timer = TimerUtil();
    timer.setInterval(1000);
    timer.setOnTimerTickCallback((i) {
      setState(() {
        this.dateTime =
            DateUtil.formatDate(DateTime.now(), format: DataFormats.y_mo_d_h_m);
      });
    });
    if (timer != null) {
      timer.startTimer();
    }
  }

  addSmileNum() {
    int num = smileNum + 1;
    SpUtil.putInt("smileNum", num);
    setState(() {
      smileNum = num;
    });
  }

  addNormalNum() {
    int num = normalNum + 1;
    SpUtil.putInt("normalNum", num);
    setState(() {
      normalNum = num;
    });
  }

  addSadNum() {
    int num = sadNum + 1;
    SpUtil.putInt("sadNum", num);
    setState(() {
      sadNum = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    su.ScreenUtil.instance = su.ScreenUtil(width: 1920, height: 1200)
      ..init(context);
    double cH = su.ScreenUtil.getInstance().setHeight(1200 * 0.6);
    double cW = MediaQuery.of(context).size.width - 60;
    double itemW = cW / 4 - 50;

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
                  Color.fromRGBO(113, 134, 199, 1),
                  //Color.fromRGBO(131, 135, 183, 1),
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
                      child: Text(
                        dateTime,
                        style: TextStyle(
                            fontSize: su.ScreenUtil.instance.setSp(50),
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
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
                  height: cH,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ItemWidget(
                        title: '满意',
                        height: (cH - 2) / 1.2,
                        width: itemW,
                        image: 'assets/images/smile.png',
                        num: smileNum,
                        onClick: addSmileNum,
                        color: Color.fromRGBO(255, 244, 118, 1),
                      ),
                      ItemWidget(
                        title: '一般',
                        height: (cH - 2) / 1.2,
                        width: itemW,
                        image: 'assets/images/normal.png',
                        num: normalNum,
                        onClick: addNormalNum,
                        color: Color.fromRGBO(255, 106, 6, 1),
                        imageWidth: itemW-20
                      ),
                      ItemWidget(
                        title: '不满意',
                        height: (cH - 2) / 1.2,
                        width: itemW,
                        image: 'assets/images/sad.png',
                        num: sadNum,
                        onClick: addSadNum,
                        color: Color.fromRGBO(255, 50, 50, 1),
                        imageWidth: itemW-20
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
    if (timer != null) {
      timer.cancel();
    }
  }
}
