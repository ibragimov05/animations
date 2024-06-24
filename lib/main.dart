import 'package:animations_hw/controller/switch_controller.dart';
import 'package:animations_hw/notifier/switch_notifier.dart';
import 'package:flutter/material.dart';
import 'package:animations_hw/views/screens/first_task/first_task.dart';
import 'package:animations_hw/views/screens/second_task/second_task.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  final List<Widget> _screens = const [
    FirstTask(),
    SecondTask(),
  ];

  @override
  Widget build(BuildContext context) {
    return SwitchNotifier(
      switchController: SwitchController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.amber,
            centerTitle: false,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: PageView(
          physics: const ClampingScrollPhysics(),
          children: _screens,
        ),
      ),
    );
  }
}
