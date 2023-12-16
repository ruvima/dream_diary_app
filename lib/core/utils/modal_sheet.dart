import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class VisorModal {
  static Future<T> show<T>({
    required Widget child,
    bool isFull = false,
  }) async {
    return await Modular.to.push(
      _ModalSheet(
        child: child,
        isFull: isFull,
      ),
    );
  }
}

class _ModalSheet extends ModalRoute {
  _ModalSheet({
    required this.child,
    required this.isFull,
  });
  final bool isFull;
  final Widget child;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black45;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return SlideTransition(
      position: Tween(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
