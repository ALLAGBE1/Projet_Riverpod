import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projet_riverpod/counterNotifier.dart';

class NotifierAsync extends AsyncNotifier<int> {
  final MyNotifier _myNotifier;
  final MyNotifier2 _myNotifier2;

  NotifierAsync(this._myNotifier, this._myNotifier2);

  @override
  FutureOr<int> build() {
    return 0;
  }

  Future<int> addition() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 45));
    int add = _myNotifier.state + _myNotifier2.state; // Accédez à l'état interne
    state = AsyncValue.data(add);
    return add;
  }
}

// final asynProvider = AsyncNotifierProvider<NotifierAsync, int>(NotifierAsync.new);
final asynProvider = AsyncNotifierProvider<NotifierAsync, int>((ref) {
  return NotifierAsync(ref.read(counterNotifierProvider), ref.read(counterNotifierProvider2));
} as NotifierAsync Function());
