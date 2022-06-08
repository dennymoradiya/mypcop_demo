import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class DashbordScreen extends StatefulWidget {
  DashbordScreen({Key? key}) : super(key: key);

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  dynamic selected;
  var heart = false;
  var MONTHS = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  // calender cred

  DateTime todaydate = DateTime.now();
  String formattedDateTime() {
    return MONTHS[todaydate.month - 1] +
        " " +
        todaydate.day.toString() +
        " " +
        todaydate.year.toString();
  }

  @override
  void initState() {
    super.initState();
    formattedDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 4,
                  child: SvgPicture.asset(
                    "asset/drawer.svg",
                    height: 40,
                    width: 40,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.3,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 4,
                  child: SvgPicture.asset(
                    "asset/Group 921.svg",
                    height: 40,
                    width: 40,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 4,
                  child: SvgPicture.asset(
                    "asset/bell.svg",
                    height: 40,
                    width: 40,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 4,
                  child: SvgPicture.asset(
                    "asset/4.svg",
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Welcome , ',
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: 'Mypcot !!',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Text("here is your dashbord...",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    shadowColor: Colors.grey,
                    elevation: 4,
                    child: SvgPicture.asset(
                      "asset/Group 922.svg",
                      fit: BoxFit.fitHeight,
                      height: Get.width * 0.14,
                      width: Get.width * 0.14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.40,
              width: Get.width * 0.90,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: container_cred.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 15),
                          child: Container(
                            height: Get.height * 0.30,
                            width: Get.width * 0.90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: container_cred[index]["primerycolor"],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 18,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              SvgPicture.asset(
                                container_cred[index]["image"].toString(),
                                height: Get.height * 0.15,
                                width: Get.width * 0.15,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            16), // <-- Radius
                                      ),
                                      primary: container_cred[index]
                                          ["secndorycolor"],
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  child: Text(
                                    container_cred[index]["btn"],
                                  )),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formattedDateTime().toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      "Today",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: const [
                        Text("   TIMELINE "),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        SizedBox(width: 4),
                        const Icon(Icons.today),
                        Text(" ${formattedDateTime().toString()}"),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                height: Get.height * 0.20,
                width: Get.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "New Order Created",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text("New Order Created With Order",
                              style: TextStyle(fontSize: 12)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "09:00 AM",
                            style: TextStyle(color: Color(0xffFF604E)),
                          ),
                          Icon(
                            Icons.arrow_forward_outlined,
                            color: Color(0xffFF604E),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Container(
                          height: Get.width * 0.15,
                          width: Get.width * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xffFF604E),
                          ),
                          child: SizedBox(
                            height: Get.width * 0.10,
                            width: Get.width * 0.10,
                            child: SvgPicture.asset(
                              "asset/Group 913.svg",
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: StylishBottomBar(
        items: [
          AnimatedBarItems(
              icon: const Icon(
                Icons.house_outlined,
              ),
              selectedColor: Colors.deepPurple,
              backgroundColor: Colors.amber,
              title: const Text('Home')),
          AnimatedBarItems(
              icon: const Icon(Icons.star_border_rounded),
              selectedColor: Colors.green,
              backgroundColor: Colors.amber,
              title: const Text('Star')),
          AnimatedBarItems(
              icon: const Icon(
                Icons.style_outlined,
              ),
              backgroundColor: Colors.amber,
              selectedColor: Colors.deepOrangeAccent,
              title: const Text('Style')),
          AnimatedBarItems(
              icon: const Icon(
                Icons.person_outline,
              ),
              backgroundColor: Colors.amber,
              selectedColor: Colors.pinkAccent,
              title: const Text('Profile')),
        ],
        iconSize: 32,
        barAnimation: BarAnimation.fade,
        iconStyle: IconStyle.animated,
        hasNotch: true,
        fabLocation: StylishBarFabLocation.end,
        opacity: 0.3,
        currentIndex: selected ?? 0,
        onTap: (index) {
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            heart = !heart;
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          heart ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          color: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
