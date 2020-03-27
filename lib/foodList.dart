import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shavuha/ChouseShavuha.dart';

bool mainTimer = false;
int chiken = 0;
int svinka = 0;
int tomato = 0;
int ogurec = 0;
int luk = 0;
int salat = 0;
int kapusta = 0;
int mazik = 0;
int ketcup = 0;
int chiz = 0;
int shaurmSum = 0;
int countShava = 0;
int totalSum = 0;
Map<int, Container> shaurList = {};
List<Container> shaurmaList = [];
List<int> priseList = [];
Map<int, int> shaurPrise = {};
int timeForTimer = 3;
List allIngredients = [
  chiken,
  svinka,
  tomato,
  ogurec,
  luk,
  salat,
  kapusta,
  mazik,
  ketcup,
  chiz
];

Container ShaurShow(String image, String name, String subText, int price) {
  return Container(
    child: Card(
      color: Colors.pink[100],
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  image,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      child: new Text(
                        subText,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    //color: Colors.deepOrange,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Цена:$price',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Icon(Icons.backspace),
            ),
          ],
        ),
      ),
    ),
  );
}
