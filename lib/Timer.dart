import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shavuha/foodList.dart';
import "dart:math" show pi;

import 'main.dart';

class CountDownTimer extends StatefulWidget {
  static const SCREEN_KEYY = "Timer";

  const CountDownTimer(this.sec);

  final int sec;

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController controller;

  TimeOfDay _timeNow = new TimeOfDay.now();

  String get timerString {
    Duration duration = controller.duration * controller.value;
    //print(controller.duration * controller.value);
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  Timer _timer;
  int _start = timeForTimer;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.sec),
    );
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    if (_start > 1)
      return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white10,
          body: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                controller.reverse(
                    from: controller.value == 0.0 ? 1.0 : controller.value);

                return Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.pink[200],
                        height: controller.value *
                            MediaQuery.of(context).size.height,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: FractionalOffset.center,
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: CustomPaint(
                                          painter: CustomTimerPainter(
                                        animation: controller,
                                        backgroundColor: Colors.white,
                                        color: themeData.indicatorColor,
                                      )),
                                    ),
                                    Align(
                                      alignment: FractionalOffset.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Готово через:",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            timerString,
                                            style: TextStyle(
                                                fontSize: 112.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
        onWillPop: () => showDialog<bool>(
          context: context,
          builder: (c) => AlertDialog(
            title: Text('Погoди'),
            content: Text(
                'Шаурмейкер старается, а ты не хочешь ждать? Может всё же останешься здесь?'),
            actions: [
              FlatButton(
                child: Text('Да'),
                onPressed: () => Navigator.pop(c, false),
              ),
              FlatButton(
                child: Text('Нет'),
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text('Неа'),
                      content: Text('Ты всё же подождёшь, Ваээ..'),
                      actions: [
                        FlatButton(
                          child: Text('Оке('),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    else
      return Scaffold(
        body: AlertDialog(
          title: Text("Ваш заказ готов!"),
          content: Text("Наши шаурмейкеры всегда готовят качественное питание"),
          actions: <Widget>[
            FlatButton(
                child: Text("Да"),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyApp()),
                    ModalRoute.withName(MyApp.SCREEN_KEY),
                  );
                }),
          ],
        ),
      );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
