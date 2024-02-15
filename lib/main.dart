// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gap/gap.dart';
// import 'package:projet_riverpod/async.dart';
// import 'package:projet_riverpod/counterNotifier.dart';
// import 'package:projet_riverpod/loading.dart';

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends ConsumerStatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends ConsumerState<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     // ref.read(asynProvider.notifier).loading();
//     const Loading();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ref.listen(asynProvider, ((previous, next) {
//       if (!next.hasError) {
//         const Loading();
//       }
//     }));

//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Minus:',
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       ref.read(counterNotifierProvider.notifier).increment();
//                     },
//                     child: const Text("Boutton plus")),
//                 Text(
//                   '${ref.watch(counterNotifierProvider)}',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//                 ElevatedButton(
//                     onPressed: () {
//                       ref.read(counterNotifierProvider.notifier).decrement();
//                     },
//                     child: const Text("Boutton moin")),
//               ],
//             ),
//             const Gap(20),
//             const Text(
//               'Addition:',
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       ref.read(additionNotifierProvider.notifier).increment();
//                     },
//                     child: const Text("Boutton plus")),
//                 Text(
//                   '${ref.watch(additionNotifierProvider)}',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//                 ElevatedButton(
//                     onPressed: () {
//                       ref.read(additionNotifierProvider.notifier).decrement();
//                     },
//                     child: const Text("Boutton moin")),
//               ],
//             ),
//             const Gap(20),
//             const Text(
//               'Opération de Minus & Addition:',
//             ),
//             Text('${ref.watch(getAdditionProvider)}'),
//             const Gap(20),
//             const Text(
//               'Async :',
//             ),
//             ref.watch(asynProvider).when(
//                 data: (data) {
//                   return Text('$data');
//                 },
//                 error: (error, stackTrace) => const Text("C'est une erreur"),
//                 loading: () => const Loading()),
//             ElevatedButton(
//                 onPressed: () {
//                   ref.read(asynProvider.notifier).addition();
//                 },
//                 child: const Text("Result"))
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           ref.read(counterNotifierProvider.notifier).increment();
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

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
    // ref.listen(asynProvider, ((previous, next) {
    //   if (!next.hasError) {
    //     const Loading();
    //   }
    // }));

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
                Text(
                  '${ref.watch(counterNotifierProvider)}',
                  style: Theme.of(context).textTheme.headlineMedium,
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
                Text(
                  '${ref.watch(additionNotifierProvider)}',
                  style: Theme.of(context).textTheme.headlineMedium,
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
            Text('${ref.watch(getAdditionProvider)}'),
            const Gap(20),
            const Text(
              'Async :',
            ),
            ref.watch(activityProvider).when(
                data: (data) {
                  return Text('$data');
                },
                error: (error, stackTrace) => const Text("C'est une erreur"),
                loading: () => const Loading()),
            // Consumer(builder: (_, ref, __) {
            //   final tres = ref.watch(activityProvider);
            //   return switch (tres) {
            //     AsyncData(:final value) => Text('$value'),
            //     AsyncError() => const Text('Oops, something unexpected happened'),
            //     _ => const CircularProgressIndicator(),
            //   };
            // }),

            ElevatedButton(
                onPressed: () {
                  ref.read(asynProvider.notifier).addition();
                },
                child: const Text("Result")),
            Column(
              children: [
                const Text("Family : "),
                Text('${ref.watch(numberProviderFamily(10))}'),
                const Gap(5),
                Text('${ref.watch(numberProviderFamily(100))}'),
                const Gap(5),
                Text('${ref.watch(numberProviderFamily(1000))}'),
              ],
            )
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
