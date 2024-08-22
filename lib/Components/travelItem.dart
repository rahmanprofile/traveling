import 'package:flutter/material.dart';
import 'package:travel_app/Model/placeModel.dart';
import 'package:travel_app/View/Pages/selectedPage.dart';

class TravelItem extends StatelessWidget {
  final List<PlaceModel>? item;
  final index;

  TravelItem({this.item, this.index});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(25),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedPage(selectPlace: item![index],)));
        },
        child: Container(
            height: myHeight * 0.5,
            // width: myWidth*0.3,
      
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 7,
                      spreadRadius: 3,
                      offset: Offset(0, 5))
                ],
                image: DecorationImage(
                    image: AssetImage(
                      item![index].image.toString(),
                    ),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: myHeight * 0.07,
                      width: myWidth * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 40, 93, 116).withOpacity(0.5),
                      ),
                      child: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 30),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item![index].name.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 29,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: myWidth * 0.02,
                            ),
                            Text(
                              item![index].location.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: myHeight * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              "Starting at",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: myWidth * 0.03,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              // height: myHeight * 0.07,
                              // width: myWidth * 0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              child: Text(
                                item![index].price.toString() + ' \$',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
