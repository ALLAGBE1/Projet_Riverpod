import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projet_riverpod/counterNotifier.dart';

class NotifierAsync extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() {
    return 0;
  }

  void loading() {
    state = const AsyncLoading();
    Future.delayed(const Duration(seconds: 3));
  }

  Future<void> addition() async {
    state = const AsyncLoading();
    final add = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 3));
      return ref.watch(getAdditionProvider);
    });
    state = add;
  }
}

final asynProvider = AsyncNotifierProvider<NotifierAsync, int>(NotifierAsync.new);



final activityProvider = FutureProvider.autoDispose((ref) async {

  final add = await AsyncValue.guard(() async {
    await Future.delayed(const Duration(seconds: 3));
    return ref.watch(getAdditionProvider);
  });
  return add;
});
