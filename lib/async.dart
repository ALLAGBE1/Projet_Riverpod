import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projet_riverpod/counterNotifier.dart';

class NotifierAsync extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() async {
    await Future.delayed(const Duration(seconds: 5));
    return 0;
  }

  Future<void> addition() async {
    state = const AsyncLoading();
    final add = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 3));
      return ref.read(getAdditionProvider);
    });
    state = add;
  }
}

final asynProvider = AsyncNotifierProvider<NotifierAsync, int>(NotifierAsync.new);

final activityProvider = FutureProvider.autoDispose<int>((ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return ref.watch(getAdditionProvider);
  // return;
});

// final familyProvider = Provider.family<NotifierAsync, int>((ref, n) {
//   return null;
// });