import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:get/get.dart';

class DataCourseScreen extends StatelessWidget {
  const DataCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset("assets/images/ahmed_mousa.jpg"),
          ),
          buttonArrow(context),
          scroll(),
        ],
      ),
    ));
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(25),
                  topRight: const Radius.circular(25)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Course name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "DR . name",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "About this course",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Your recipe has been uploaded, you can see it on your profile. ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      print("Enter");
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.all(20),
                      width: 300,
                      height: 48,
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient:
                            LinearGradient(colors: [Colors.red, Colors.blue]),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Enter Course",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
