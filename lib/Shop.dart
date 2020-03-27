import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:shavuha/Timer.dart';
import 'package:shavuha/foodList.dart';
import 'package:shavuha/main.dart';

class Shop extends StatefulWidget {
  @override
  shop createState() => shop();
}

class shop extends State<Shop> {
  int _currentSelection = 1;
  var i, j;

  Map<int, Widget> _children() => {
        0: Text('Доставка'),
        1: Text('Самовынос'),
      };

  TimeOfDay _time = new TimeOfDay.now();
  TimeOfDay _timeNow = new TimeOfDay.now();

  int waitTime() {
    var h = _time.hour * 3600 - _timeNow.hour * 3600;
    var m = (_time.minute + 3) * 60 - _timeNow.minute * 60;

    return h + m;
  }

  @override
  Widget build(BuildContext context) {
    timeForTimer = waitTime();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text("Цена заказа: $totalSum"),
        actions: <Widget>[
          if (totalSum > 0)
            IconButton(
              icon: Icon(Icons.payment),
              onPressed: () {
                showDialog(
                  context: context,
                  child: AlertDialog(
                    title: Text("Хотите заказать?"),
                    content:
                        Text("Стоимость вашего заказа составляет: $totalSum"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Да"),
                        onPressed: () {
                          totalSum = 0;
                          countShava = 0;
                          shaurPrise.clear();
                          shaurmaList.clear();
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CountDownTimer(waitTime()),
                            ),
                          );
                        },
                      ),
                      FlatButton(
                        child: Text("Нет"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ControlShaurm(),
            Container(
              alignment: Alignment.center,
              child: Text('Заказ будет готов к:${_time.hour}:${minut()}'),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 4, right: 4),
              child: OutlineButton(
                child: Text("Выберите время"),
                onPressed: () => selectTime(context),
              ),
            ),
            SizedBox(
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 4, right: 4, bottom: 10),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hoverColor: Colors.pink[200],
                    border: OutlineInputBorder(),
                    labelText: 'Комментарий к заказу',
                  ),
                ),
              ),
            ),
            if (_currentSelection == 0)
              SizedBox(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 4, right: 4, bottom: 10),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hoverColor: Colors.pink[200],
                      border: OutlineInputBorder(),
                      labelText: 'Место доставки',
                    ),
                  ),
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: shaurmaList.length,
                itemBuilder: (BuildContext context, int index) {
                  //for (i in shaurList.keys)
                  return Dismissible(
                    key: UniqueKey(),
                    child: shaurmaList[index.toInt()],
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        //print(shaurList.keys.toList()[index]);
                        shaurmaList.removeAt(index);
                        deCountShavuha();
                        totalSum -= priseList[index];
                        priseList.removeAt(index);
                        //shaurPrise.remove(index);
                        print(shaurPrise);
                        print(index);
                      });
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Узбек грустит(")));
                    },
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.restore_from_trash),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deCountShavuha() {
    setState(() {
      countShava--;
    });
  }

  String minut() {
    if (_time.minute + 3 == 0)
      return '${_time.minute}0';
    else if (_time.minute + 3 < 10 && 0 < _time.minute + 3)
      return '0${_time.minute + 3}';
    else
      return '${_time.minute + 3}';
  }

  Container ControlShaurm() {
    return Container(
      margin: EdgeInsets.all(10),
      child: MaterialSegmentedControl(
        children: _children(),
        selectionIndex: _currentSelection,
        borderColor: Colors.grey,
        selectedColor: Colors.orangeAccent[200],
        unselectedColor: Colors.white,
        borderRadius: 32.0,
        disabledChildren: [
          2,
        ],
        onSegmentChosen: (index) {
          setState(() {
            _currentSelection = index;
            print(index);
          });
        },
      ),
    );
  }

  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null) {
      print('Выбрано время:${_time.toString()}');
      setState(() {
        _time = picked;
      });
    }
  }
}
