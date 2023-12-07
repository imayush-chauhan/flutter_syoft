import 'package:flutter/material.dart';


class Rotate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RotateState();
}

class RotateState extends State<Rotate> {

  List color = [
    Colors.blue,
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.yellow
  ];

  double turn = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: -MediaQuery.of(context).size.height*1.3,
            child: AnimatedRotation(
              turns: turn,
              duration: Duration(milliseconds: 1500),
              child: Container(
                height: MediaQuery.of(context).size.height*2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.8,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.8,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          setState(() {
            turn = turn - 0.5;
          });
          print(turn);
        },
        child: Container(
          height: 50,
          color: Colors.purple,
        ),
      ),
    );
  }
}