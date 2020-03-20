import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:shavuha/foodList.dart';
import 'package:shavuha/ChouseShavuha.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text("Цена заказа: $totalSum"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.payment),
            onPressed: () {
              print("12");
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
                        shaurList.clear();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyApp()),
                          ModalRoute.withName(MyApp.SCREEN_KEY),
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
            Container(
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
            Expanded(
              child: ListView.builder(
                itemCount: shaurList.length,
                itemBuilder: (BuildContext context, int index) {
                  //for (i in shaurList.keys)
                  return Dismissible(
                    key: UniqueKey(),
                    child: shaurList[index.toInt()],
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        shaurList.remove(index);
                        shaurList.keys.toList()[index];
                        print(shaurList);
                        print(shaurList.keys.toList()[index]);
                        countShava--;
                        totalSum -= shaurPrise[index];
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

  String minut() {
    if (_time.minute + 5 == 0)
      return '${_time.minute}0';
    else if (_time.minute + 5 < 10 && 0 < _time.minute + 5)
      return '0${_time.minute + 5}';
    else
      return '${_time.minute + 5}';
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
