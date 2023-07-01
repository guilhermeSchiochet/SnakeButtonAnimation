import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class SnakeButton extends StatefulWidget {
  final Color color;
  final String text;
  final double borderWidth;
  final VoidCallback? onTap;
  final BlurStyle? styleBorder;
  final Color borderColor;
  final double focusLvL;

  const SnakeButton({
    Key? key,
    required this.color,
    required this.text,
    this.onTap,
    this.styleBorder,
    this.focusLvL = 0.0,
    this.borderWidth = 0.8,
    this.borderColor = Colors.transparent
  }) : super(key: key);

  @override
  createState() => _SnakeButtonState();
}

class _SnakeButtonState extends State<SnakeButton> with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 700
      ),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SnakeButtonPainter(
        borderWidth: widget.borderWidth,
        animation: _controller,
        snackColor: widget.color,
        focusLvL: widget.focusLvL,
        borderColor: widget.borderColor,
        styleBorder: widget.styleBorder,
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _SnakeButtonPainter extends CustomPainter {
  final double focusLvL;
  final Color snackColor;
  final Color borderColor;
  final double borderWidth;
  final Animation animation;
  final BlurStyle? styleBorder;

  _SnakeButtonPainter({
    this.styleBorder,
    this.focusLvL = 0.0,
    this.borderWidth = 4.0,
    required this.animation,
    this.snackColor = Colors.blue,
    this.borderColor = Colors.black,

  }) : super(
    repaint: animation
  );

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    
    final Paint paint = Paint()..color = Colors.transparent;

    paint.color = Colors.black;

    paint.shader = SweepGradient(
      colors: [
        snackColor,
        Colors.transparent,
      ],
      stops: const [
        1.0,
        1.0,
      ],
      startAngle: 0.0,
      endAngle: vector.radians(80),
      transform: GradientRotation(
        vector.radians(360.0 * animation.value)
      )
    ).createShader(rect);

    final path = Path.combine(
      PathOperation.xor,
      Path()..addRect(rect),
      Path()..addRect(rect.deflate(borderWidth)),
    );

    canvas.drawRect(
      rect.deflate(borderWidth / 2),
      Paint()
        ..color = borderColor
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.stroke
        ..maskFilter = MaskFilter.blur(
          styleBorder ?? BlurStyle.outer, focusLvL
        ),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_SnakeButtonPainter oldDelegate) => true;
}