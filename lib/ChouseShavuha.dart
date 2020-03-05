import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class ChouseShavuha extends StatefulWidget {
  @override
  _chouse createState() => _chouse();
}

Map<int, Widget> _children() => {
      0: Text('Выбрать'),
      1: Text('Собери сам'),
    };

class _chouse extends State<ChouseShavuha> {
  @override
  int _currentSelection = 0;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Выбор товара'),
        backgroundColor: Colors.pink[200],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Container(
        //color: Colors.greenAccent,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
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
                      //debugPrint(index);
                    });
                  },
                ),
              ),
              Container(
                child: Card(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Image.asset(
                            'assets/shavaCat.jpg',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Center(
                              child: Text("Шаурма"),
                            ),
                            Center(
                              child: Container(
                                width: 200,
                                child: new Text(
                                  "Лаваш, мясо на выбор (курица, свинина), помидоры",
                                  softWrap: true,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.deepOrange,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text("228"),
                                  FlatButton(
                                    onPressed: null,
                                    child: null,
                                    color: Colors.grey,
                                    disabledColor: Colors.grey,
                                  ),
                                ],
                              ),
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
        ),
      ),
    );
  }
}
