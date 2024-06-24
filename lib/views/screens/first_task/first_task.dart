import 'package:animations_hw/controller/switch_controller.dart';
import 'package:animations_hw/notifier/switch_notifier.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FirstTask extends StatefulWidget {
  const FirstTask({super.key});

  @override
  State<FirstTask> createState() => _FirstTaskState();
}

class _FirstTaskState extends State<FirstTask> {
  @override
  Widget build(BuildContext context) {
    final SwitchController switchController = SwitchNotifier.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
      appBar: AppBar(title: const Text('First task')),
      body: ListenableBuilder(
        listenable: switchController,
        builder: (BuildContext context, Widget? child) {
          return Center(
            child: GestureDetector(
              onTap: () => switchController.toggleSwitch(),
              child: Container(
                width: 180,
                height: 90,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: switchController.switchValue
                      ? Colors.blue.withOpacity(0.1)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Stack(
                  alignment: switchController.switchValue
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  children: [
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      crossFadeState: switchController.switchValue
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Lottie.asset('assets/lottie/cloud.json'),
                      secondChild: Lottie.asset('assets/lottie/road.json'),
                    ),
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      alignment: switchController.switchValue
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        height: 90,
                        width: 90,
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: AnimatedCrossFade(
                          duration: const Duration(milliseconds: 500),
                          crossFadeState: switchController.switchValue
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          firstChild:
                              Image.asset('assets/images/airplane-blue.png'),
                          secondChild:
                              Image.asset('assets/images/airplane-grey.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
