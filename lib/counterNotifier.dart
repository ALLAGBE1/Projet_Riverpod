import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNotifier extends Notifier<int> {
  var _counter;

  @override
  // FutureOr<int> build() {
  //   return ;
  // }
  int build() => 0;

  void increment() => _counter++;
}

final counterNotifierProvider = NotifierProvider<MyNotifier, int>(MyNotifier.new);
