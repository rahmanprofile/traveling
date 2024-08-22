import 'package:flutter/material.dart';
import 'package:travel_app/Model/placeModel.dart';

class SelectedPage extends StatefulWidget {
  PlaceModel? selectPlace;

  SelectedPage({this.selectPlace});

  @override
  State<SelectedPage> createState() => _SelectedPageState();
}

class _SelectedPageState extends State<SelectedPage> {

  @override
  void initState() {
    ticketPrice = widget.selectPlace!.price!;
    totalTicketPrice = widget.selectPlace!.price!;
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
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                    height: myHeight * 0.5,
                    // width: myWidth*0.3,

                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.grey.withOpacity(0.5),
                        //       blurRadius: 7,
                        //       spreadRadius: 3,
                        //       offset: Offset(0, 5))
                        // ],
                        image: DecorationImage(
                            image: AssetImage(
                              widget.selectPlace!.image.toString(),
                            ),
                            fit: BoxFit.cover)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: myHeight * 0.06,
                                width: myWidth * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 40, 93, 116)
                                      .withOpacity(0.4),
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 25,
                                ),
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
                                Container(
                                  width: myWidth * 0.3,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7),
                                  // height: myHeight * 0.07,
                                  // width: myWidth * 0.12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: myWidth * 0.02,
                                      ),
                                      Text(
                                        widget.selectPlace!.location.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: myHeight * 0.01,
                                ),
                                Text(
                                  widget.selectPlace!.name.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 29,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: myHeight * 0.005,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        widget.selectPlace!.price.toString() +
                                            ' \$',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      'About the place',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Flexible(
                        child: Text(
                      widget.selectPlace!.about.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[600]),
                    )),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_filled,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: myWidth * 0.02,
                        ),
                        Text(
                          'Length',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      widget.selectPlace!.length.toString() + " Days",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.people_alt,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: myWidth * 0.02,
                        ),
                        Text(
                          'Persons',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (ticket > 1) {
                              setState(() {
                                ticket--;
                                totalTicketPrice = totalTicketPrice - ticketPrice;
                              });
                            }
                          },
                          child: Container(
                            height: myHeight * 0.03,
                            width: myWidth * 0.065,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            ticket.toString(),
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              ticket++;
                              totalTicketPrice = totalTicketPrice + ticketPrice;
                            });
                          },
                          child: Container(
                            height: myHeight * 0.03,
                            width: myWidth * 0.065,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: myWidth * 0.6,
                      child: Stack(
                        children: [
                          profileItem('assets/profile/15.jpg'),
                          Positioned(
                            left: myWidth * 0.1,
                            child: profileItem('assets/profile/16.jpg'),
                          ),
                          Positioned(
                            left: myWidth * 0.2,
                            child: profileItem('assets/profile/17.jpg'),
                          ),
                          Positioned(
                            left: myWidth * 0.3,
                            child: profileItem('assets/profile/18.jpg'),
                          ),
                          Positioned(
                            left: myWidth * 0.4,
                            child: moreItem(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Container(
                // color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                         totalTicketPrice.toString() +  ' \$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          ),
                          ticket == 1 ?
                          Text(
                            '( ' + ticket.toString() + ' Ticket )',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ) :
                          Text(
                            '( ' + ticket.toString() + ' Tickets )',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black,
                        ),
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  int ticket = 1;

  int ticketPrice = 0;
  int totalTicketPrice = 0;

  Widget profileItem(String img) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Container(
      height: myHeight * 0.1,
      width: myWidth * 0.13,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
          color: Colors.blue,
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(img))),
    );
  }

  Widget moreItem() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Container(
      height: myHeight * 0.1,
      width: myWidth * 0.13,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3),
        color: Colors.grey[400],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '+23',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
