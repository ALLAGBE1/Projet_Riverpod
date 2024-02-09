import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

final counterNotifierProvider = NotifierProvider<MyNotifier, int>(MyNotifier.new);
