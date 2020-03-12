import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class ChouseShavuha extends StatefulWidget {
  @override
  _chouse createState() => _chouse();
}
int priceYourShaurm=0;
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
        color: Colors.grey[300],
        child: Center(
          child: ListView(
            children: <Widget>[
              ControlShaurm(),

              if (_currentSelection == 0)
              ShaurAdd('assets/shavaCat.jpg', "Шaурма", "Лаваш, мясо на выбор (курица, свинина), помидоры, капуста, огурцы", "Цена: 200"),
              if (_currentSelection == 0)
              ShaurAdd('assets/shavaCat.jpg',"Чизурма","Там всё огонь","Цена: 200"),
              if (_currentSelection == 0)
              ShaurAdd('assets/shavaCat.jpg', "Рандом от Шаурмейкера", "Лаваш, мясо - рандом, овощи рандом от 2 до 3 штук", "Цена: 200"),

              if (_currentSelection == 1)
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Center(
                  child: Text(
                    "Мясо",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              if (_currentSelection == 1)
              ChouseIngredient("Свинка (Аллах под лавашом не видит)",100),
              if (_currentSelection == 1)
              ChouseIngredient("Курочка",100),
              if (_currentSelection == 1)
                Container(
                  margin: EdgeInsets.only(bottom: 15,top: 15),
                  child: Center(
                    child: Text(
                      "Овощи",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              if (_currentSelection == 1)
                ChouseIngredient("Помидор",20),
              if (_currentSelection == 1)
                ChouseIngredient("Огурец",20),
              if (_currentSelection == 1)
                ChouseIngredient("Лук",10),
              if (_currentSelection == 1)
                ChouseIngredient("Листья салата",10),
              if (_currentSelection == 1)
                ChouseIngredient("Капуста",20),
              if (_currentSelection == 1)
              Container(
                margin: EdgeInsets.only(bottom: 15,top: 15),
                child: Center(
                  child: Text(
                    "Соусы",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              if (_currentSelection == 1)
                ChouseIngredient("Мазик",20),
              if (_currentSelection == 1)
                ChouseIngredient("Кепчук",20),
              if (_currentSelection == 1)
                ChouseIngredient("Сырный",20),
              if (_currentSelection == 1)
                ChouseIngredient("Соус от Шефа",50),
            ],
          ),
        ),
      ),
    );
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
            if (index == 1) {
            } else {}
          });
        },
      ),
    );
  }

  Card ChouseIngredient(String subTitle, int price){
    int count = 0;
    return Card(
      color: Colors.pink[100],
      child: Row(
        children: <Widget>[
          Container(
            child: Text("X$count"),
            margin: EdgeInsets.all(20),
          ),
          Column(
            children: <Widget>[
              ButtonTheme(
                minWidth: 30,
                height: 30,
                child: FlatButton(
                  color: Colors.grey[100],
                  disabledColor: Colors.grey[100],
                  child: Text("+"),
                  onPressed: ()=> bletPlus(count,price),
                ),
              ),
              ButtonTheme(
                minWidth: 30,
                height: 30,
                child: FlatButton(
                  color: Colors.grey[100],
                  disabledColor: Colors.grey[100],
                  child: Text("-"),
                  onPressed: () =>bletMinus(count,price),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.all(4),
              child: Text(subTitle),
            ),
          ),
          Container(margin: EdgeInsets.all(4), child: Text("$price р")),
        ],
      ),
    );
  }

  void bletMinus(int count,int price){
    if (count>0) {
      setState(() {
        priceYourShaurm -= price;
        count-=1;
        print(count);
        print(priceYourShaurm);
      });
    }
  }
  void bletPlus(int count,int price){
    if (count<=0) {
      setState(() {
        priceYourShaurm += price;
        count++;
        print(count);
        print(priceYourShaurm);
      });
    }
    }

  Container ShaurAdd(String image, String name, String subText, String price) {
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
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            price,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          FlatButton(
                            onPressed: null,
                            child: Text("Добавить"),
                            color: Colors.grey[200],
                            disabledColor: Colors.grey[200],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
