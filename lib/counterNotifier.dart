import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNotifier extends Notifier<int> {
  int _counter = 0;

  @override
  int build() => 0;

  void increment() => _counter++;
}

final counterNotifierProvider = NotifierProvider<MyNotifier, int>(MyNotifier.new);
