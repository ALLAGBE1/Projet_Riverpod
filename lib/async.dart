import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projet_riverpod/counterNotifier.dart';
import 'package:projet_riverpod/loading.dart';

class NotifierAsync extends AsyncNotifier<int> {
  final MyNotifier _myNotifier;
  final MyNotifier2 _myNotifier2;

  NotifierAsync(this._myNotifier, this._myNotifier2);

  @override
  FutureOr<int> build() async {
    
    await Future.delayed(const Duration(seconds: 45));
    const Loading();
   _myNotifier2;

    
    return 0;
  }

  
}

// final asynProvider = AsyncNotifierProvider<NotifierAsync, int>(NotifierAsync.new);
final asynProvider = AsyncNotifierProvider<NotifierAsync, int>((ref) {
  return NotifierAsync(ref.read(counterNotifierProvider), ref.read(counterNotifierProvider2));
} as NotifierAsync Function());
