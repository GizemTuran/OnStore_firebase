import 'package:flutter/material.dart';
class SlideRightRoute extends PageRouteBuilder {
  final Widget? page;

  SlideRightRoute(this.page)
      : super(
    pageBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,) =>
    page!,
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}

class SlideRightTransitionBuilder extends PageTransitionsBuilder{
  @override
  Widget buildTransitions<T>(PageRoute<T> route, BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {


    return _SlideRightPageTransition(routeAnimation: animation, child: child);
    }

}
  class _SlideRightPageTransition extends StatelessWidget {
  _SlideRightPageTransition({
  required Animation<double> routeAnimation, // The route's linear 0.0 - 1.0 animation.
  required this.child,
  }) : _positionAnimation = routeAnimation.drive(_bottomUpTween.chain(_fastOutSlowInTween)),
  _opacityAnimation = routeAnimation.drive(_easeInTween);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
  begin: const Offset(1, 0),
  end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween = CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  final Animation<Offset> _positionAnimation;
  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
  return SlideTransition(
  position: _positionAnimation,
  // TODO(ianh): tell the transform to be un-transformed for hit testing
  child: FadeTransition(
  opacity: _opacityAnimation,
  child: child,
  ),
  );
  }
  }