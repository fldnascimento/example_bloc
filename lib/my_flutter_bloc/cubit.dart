import 'package:flutter/material.dart';

abstract class Cubit<T> extends ValueNotifier<T> {
  Cubit(super.value);

  emit(T state) {
    value = state;
  }

  T get state => value;
}
