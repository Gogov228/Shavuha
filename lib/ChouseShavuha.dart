import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:shavuha/Shop.dart';
import 'package:shavuha/foodList.dart';

class ChouseShavuha extends StatefulWidget {
  @override
  _chouse createState() => _chouse();
}

int priceYourShaurm = 0;

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
          if (countShava > 0)
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Shop(),
                ),
              ),
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
                ShaurAdd(
                    'assets/shavaCat.jpg',
                    "Шaурма",
                    "Лаваш, мясо на выбор (курица, свинина), помидоры, капуста, огурцы",
                    200),
              if (_currentSelection == 0)
                ShaurAdd(
                    'assets/shavaCat.jpg', "Чизурма", "Там всё огонь", 200),
              if (_currentSelection == 0)
                ShaurAdd('assets/shavaCat.jpg', "Рандом от Шаурмейкера",
                    "Лаваш, мясо - рандом, овощи рандом от 2 до 3 штук", 200),
              if (_currentSelection == 1)
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Center(
                    child: Text(
                      "Мясо",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              if (_currentSelection == 1)
                ChouseIngredient("Свинка (Аллах под лавашом не видит)", 100,
                    svinkaDeCounter, svinkaCounter, svinka),
              if (_currentSelection == 1)
                ChouseIngredient(
                    "Курочка", 100, chikenDeCounter, chikenCounter, chiken),
              if (_currentSelection == 1)
                Container(
                  margin: EdgeInsets.only(bottom: 15, top: 15),
                  child: Center(
                    child: Text(
                      "Овощи",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              if (_currentSelection == 1)
                ChouseIngredient(
                    "Помидор", 20, tomatoDeCounter, tomatoCounter, tomato),
              if (_currentSelection == 1)
                ChouseIngredient(
                    "Огурец", 20, ogurecDeCounter, ogurecCounter, ogurec),
              if (_currentSelection == 1)
                ChouseIngredient("Лук", 10, lukDeCounter, lukCounter, luk),
              if (_currentSelection == 1)
                ChouseIngredient(
                    "Листья салата", 10, salatDeCounter, salatCounter, salat),
              if (_currentSelection == 1)
                ChouseIngredient(
                    "Капуста", 20, kapustaDeCounter, kapustaCounter, kapusta),
              if (_currentSelection == 1)
                Container(
                  margin: EdgeInsets.only(bottom: 15, top: 15),
                  child: Center(
                    child: Text(
                      "Соусы",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              if (_currentSelection == 1)
                ChouseIngredient(
                    "Мазик", 20, mazikDeCounter, mazikCounter, mazik),
              if (_currentSelection == 1)
                ChouseIngredient(
                    "Кепчук", 20, ketcupDeCounter, ketcupCounter, ketcup),
              if (_currentSelection == 1)
                ChouseIngredient(
                    "Сырный", 20, chizDeCounter, chizCounter, chiz),
              if (_currentSelection == 1)
                Container(
                  height: 100,
                  margin: EdgeInsets.only(top: 50),
                  child: FlatButton(
                    onPressed: () {
                      print(allIngredients);
                      shaurList[countShava] = ShaurShow('assets/shavaCat.jpg',
                          'Ручная сборка', 'Всё как вы просили', shaurmSum);
                      shaurPrise[countShava] = shaurmSum;
                      setState(() {
                        while (chiken > 0) chikenDeCounter(100);
                        while (svinka > 0) svinkaDeCounter(100);
                        while (tomato > 0) tomatoDeCounter(20);
                        while (ogurec > 0) ogurecDeCounter(20);
                        while (luk > 0) lukDeCounter(10);
                        while (salat > 0) salatDeCounter(10);
                        while (kapusta > 0) kapustaDeCounter(20);
                        while (mazik > 0) mazikDeCounter(20);
                        while (ketcup > 0) ketcupDeCounter(20);
                        while (chiz > 0) chizDeCounter(20);

                        countShava++;
                        shaurmSum = 0;
                      });
                      print(shaurList);
                      print(allIngredients);
                    },
                    child: Text(
                      "Добавить за $shaurmSum",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    color: Colors.yellow[200],
                    disabledColor: Colors.yellow[200],
                  ),
                ),
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
          });
        },
      ),
    );
  }

  Card ChouseIngredient(String subTitle, int price, Function decounter,
      Function counter, int count) {
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
                  onPressed: () => counter(price),
                ),
              ),
              ButtonTheme(
                minWidth: 30,
                height: 30,
                child: FlatButton(
                  color: Colors.grey[100],
                  disabledColor: Colors.grey[100],
                  child: Text("-"),
                  onPressed: () => decounter(price),
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

  void chikenCounter(int prise) {
    setState(() {
      chiken++;
      shaurmSum += prise;
      print(shaurmSum);
    });
  }

  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++
  void svinkaCounter(int prise) {
    setState(() {
      svinka++;
      shaurmSum += prise;
      print(shaurmSum);
    });
  }

  void tomatoCounter(int prise) {
    setState(() {
      tomato++;
      shaurmSum += prise;
      print(shaurmSum);
    });
  }

  void ogurecCounter(int prise) {
    setState(() {
      ogurec++;
      shaurmSum += prise;
      print(shaurmSum);
    });
  }

  void lukCounter(int prise) {
    setState(() {
      luk++;
      shaurmSum += prise;
      print(shaurmSum);
    });
  }

  void salatCounter(int prise) {
    setState(() {
      salat++;
      shaurmSum += prise;
      print(shaurmSum);
    });
  }

  void kapustaCounter(int prise) {
    setState(() {
      kapusta++;
      shaurmSum += prise;
      print(shaurmSum);
    });
  }

  void mazikCounter(int prise) {
    setState(() {
      mazik++;
      shaurmSum += prise;
      print(shaurmSum);
    });
  }

  void ketcupCounter(int prise) {
    setState(() {
      ketcup++;
      shaurmSum += prise;
      print(shaurmSum);
    });
  }

  void chizCounter(int prise) {
    setState(() {
      chiz++;
      shaurmSum += prise;
      print(shaurmSum);
    });
  }

//-------------------------------------------------
  void chikenDeCounter(int prise) {
    setState(() {
      if (chiken > 0) {
        chiken--;
        shaurmSum -= prise;
        print(shaurmSum);
      }
    });
  }

  void svinkaDeCounter(int prise) {
    setState(() {
      if (svinka > 0) {
        svinka--;
        shaurmSum -= prise;
        print(shaurmSum);
      }
    });
  }

  void tomatoDeCounter(int prise) {
    setState(() {
      if (tomato > 0) {
        tomato--;
        shaurmSum -= prise;
        print(shaurmSum);
      }
    });
  }

  void ogurecDeCounter(int prise) {
    setState(() {
      if (ogurec > 0) {
        ogurec--;
        shaurmSum -= prise;
        print(shaurmSum);
      }
    });
  }

  void lukDeCounter(int prise) {
    setState(() {
      if (luk > 0) {
        luk--;
        shaurmSum -= prise;
        print(shaurmSum);
      }
    });
  }

  void salatDeCounter(int prise) {
    setState(() {
      if (salat > 0) {
        salat--;
        shaurmSum -= prise;
        print(shaurmSum);
      }
    });
  }

  void kapustaDeCounter(int prise) {
    setState(() {
      if (kapusta > 0) {
        kapusta--;
        shaurmSum -= prise;
        print(shaurmSum);
      }
    });
  }

  void mazikDeCounter(int prise) {
    setState(() {
      if (mazik > 0) {
        mazik--;
        shaurmSum -= prise;
        print(shaurmSum);
      }
    });
  }

  void ketcupDeCounter(int prise) {
    setState(() {
      if (ketcup > 0) {
        ketcup--;
        shaurmSum -= prise;
        print(shaurmSum);
      }
    });
  }

  void chizDeCounter(int prise) {
    setState(() {
      if (chiz > 0) {
        chiz--;
        shaurmSum -= prise;
        print(shaurmSum);
      }
    });
  }

  void countShavuha() {
    setState(() {
      countShava++;
    });
  }

  Container ShaurAdd(String image, String name, String subText, int price) {
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
                            'Цена:$price',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          FlatButton(
                            onPressed: () {
                              shaurList[countShava] =
                                  ShaurShow(image, name, subText, price);
                              shaurPrise[countShava] = price;
                              countShavuha();
                              print(shaurList);
                              totalSum += price;
                            },
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
