import 'dart:math';

import 'package:flutter/material.dart';

class ImageCircle extends StatefulWidget {
  const ImageCircle({Key? key}) : super(key: key);

  @override
  State<ImageCircle> createState() => _ImageCircleState();
}

class _ImageCircleState extends State<ImageCircle> with SingleTickerProviderStateMixin{

  double _angle = 0;
  double _angle2 = 0;
  // Color main = Colors.pink;
  final Duration _duration = const Duration(milliseconds: 2000);
  final Duration _duration2 = const Duration(milliseconds: 2500);
  final Duration _duration3 = const Duration(milliseconds: 3000);
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );
    super.initState();
  }

  int inx = 0;

  List<String> main = [
    "assets/images/image_1.jpeg",
    "assets/images/image_2.jpeg",
    "assets/images/image_3.jpeg",
    "assets/images/image_4.jpeg",
    "assets/images/image_5.jpeg",
  ];

  void _onPressed() {
    print("in");
    setState(() {
      _controller.reset();
      _controller.forward();
      _angle = _angle2;
      _angle2 = _angle + (2*pi);
    });
    Future.delayed(const Duration(milliseconds: 1000),(){
      setState(() {
        if(inx < main.length-1){
          inx = inx + 1;
        }else{
          inx = 0;
        }

      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100,),
            Stack(
              alignment: Alignment.center,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: _angle, end: _angle2),
                  duration: _duration2,
                  curve: Curves.fastOutSlowIn,
                  builder: (BuildContext context, double angle, Widget? child) {
                    return Transform.rotate(
                      angle: angle,
                      child: Image.asset(main[inx],fit: BoxFit.cover,width: 350,height: 350,),
                    );
                  },
                ),
                // TweenAnimationBuilder(
                //   tween: Tween<double>(begin: _angle, end: _angle2),
                //   duration: _duration2,
                //   curve: Curves.fastOutSlowIn,
                //   builder: (BuildContext context, double angle, Widget? child) {
                //     return Transform.rotate(
                //       angle: angle,
                //       child: Stack(
                //           alignment:Alignment.center,
                //           children: [
                //             const SizedBox(height: 600,width: 600,),
                //             ClipRRect(
                //                 borderRadius: BorderRadius.circular(250),
                //                 child: Image.asset(main[inx],fit: BoxFit.cover,width: 400,height: 400,))]),
                //     );
                //   },
                // ),
                // TweenAnimationBuilder(
                //     tween: Tween<double>(begin: _angle, end: _angle2),
                //     duration: _duration,
                //     curve: Curves.easeInOut,
                //   builder: (BuildContext context, double angle, Widget? child) {
                //     return Transform.rotate(
                //       angle: angle,
                //       child: Stack(
                //           alignment:Alignment.center,
                //           children: [
                //             const SizedBox(height: 500,width: 500,),
                //             ClipRRect(
                //               borderRadius: BorderRadius.circular(200),
                //                 child: Image.asset(main[inx],fit: BoxFit.cover,width: 300,height: 300,))]),
                //     );
                //   },
                // ),
              ],
            ),

            ElevatedButton(
              onPressed: _onPressed,
              child: Text('Rotate'),
            ),
            // Transform.rotate(
            //   angle: 0,
            //   child: Container(
            //     height: 400,
            //     width: 400,
            //     decoration: const BoxDecoration(
            //         color: Colors.pink,
            //         shape: BoxShape.circle
            //     ),
            //     child: SvgPicture.asset("assets/images/choose.svg"),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
