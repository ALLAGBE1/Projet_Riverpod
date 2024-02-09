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

final additionNotifierProvider = NotifierProvider<MyNotifier, int>(MyNotifier.new);

final getAdditionProvider = Provider<int>((ref) {
  final counter1 = ref.watch(counterNotifierProvider);
  final counter2 = ref.watch(additionNotifierProvider);
  
  return counter1 + counter2;
});