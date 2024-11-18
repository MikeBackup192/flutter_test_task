import 'package:flutter/material.dart';

class TimelineWidget extends StatelessWidget {
  final String label; 
  final List<Widget> children; 

  const TimelineWidget({
    Key? key,
    required this.label,
    this.children = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        ..._buildTimelineCards(), 
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          _buildTimelineIndicator(),
          const SizedBox(width: 8),
          _buildRichLabel(label), 
        ],
      ),
    );
  }

  Widget _buildTimelineIndicator() {
    return Container(
      width: 50,
      alignment: Alignment.center,
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 240, 156),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  List<Widget> _buildTimelineCards() {
    return children.map((child) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineLine(), 
          Expanded(child: child), 
        ],
      );
    }).toList();
  }

  Widget _buildTimelineLine() {
    return SizedBox(
      width: 50,
      height: 200, 
      child: CustomPaint(
        painter: DashedLinePainter(),
      ),
    );
  }

  Widget _buildRichLabel(String label) {
    final parts = label.split('/');
    final String firstPart = parts.length > 1 ? parts[0] : '';
    final String secondPart = parts.length > 1 ? parts[1] : parts[0];

    return RichText(
      text: TextSpan(
        style: TextStyle(fontFamily: 'SFProDisplay', color: Colors.black),
        children: [
          TextSpan(
            text: firstPart.isNotEmpty ? '$firstPart / ' : '',
            style: TextStyle(
              fontSize: 16.0, 
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: secondPart,
            style: TextStyle(
              fontSize: 12.0,
              fontFamily: 'SFProDisplay', color: Color.fromARGB(255, 173, 181, 189) 
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashWidth = 5.0; 
    const double dashSpace = 5.0; 
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}