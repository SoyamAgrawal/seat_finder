import 'package:flutter/material.dart';
import 'searchbar.dart';

class cabinContainer extends StatelessWidget {
  int index;
  cabinContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1,right: 1,top: 4.5,bottom: 4.5),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        // color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      
                      Row(
                        children: [
                          Seat(1 + index * 8, 'LOWER'),
                          Seat(2 + index * 8, 'MIDDLE'),
                          Seat(3 + index * 8, 'UPPER'),
                        ],
                      ),
                      Container(
                        height: 64,
                        width: 184,
                        // color: Colors.black,
                        child: CustomPaint(
                          painter: UpLinePainter(),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      Seat(7 + index * 8, 'SIDE LOWER'),
                      Container(
                        height: 64,
                        width: 62,
                        // color: Colors.black,
                        child: CustomPaint(
                          painter: UpLinePainter(),
                        ),
                      ),
                    ],
                  )
                  
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Stack(
                    children: [
                      
                      Row(
                        children: [
                          Seat(4 + index * 8, 'LOWER'),
                          Seat(5 + index * 8, 'MIDDLE'),
                          Seat(6 + index * 8, 'UPPER'),
                        ],
                      ),
                      Container(
                        height: 64,
                        width: 184,
                        // color: Colors.black,
                        child: CustomPaint(
                          painter: DownLinePainter(),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      Seat(8 + index * 8, 'SIDE LOWER'),
                      Container(
                        height: 64,
                        width: 62,
                        // color: Colors.black,
                        child: CustomPaint(
                          painter: DownLinePainter(),
                        ),
                      ),
                    ],
                  )
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget Seat(int i, String S) {
  return Padding(
    padding: const EdgeInsets.all(1.0),
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: selectedSeat == i ? Colors.blue[900] : Colors.blue[100],
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            i.toString(),
            style: TextStyle(
                fontSize: 18,
                color: selectedSeat == i ? Colors.white : Colors.blue[900],
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            S,
            style: TextStyle(
                fontSize: 8,
                color: selectedSeat == i ? Colors.white : Colors.blue[900],
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

class UpLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth =  7.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.5);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width * 1, 0);
    path_0.lineTo(size.width * 1, size.height * 0.5);

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DownLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.5000000);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.5000000);

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
