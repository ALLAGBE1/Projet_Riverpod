import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNotifier extends StateNotifier<int> {
  MyNotifier() : super(0);

  void increment() {
    state++;
  }
}

final counterNotifierProvider = StateNotifierProvider<MyNotifier, int>((ref) {
  return MyNotifier();
});
