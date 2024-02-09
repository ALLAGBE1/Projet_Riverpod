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
    // Initialisation asynchrone si nécessaire
    // Par exemple, vous pourriez attendre une opération de chargement de données
    // return await _loadData();
    await Future.delayed(const Duration(seconds: 45));
    const Loading();
   _myNotifier2;

    // Sinon, vous pouvez simplement retourner une valeur initiale
    return 0;
  }

  // Ajoutez vos méthodes pour interagir avec les notifiants
}

// final asynProvider = AsyncNotifierProvider<NotifierAsync, int>(NotifierAsync.new);
final asynProvider = AsyncNotifierProvider<NotifierAsync, int>((ref) {
  return NotifierAsync(ref.read(counterNotifierProvider), ref.read(counterNotifierProvider2));
} as NotifierAsync Function());
