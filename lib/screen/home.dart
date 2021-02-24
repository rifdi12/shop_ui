import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'product_detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool favorit = false;
  int cart = 0;
  void initState() {
    SharedPreferences.getInstance().then((value) {
      setState(() {
        favorit = value.getBool('favorit') ?? false;
        cart = value.getInt('cart') ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.homeOutline),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.heartOutline),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.messageCircleOutline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.personOutline),
            label: 'Profile',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://scontent-sin6-1.xx.fbcdn.net/v/t1.0-9/139000661_1681939242008181_6582985187196825943_o.jpg?_nc_cat=111&ccb=3&_nc_sid=09cbfe&_nc_eui2=AeH4p4FnkwpnrktKMkJDKb4-oLks9xAMPr6guSz3EAw-vjNuKbKqi3Ghiww4P-VGzHzYWxRF41UQq7IRdvJf_1tV&_nc_ohc=1Gvr_MjqHcMAX-0jJ9U&_nc_ht=scontent-sin6-1.xx&oh=f53eb1cf2b0fc61a42364004ff92b58a&oe=605C5F8C'),
                      backgroundColor: Colors.transparent,
                    ),
                    Stack(
                      children: [
                        Icon(
                          EvaIcons.shoppingCartOutline,
                          size: 35,
                        ),
                        if (cart > 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: Text(
                                '$cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Fashion Shop',
                  style: TextStyle(
                      color: Color(0xff231d1f),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Get popular fashion from home',
                  style: TextStyle(
                    color: Color(0xff231d1f),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xffc5c7cc),
                      ),
                      prefixIcon: Icon(EvaIcons.searchOutline),
                      hintText: "Search the clothes you need",
                      fillColor: Colors.white,
                      filled: true),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                          color: Color(0xff231d1f),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xfff26d71),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset('assets/images/shoes.jpg'),
                            ),
                            Text(
                              'Shoes',
                              style: TextStyle(
                                color: Color(0xff676767),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset('assets/images/shoes.jpg'),
                            ),
                            Text(
                              'Shoes',
                              style: TextStyle(
                                color: Color(0xff676767),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset('assets/images/shoes.jpg'),
                            ),
                            Text(
                              'Shoes',
                              style: TextStyle(
                                color: Color(0xff676767),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Fashion',
                      style: TextStyle(
                          color: Color(0xff231d1f),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xfff26d71),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: (150 / 162),
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail()),
                        ).then((value) async {
                          SharedPreferences.getInstance().then((value) {
                            setState(() {
                              favorit = value.getBool('favorit') ?? false;
                              cart = value.getInt('cart') ?? 0;
                            });
                          });
                        });
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 85,
                            child: Column(
                              children: [
                                Container(
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 25,
                                            color: Colors.black12)
                                      ]),
                                  padding: EdgeInsets.only(
                                      top: 50, left: 15, right: 15, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Twill soft Shoes',
                                              style: TextStyle(
                                                color: Color(0xff676767),
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          favorit
                                              ? Icon(
                                                  EvaIcons.heart,
                                                  color: Colors.red,
                                                  size: 18,
                                                )
                                              : Icon(
                                                  EvaIcons.heartOutline,
                                                  size: 18,
                                                )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '\$ 42.99',
                                            style: TextStyle(
                                                color: Color(0xffbfbfbf),
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '\$ 42.99',
                                            style: TextStyle(
                                              color: Color(0xff676767),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Align(
                            child: Image.asset(
                              'assets/images/product1-removebg-preview.png',
                              width: 130,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail()),
                        ).then((value) async {
                          SharedPreferences.getInstance().then((value) {
                            setState(() {
                              favorit = value.getBool('favorit') ?? false;
                              cart = value.getInt('cart') ?? 0;
                            });
                          });
                        });
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 85,
                            child: Column(
                              children: [
                                Container(
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 25,
                                            color: Colors.black12)
                                      ]),
                                  padding: EdgeInsets.only(
                                      top: 50, left: 15, right: 15, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Twill soft Shoes',
                                              style: TextStyle(
                                                color: Color(0xff676767),
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Icon(
                                            EvaIcons.heartOutline,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '\$ 42.99',
                                            style: TextStyle(
                                                color: Color(0xffbfbfbf),
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '\$ 42.99',
                                            style: TextStyle(
                                              color: Color(0xff676767),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Align(
                            child: Image.asset(
                              'assets/images/pizza_shoe12.0-removebg-preview.png',
                              width: 130,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail()),
                        ).then((value) async {
                          SharedPreferences.getInstance().then((value) {
                            setState(() {
                              favorit = value.getBool('favorit') ?? false;
                              cart = value.getInt('cart') ?? 0;
                            });
                          });
                        });
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 85,
                            child: Column(
                              children: [
                                Container(
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 25,
                                            color: Colors.black12)
                                      ]),
                                  padding: EdgeInsets.only(
                                      top: 50, left: 15, right: 15, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Twill soft Shoes',
                                              style: TextStyle(
                                                color: Color(0xff676767),
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Icon(
                                            EvaIcons.heartOutline,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '\$ 42.99',
                                            style: TextStyle(
                                                color: Color(0xffbfbfbf),
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '\$ 42.99',
                                            style: TextStyle(
                                              color: Color(0xff676767),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Align(
                            child: Image.asset(
                              'assets/images/product1-removebg-preview.png',
                              width: 130,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail()),
                        ).then((value) async {
                          SharedPreferences.getInstance().then((value) {
                            setState(() {
                              favorit = value.getBool('favorit') ?? false;
                              cart = value.getInt('cart') ?? 0;
                            });
                          });
                        });
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 85,
                            child: Column(
                              children: [
                                Container(
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 25,
                                            color: Colors.black12)
                                      ]),
                                  padding: EdgeInsets.only(
                                      top: 50, left: 15, right: 15, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Twill soft Shoes',
                                              style: TextStyle(
                                                color: Color(0xff676767),
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Icon(
                                            EvaIcons.heartOutline,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '\$ 42.99',
                                            style: TextStyle(
                                                color: Color(0xffbfbfbf),
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '\$ 42.99',
                                            style: TextStyle(
                                              color: Color(0xff676767),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Align(
                            child: Image.asset(
                              'assets/images/pizza_shoe12.0-removebg-preview.png',
                              width: 130,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
