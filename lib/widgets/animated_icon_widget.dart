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
        var icon = Image.asset(
          // _getWeatherIcon(),
          widget.condition.toLowerCase().contains('sunny')
              ? "assets/gif/icons8-sunrise.gif"
              : widget.condition.toLowerCase().contains('rainy')
                  ? "assets/gif/icons8-rain.gif"
                  : widget.condition.toLowerCase().contains('cloudy')
                      ? "assets/gif/icons8-partly-cloudy-day.gif"
                      : "assets/gif/icons8-windy-weather.gif",

          height: 50,
          // color: Colors.white,
        );
        return Transform.rotate(
          angle: _controller.value * 2 * 3.14,
          child: icon,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
