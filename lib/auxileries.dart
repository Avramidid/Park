import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(mainAxisAlignment: MainAxisAlignment.start, 
        children:[
       Container(
        width: MediaQuery.of(context).size.width * 0.05,
        height: double.infinity,
        child:   
      ListView(children: [
        CarouselSlider(
          items: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: 100,
                    //margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      '$i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 50.0,
            enlargeCenterPage: true,
            autoPlay: false,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            viewportFraction: 0.8,
            scrollDirection: Axis.vertical,
          ),
        ),
      ])),
Container(
        width: MediaQuery.of(context).size.width * 0.05,
        height: double.infinity,
        child:   
      ListView(children: [
        CarouselSlider(
          items: [00, 05, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: 100,
                    //margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      '$i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 50.0,
            enlargeCenterPage: true,
            autoPlay: false,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            viewportFraction: 0.8,
            scrollDirection: Axis.vertical,
          ),
        ),
      ]))
    ]
    ));
  }
}
