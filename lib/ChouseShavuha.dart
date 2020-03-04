import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class ChouseShavuha extends StatefulWidget {
  @override
  _chouse createState() => _chouse();
}

Map<int, Widget> _children() => {
      0: Text('Выбрать'),
      1: Text('Собрать'),
    };

class _chouse extends State<ChouseShavuha> {
  @override
  int _currentSelection = 0;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Салам, шаурма пополам'),
      ),
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: Column(
            children: <Widget>[
              MaterialSegmentedControl(
                children: _children(),
                borderColor: Colors.grey,
                selectedColor: Colors.orangeAccent[200],
                unselectedColor: Colors.white,
                borderRadius: 32.0,
                onSegmentChosen: (index) {
                  setState(() {
                    _currentSelection = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
