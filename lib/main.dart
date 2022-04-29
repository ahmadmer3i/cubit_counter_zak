import 'package:cubit_counter_app/another_screen.dart';
import 'package:cubit_counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (context.read<CounterCubit>().state.counter == 3) {
    //   // Solution 1: best one
    //   WidgetsBinding.instance!.addPostFrameCallback((_) {
    //     Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => const AnotherScreen()));
    //   });
    // // Solution 2:
    // Future.delayed(const Duration(seconds: 0), () {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => const AnotherScreen()));
    // });
    // Solution 3:
    // Future.microtask(
    //   () => Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const AnotherScreen(),
    //     ),
    //   ),
    // );
    // }
    // if (context.read<CounterCubit>().state.counter == -1) {
    //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         content:
    //             Text('counter: ${context.read<CounterCubit>().state.counter}'),
    //       ),
    //     );
    //   });
    // }
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state.counter == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AnotherScreen()));
        }
        if (state.counter == -1) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text('counter: ${state.counter}'),
            ),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Text(
            '${context.watch<CounterCubit>().state.counter}',
            style: const TextStyle(fontSize: 48),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: const Icon(Icons.add),
              heroTag: 'increment',
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).decrement();
              },
              child: const Icon(Icons.remove),
              heroTag: 'decrement',
            ),
          ],
        ),
      ),
    );
  }
}
