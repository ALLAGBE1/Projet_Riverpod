import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:projet_riverpod/async.dart';
import 'package:projet_riverpod/counterNotifier.dart';
import 'package:projet_riverpod/loading.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Minus:',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(counterNotifierProvider.notifier).increment();
                    },
                    child: const Text("Boutton plus")),
                Consumer(
                  builder: (context, ref, _) {
                    final minus = ref.watch(counterNotifierProvider);
                    return Text(
                      '$minus',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(counterNotifierProvider.notifier).decrement();
                    },
                    child: const Text("Boutton moin")),
              ],
            ),
            const Gap(20),
            const Text(
              'Addition:',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(additionNotifierProvider.notifier).increment();
                    },
                    child: const Text("Boutton plus")),
                Consumer(
                  builder: (context, ref, _) {
                    final addition = ref.watch(additionNotifierProvider);
                    return Text(
                      '$addition',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(additionNotifierProvider.notifier).decrement();
                    },
                    child: const Text("Boutton moin")),
              ],
            ),
            const Gap(20),
            const Text(
              'Opération de Minus & Addition:',
            ),
            Consumer(builder: (context, ref, _) {
              final add = ref.watch(getAdditionProvider);
              return Text("$add");
            }),
            const Gap(20),
            const Text(
              'Async :',
            ),
            Consumer(builder: (context, ref, _) {
              return ref.watch(asynProvider).when(
                  data: (data) {
                    final add1 = ref.watch(getAdditionProvider);
                    return Text('$add1');
                  },
                  error: (error, StackTrace) => const Text("C'est une erreur"),
                  loading: () => const Loading());
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterNotifierProvider.notifier).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
