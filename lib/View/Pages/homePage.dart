import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/Model/placeModel.dart';

import '../../Components/travelItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List category = ["All", "Adventures", "Caves", "Nature", "Oceans"];
  int clicked = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await loadJson();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
          height: myHeight,
          width: myWidth,
          child: Column(
            children: [
              Container(
                height: myHeight * 0.1,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: myHeight * 0.05,
                    left: myWidth * 0.05,
                    right: myWidth * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: myHeight * 0.065,
                            width: myWidth * 0.1,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/profile/11.jpg',
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: myWidth * 0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hello there ,',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[600]),
                              ),
                              Text(
                                'Daniel',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icons/1.png',
                        height: myHeight * 0.03,
                        color: Color(0xffCED6D9),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: myHeight * 0.1,
                width: myWidth,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: myHeight * 0.03,
                    left: myWidth * 0.06,
                    right: myWidth * 0.06,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: myHeight * 0.05,
                        width: myWidth * 0.75,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color(0xffEDF1F2),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search destination',
                                hintStyle: TextStyle(color: Colors.grey),
                                icon: Image.asset(
                                  'assets/icons/5.png',
                                  height: myHeight * 0.03,
                                  color: Color(0xffCED6D9),
                                ))),
                      ),
                      Container(
                        height: myHeight * 0.05,
                        width: myWidth * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 40, 93, 116),
                                Color(0xff2E93AA),
                              ]),
                        ),
                        child: Center(
                            child: Image.asset(
                          'assets/icons/2.png',
                          height: myHeight * 0.025,
                          color: Colors.white,
                        )),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: myHeight * 0.03,
                  left: myWidth * 0.06,
                  right: myWidth * 0.06,
                ),
                child: Container(
                  height: myHeight * 0.05,
                  width: myWidth,
                  child: ListView.builder(
                    itemCount: category.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return categoryWidget(index);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: myHeight * 0.03,
                  left: myWidth * 0.06,
                  right: myWidth * 0.06,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: placeList.length,
                itemBuilder: (context, index) {
                  return TravelItem(index: index,item: placeList,);
                },
              ))
            ],
          )),
    ));
  }

  Widget categoryWidget(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          setState(() {
            clicked = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: clicked == index
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 40, 93, 116),
                        Color(0xff2E93AA),
                      ]),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Center(
              child: Text(
            category[index],
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: clicked == index ? Colors.white : Colors.grey,
                fontSize: 18),
          )),
        ),
      ),
    );
  }

  List myData = [];

  List<PlaceModel> placeList = [];

  loadJson() async {
    String data = await rootBundle.loadString('assets/json/data.json');

    setState(() {
      myData = json.decode(data);
      placeList = myData.map((e) => PlaceModel.fromJson(e)).toList();
      placeList = placeList;
    });
  }
}
