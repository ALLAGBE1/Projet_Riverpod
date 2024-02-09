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

  Future<int> addition(myNotifier, myNotifier2) async {
    await Future.delayed(const Duration(seconds: 45));
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      int add = myNotifier + myNotifier2;
      return add;
    });
  }
}

// final asynProvider = AsyncNotifierProvider<NotifierAsync, int>(NotifierAsync.new);
final asynProvider = AsyncNotifierProvider<NotifierAsync, int>((ref) {
  return NotifierAsync(ref.read(counterNotifierProvider), ref.read(counterNotifierProvider2));
} as NotifierAsync Function());
