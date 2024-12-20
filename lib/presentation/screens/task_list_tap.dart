import 'package:flutter/material.dart';
import 'package:to_do_app/presentation/widgets/calender.dart';
import 'package:to_do_app/presentation/widgets/task_itme.dart';

class TaskListTap extends StatelessWidget {
  const TaskListTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Calender(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => const TaskItem(),
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
