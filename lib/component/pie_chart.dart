import 'package:flutter/material.dart';

class PieChartProgress extends StatelessWidget {
  final dynamic completedPercentage;

  const PieChartProgress({
    super.key,
    required this.completedPercentage, // Percentage of completed pie slice
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: PieChartPainter(completedPercentage: 60), // Pass completed percentage
        child: Center(
          child: Text(
            "$completedPercentage%",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final double completedPercentage;

  PieChartPainter({required this.completedPercentage});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint completedPaint = Paint()
      ..color = Color.fromRGBO(255, 143, 162, 1)
      ..style = PaintingStyle.fill;

    final Paint remainingPaint = Paint()
      ..color = Color.fromRGBO(255, 179, 192, 1)
      ..style = PaintingStyle.fill;

    double completedAngle = (completedPercentage / 100) * 360;
    double remainingAngle = 360 - completedAngle;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Draw completed portion
    canvas.drawArc(
      rect,
      -90 * 3.14159265359 / 180, // Start from top
      completedAngle * 3.14159265359 / 180,
      true,
      completedPaint,
    );

    // Draw remaining portion
    canvas.drawArc(
      rect,
      (completedAngle - 90) * 3.14159265359 / 180,
      remainingAngle * 3.14159265359 / 180,
      true,
      remainingPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
