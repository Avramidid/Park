import 'package:flutter/material.dart';



class ImageWithText extends StatelessWidget {
  final String Number;
  final String Date;
  final String Name;
  ImageWithText({required this.Number, required this.Date, required this.Name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: <Widget> [
          Container(
                      height: MediaQuery.of(context).size.height*0.3,
          width: double.infinity,
          child:
          Image.asset(
            'asset/images/credit_template.png',
            fit: BoxFit.cover,
          )),
          Container(
          height: MediaQuery.of(context).size.height*0.3,
          width: double.infinity,
          child:
          Container(
            alignment: Alignment(0, 0.4),
            child: Text(
              Number,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                letterSpacing: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          )),
          Container(
          height: MediaQuery.of(context).size.height*0.3,
          width: double.infinity,
          child:
                    Container(
            alignment: Alignment(0, 0.6),
            child: Text(
              Date,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                letterSpacing: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          )),
          Container(
          height: MediaQuery.of(context).size.height*0.3,
          width: double.infinity,
          child:
                    Container(
            alignment: Alignment(0, 0.8),
            child: Text(
              Name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                letterSpacing: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          ))
        ],
      ),
    );
  }
}
