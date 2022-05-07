// ignore_for_file: unused_element, unused_field
part of "navigation_manager_core.dart";


  PageRouteBuilder rightSlideAnimation(Widget page,
      {RouteSettings? settings, Duration? transitonDuration}) {
    return _slideAnimation(page, _Axis.RIGT,
        settings: settings, transitonDuration: transitonDuration);
  }

  PageRouteBuilder leftSlideAnimation(Widget page,
      {RouteSettings? settings, Duration? transitonDuration}) {
    return _slideAnimation(page, _Axis.LEFT,
        settings: settings, transitonDuration: transitonDuration);
  }

  PageRouteBuilder upSlideAnimation(Widget page,
      {RouteSettings? settings, Duration? transitonDuration}) {
    return _slideAnimation(page, _Axis.UP,
        settings: settings, transitonDuration: transitonDuration);
  }

  PageRouteBuilder downSlideAnimation(Widget page,
      {RouteSettings? settings, Duration? transitonDuration}) {
    return _slideAnimation(page, _Axis.DOWN,
        settings: settings, transitonDuration: transitonDuration);
  }

  PageRouteBuilder _slideAnimation(Widget page, _Axis direction,
      {RouteSettings? settings, Duration? transitonDuration}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: transitonDuration ??= Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
                position: Tween<Offset>(
                        begin: getdirectedOffset(direction), end: Offset.zero)
                    .animate(animation),
                child: child),
        settings: settings);
  }

  PageRouteBuilder _createAnimaiton(Widget page,
      {RouteSettings? settings,
      Duration? transitonDuration,
      Widget? transitionBuilder,
      required AnimatedWidget animatedWidget}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: transitonDuration ??= Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            animatedWidget,
        settings: settings);
  }

  Offset getdirectedOffset(_Axis direction) {
    switch (direction) {
      case _Axis.UP:
        return Offset(0, 1);
      case _Axis.DOWN:
        return Offset(0, -1);
      case _Axis.RIGT:
        return Offset(-1, 0);
      case _Axis.LEFT:
        return Offset(1, 0);
    }
  }


enum _Axis { UP, DOWN, RIGT, LEFT }
