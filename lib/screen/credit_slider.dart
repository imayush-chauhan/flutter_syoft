import 'dart:math';
import 'package:flutter/material.dart';

class CreditSlider extends StatefulWidget {
  final double? height;
  final double? width;
  final double total;
  final double used;
  const CreditSlider({Key? key, this.height, this.width,required this.total,required this.used}) : super(key: key);

  @override
  State<CreditSlider> createState() => _CreditSliderState();
}

class _CreditSliderState extends State<CreditSlider> {

  double value = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    set();
  }

  set(){
    value = (widget.used * 100) / widget.total;
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width * (value/100) - 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    alignment: Alignment.center,
                    child: Text(value.toInt().toString() + "%",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12
                    ),),
                  ),
                  Transform.rotate(
                      child: CustomPaint(
                        painter: TrianglePainter(
                          color: Colors.blue,
                          sideSize: 18,
                        ),
                      ),
                      angle: pi,)
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: value < 75 ?
              MediaQuery.of(context).size.width * (value/100) + 40 :
              MediaQuery.of(context).size.width * (value/100) - 130,
              child: Text("₹${widget.used} used",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),)
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SliderTheme(
                data: SliderThemeData(
                  trackShape: CustomTrackShape()
                ),
                child: Slider(
                  value: value,
                  min: 0,
                  max: 100,
                  onChanged: (_){},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  double sideSize;

  Color color;
  TrianglePainter({required this.sideSize, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    double ySize = sideSize * cos(30 * pi / 180);
    double xSize = sideSize;

    double point0x = xSize / 2;
    double point0y = ySize / 2;

    double point1x = -xSize / 2;
    double point1y = ySize / 2;

    double point2x = 0;
    double point2y = -ySize / 2;

    Path path = Path();
    path.moveTo(point0x, point0y);
    path.lineTo(point1x, point1y);
    path.lineTo(point2x, point2y);
    path.lineTo(point0x, point0y);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = PaintingStyle.fill);

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.sideSize != sideSize;
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

