import 'package:flutter/material.dart';

class AnimatedWeatherIcon extends StatefulWidget {
  final String condition;

  const AnimatedWeatherIcon({Key? key, required this.condition})
      : super(key: key);

  @override
  _AnimatedWeatherIconState createState() => _AnimatedWeatherIconState();
}

class _AnimatedWeatherIconState extends State<AnimatedWeatherIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        var icon = Icon(
          // _getWeatherIcon(),
          widget.condition.toLowerCase().contains('sunny')
              ? Icons.wb_sunny
              : widget.condition.toLowerCase().contains('rainy')
                  ? Icons.water_drop
                  : widget.condition.toLowerCase().contains('cloudy')
                      ? Icons.cloud
                      : Icons.wb_sunny,

          size: 50,
          color: Colors.white,
        );
        return Transform.rotate(
          angle: _controller.value * 2 * 3.14,
          child: icon,
        );
      },
    );
  }

  IconData _getWeatherIcon() {
    switch (widget.condition.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny;
      case 'rainy':
        return Icons.water_drop;
      case 'cloudy':
        return Icons.cloud;
      default:
        return Icons.wb_sunny;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
