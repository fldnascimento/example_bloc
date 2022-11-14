import 'package:example_bloc/my_flutter_bloc/bloc_provider.dart';
import 'package:example_bloc/my_flutter_bloc/cubit.dart';
import 'package:flutter/material.dart';

typedef BlocWidgetBuilder<S> = Widget Function(BuildContext context, S state);

class BlocBuilder<B extends Cubit<S>, S> extends StatelessWidget {
  final BlocWidgetBuilder<S> builder;

  const BlocBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<S>(
      valueListenable: context.read<B>(),
      builder: (context, value, child) => builder(context, value),
    );
  }
}