import 'package:flutter/material.dart';
import 'dart:math' as math;

class TasteHexagonChart extends StatelessWidget {
  final double tasteSweet;      // 단맛
  final double tasteSalty;      // 짠맛
  final double tasteSour;       // 신맛
  final double tasteBitter;     // 쓴맛
  final double tasteSpicy;      // 매운 정도
  final double tasteGreasy;     // 느끼한 정도

  const TasteHexagonChart({
    super.key,
    required this.tasteSweet,
    required this.tasteSalty,
    required this.tasteSour,
    required this.tasteBitter,
    required this.tasteSpicy,
    required this.tasteGreasy,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaleX = screenWidth / 375;
    
    final size = 298.0 * scaleX;
    final center = size / 2;
    final radius = size / 2 - 20 * scaleX; // 여백을 위한 조정

    // 6각형 꼭짓점 위치 계산 (위에서 시계방향)
    // 0: 단맛 (위)
    // 1: 짠맛 (오른쪽 위)
    // 2: 신맛 (오른쪽 아래)
    // 3: 쓴맛 (아래)
    // 4: 매운맛 (왼쪽 아래)
    // 5: 느끼한맛 (왼쪽 위)
    final List<Offset> basePoints = List.generate(6, (index) {
      final angle = (math.pi / 2) + (index * 2 * math.pi / 6);
      return Offset(
        center + radius * math.cos(angle),
        center + radius * math.sin(angle),
      );
    });

    // 값에 따라 점 위치 계산 (0.0 ~ 1.0)
    final values = [
      tasteSweet,
      tasteSalty,
      tasteSour,
      tasteBitter,
      tasteSpicy,
      tasteGreasy,
    ];

    final List<Offset> valuePoints = List.generate(6, (index) {
      final angle = (math.pi / 2) + (index * 2 * math.pi / 6);
      final value = values[index];
      final valueRadius = radius * value;
      return Offset(
        center + valueRadius * math.cos(angle),
        center + valueRadius * math.sin(angle),
      );
    });

    // 레이블 위치
    final labelPositions = [
      Offset(center, 10 * scaleX), // 단맛 (위)
      Offset(center + radius * 0.85, center - radius * 0.5), // 짠맛 (오른쪽 위)
      Offset(center + radius * 0.85, center + radius * 0.5), // 신맛 (오른쪽 아래)
      Offset(center, size - 10 * scaleX), // 쓴맛 (아래)
      Offset(center - radius * 0.85, center + radius * 0.5), // 매운맛 (왼쪽 아래)
      Offset(center - radius * 0.85, center - radius * 0.5), // 느끼한맛 (왼쪽 위)
    ];

    final labels = ['단맛', '짠맛', '신맛', '쓴맛', '매운맛', '느끼한맛'];

    return CustomPaint(
      size: Size(size, size),
      painter: _HexagonPainter(
        basePoints: basePoints,
        valuePoints: valuePoints,
        labelPositions: labelPositions,
        labels: labels,
        scaleX: scaleX,
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  final List<Offset> basePoints;
  final List<Offset> valuePoints;
  final List<Offset> labelPositions;
  final List<String> labels;
  final double scaleX;

  _HexagonPainter({
    required this.basePoints,
    required this.valuePoints,
    required this.labelPositions,
    required this.labels,
    required this.scaleX,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 배경 그리드 (5단계)
    final gridPaint = Paint()
      ..color = const Color(0xFFE8E9F1)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    for (int i = 1; i <= 5; i++) {
      final gridRadius = (size.width / 2 - 20 * scaleX) * (i / 5);
      final gridPath = Path();
      for (int j = 0; j < 6; j++) {
        final angle = (math.pi / 2) + (j * 2 * math.pi / 6);
        final point = Offset(
          size.width / 2 + gridRadius * math.cos(angle),
          size.height / 2 + gridRadius * math.sin(angle),
        );
        if (j == 0) {
          gridPath.moveTo(point.dx, point.dy);
        } else {
          gridPath.lineTo(point.dx, point.dy);
        }
      }
      gridPath.close();
      canvas.drawPath(gridPath, gridPaint);
    }

    // 중심에서 각 꼭짓점으로 선 그리기
    final center = Offset(size.width / 2, size.height / 2);
    for (final point in basePoints) {
      canvas.drawLine(center, point, gridPaint);
    }

    // 값에 따른 6각형 그리기
    final valuePaint = Paint()
      ..color = const Color(0xFFE86339).withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final valuePath = Path();
    for (int i = 0; i < valuePoints.length; i++) {
      if (i == 0) {
        valuePath.moveTo(valuePoints[i].dx, valuePoints[i].dy);
      } else {
        valuePath.lineTo(valuePoints[i].dx, valuePoints[i].dy);
      }
    }
    valuePath.close();
    canvas.drawPath(valuePath, valuePaint);

    // 값에 따른 6각형 테두리
    final borderPaint = Paint()
      ..color = const Color(0xFFE86339)
      ..strokeWidth = 2 * scaleX
      ..style = PaintingStyle.stroke;
    canvas.drawPath(valuePath, borderPaint);

    // 각 꼭짓점에 점 그리기
    final dotPaint = Paint()
      ..color = const Color(0xFFE86339)
      ..style = PaintingStyle.fill;

    for (final point in valuePoints) {
      canvas.drawCircle(point, 3.5 * scaleX, dotPaint);
    }

    // 레이블 그리기
    final textStyle = TextStyle(
      fontSize: 9 * scaleX,
      color: const Color(0xFF1F2024),
      fontWeight: FontWeight.w400,
    );

    for (int i = 0; i < labels.length; i++) {
      final textSpan = TextSpan(
        text: labels[i],
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          labelPositions[i].dx - textPainter.width / 2,
          labelPositions[i].dy - textPainter.height / 2,
        ),
      );
    }

    // 값 표시 (20, 40, 60, 80, 100)
    final valueLabels = ['20', '40', '60', '80', '100'];
    final valueTextStyle = TextStyle(
      fontSize: 8.94 * scaleX,
      color: const Color(0xFF1F2024),
      fontWeight: FontWeight.w400,
    );

    for (int i = 1; i <= 5; i++) {
      final valueRadius = (size.width / 2 - 20 * scaleX) * (i / 5);
      final valueTextSpan = TextSpan(
        text: valueLabels[i - 1],
        style: valueTextStyle,
      );
      final valueTextPainter = TextPainter(
        text: valueTextSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      valueTextPainter.layout();
      // 위쪽에 값 표시
      valueTextPainter.paint(
        canvas,
        Offset(
          center.dx - valueTextPainter.width / 2,
          center.dy - valueRadius - valueTextPainter.height - 2 * scaleX,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

