import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projet_riverpod/counterNotifier.dart';

class NotifierAsync extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() {
    state = const AsyncLoading();
    return 0;
  }

  Future<void> addition() async {
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(minutes: 5));
      final add = ref.watch(getAdditionProvider);
      return add;
    });
  }
}

final asynProvider = AsyncNotifierProvider<NotifierAsync, int>(NotifierAsync.new);
