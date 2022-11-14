import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  BlocProvider({
    super.key,
    required super.child,
    required this.create,
  });

  final Function(BuildContext context) create;

  final Set _instances = {};

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static T of<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BlocProvider>()!
        ._get<T>(context);
  }

  T _get<T>(BuildContext context) {
    if (_instances.whereType<T>().isNotEmpty) {
      return _instances.whereType<T>().first;
    }
    var cubit = create(context);
    _instances.add(cubit);
    return cubit;
  }
}

extension ReadContext on BuildContext {
  T read<T>() {
    return BlocProvider.of<T>(this);
  }
}
