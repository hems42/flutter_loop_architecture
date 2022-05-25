// ignore_for_file: unused_element, unused_field
part of 'navigation_manager_stock.dart';

PageRouteBuilder createPageRoute(Widget page,
    {RouteSettings? settings,
    Duration? transitonDuration,
    Widget Function(BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child)?
        transitionBuilder}) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: transitonDuration ??= Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          transitionBuilder!
              .call(context, animation, secondaryAnimation, child),
      settings: settings);
}

Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
    getSelectedAnimation(
  NavigationAnimationsEnum selectedAnimation,
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  switch (selectedAnimation) {
    case NavigationAnimationsEnum.SLIDE_UP:
      return upSlideTransition(context, animation, secondaryAnimation, child);
    case NavigationAnimationsEnum.SLIDE_DOWN:
      return downSlideTransition(context, animation, secondaryAnimation, child);
    case NavigationAnimationsEnum.SLIDE_RIGHT:
      return rightSlideTransition(
          context, animation, secondaryAnimation, child);
    case NavigationAnimationsEnum.SLIDE_LEFT:
      return leftSlideTransition(context, animation, secondaryAnimation, child);
    case NavigationAnimationsEnum.SCALE:
      return _createScaleTransition(
          context, animation, secondaryAnimation, child);
    case NavigationAnimationsEnum.FADE:
      return _createFadeTransition(
          context, animation, secondaryAnimation, child);
    default:
      return leftSlideTransition(context, animation, secondaryAnimation, child);
  }
}

Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
    rightSlideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return _createSlideTransition(
      context, animation, secondaryAnimation, child, _Axis.RIGT);
}

Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
    leftSlideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return _createSlideTransition(
      context, animation, secondaryAnimation, child, _Axis.LEFT);
}

Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
    upSlideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return _createSlideTransition(
      context, animation, secondaryAnimation, child, _Axis.UP);
}

Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
    downSlideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return _createSlideTransition(
      context, animation, secondaryAnimation, child, _Axis.DOWN);
}

// base transition methods
Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
    _createSlideTransition(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child, _Axis axis) {
  return (context, animation, secondAnimation, child) {
    return SlideTransition(
        position:
            Tween<Offset>(begin: getdirectedOffset(axis), end: Offset.zero)
                .animate(animation),
        child: child);
  };
}

Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
    _createScaleTransition(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
  return (context, animation, secondAnimation, child) {
    return ScaleTransition(
      alignment: Alignment.center,
      scale: Tween<double>(begin: 0.1, end: 1).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutExpo,
        ),
      ),
      child: child,
    );
  };
}

Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
    _createFadeTransition(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
  return (context, animation, secondAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  };
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
