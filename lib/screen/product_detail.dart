import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String size = 'S';
  Color itemColor = Color(0xfffcd1d1);
  num price = 12.00;
  int qty = 1;
  bool favorit = false;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      setState(() {
        favorit = value.getBool('favorit') ?? false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Qty',
                        style: TextStyle(
                            color: Color(0xff989898),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        icon: Icon(EvaIcons.minusSquare),
                        onPressed: qty <= 0
                            ? null
                            : () {
                                setState(() {
                                  qty -= 1;
                                });
                              },
                        color: Color(0xfff26d71),
                      ),
                      Text('$qty'),
                      IconButton(
                        icon: Icon(EvaIcons.plusSquare),
                        onPressed: () {
                          setState(() {
                            qty += 1;
                          });
                        },
                        color: Color(0xfff26d71),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            color: Color(0xff989898),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '\$ ${qty * price}',
                        style: TextStyle(
                            color: Color(0xff231d1f),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.red)),
                color: Color(0xfff26d71),
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  int counter = (preferences.getInt('cart') ?? 0) + 1;
                  await preferences.setInt('cart', counter);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      EvaIcons.shoppingCartOutline,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add to cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: itemColor,
          actions: [
            Container(
              child: IconButton(
                icon: favorit
                    ? Icon(
                        EvaIcons.heart,
                        color: Colors.red,
                      )
                    : Icon(
                        EvaIcons.heartOutline,
                        color: Colors.black87,
                      ),
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  bool fav = preferences.getBool('favorit') ?? false;
                  await preferences.setBool('favorit', !fav);
                  setState(() {
                    favorit = !fav;
                  });
                },
              ),
            ),
          ],
          leading: Row(
            children: [
              IconButton(
                icon: Icon(
                  EvaIcons.chevronLeft,
                  color: Colors.black87,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          expandedHeight: 220.0,
          floating: true,
          pinned: false,
          snap: false,
          elevation: 50,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Image.asset(
              'assets/images/product1-removebg-preview.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Twill Soft Shirt long',
                          style: TextStyle(
                              color: Color(0xff231d1f),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              EvaIcons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              '4.2',
                              style: TextStyle(
                                  color: Color(0xff231d1f),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' {103}',
                              style: TextStyle(
                                color: Color(0xff676767),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis diam felis. Sed faucibus leo tellus, scelerisque tristique ipsum sodales quis. In hac habitasse platea dictumst. Donec ultricies, massa sit amet elementum eleifend, purus odio semper lectus, nec gravida lacus tortor eu ipsum. Duis diam massa, dapibus sed purus non, ullamcorper blandit elit. Donec eu finibus dolor. Mauris turpis neque, dapibus vitae molestie in, mollis id nunc. Sed non ipsum dignissim, vehicula dolor quis, faucibus ipsum. Proin ornare nunc in dui gravida, nec consectetur erat bibendum. Maecenas lacinia placerat semper. ',
                      style: TextStyle(
                        color: Color(0xff989898),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Item Size',
                      style: TextStyle(
                          color: Color(0xff231d1f),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                size = 'S';
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Text(
                                'S',
                                style: TextStyle(
                                    color: size == 'S'
                                        ? Color(0xfff26d71)
                                        : Color(0xff231d1f),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                size = 'M';
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Text(
                                'M',
                                style: TextStyle(
                                    color: size == 'M'
                                        ? Color(0xfff26d71)
                                        : Color(0xff231d1f),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                size = 'L';
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Text(
                                'L',
                                style: TextStyle(
                                    color: size == 'L'
                                        ? Color(0xfff26d71)
                                        : Color(0xff231d1f),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                size = 'XL';
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Text(
                                'XL',
                                style: TextStyle(
                                    color: size == 'XL'
                                        ? Color(0xfff26d71)
                                        : Color(0xff231d1f),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Item Color',
                      style: TextStyle(
                          color: Color(0xff231d1f),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                itemColor = Color(0xfffcd1d1);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xfffcd1d1),
                              ),
                              child: itemColor == Color(0xfffcd1d1)
                                  ? Icon(
                                      EvaIcons.checkmark,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  : SizedBox(),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                itemColor = Color(0xffece2e1);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffece2e1)),
                              child: itemColor == Color(0xffece2e1)
                                  ? Icon(
                                      EvaIcons.checkmark,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  : SizedBox(),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                itemColor = Color(0xffd3e0dc);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffd3e0dc)),
                              child: itemColor == Color(0xffd3e0dc)
                                  ? Icon(
                                      EvaIcons.checkmark,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  : SizedBox(),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                itemColor = Color(0xffaee1e1);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffaee1e1)),
                              child: itemColor == Color(0xffaee1e1)
                                  ? Icon(
                                      EvaIcons.checkmark,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  : SizedBox(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            )
          ]),
        )
      ]),
    );
  }
}
