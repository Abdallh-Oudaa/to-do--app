import 'package:flutter/material.dart';
import 'package:to_do_app/presentation/screens/settings_tap.dart';

import 'package:to_do_app/presentation/screens/task_list_tap.dart';
import 'package:to_do_app/presentation/widgets/bottom_sheet_widget.dart';

class ToDoHomeScreen extends StatefulWidget {
  static String routName = "homeScreen";

  const ToDoHomeScreen({super.key});

  @override
  State<ToDoHomeScreen> createState() => _ToDoHomeScreenState();
}

class _ToDoHomeScreenState extends State<ToDoHomeScreen> {
  int? clickIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
            currentIndex: clickIndex ?? 0,
            onTap: (index) {
              clickIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    size: 21,
                    weight: 22,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 21,
                    weight: 22,
                  ),
                  label: ""),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addTaskShowBottomSheet();
            setState(() {});
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: taps[clickIndex ?? 0],
    );
  }

  List<Widget> taps = [
    const TaskListTap(),
    const SettingsTap(),
  ];
  Future addTaskShowBottomSheet() {
    return showModalBottomSheet(
        context: (context), builder: ((context) =>  BottomSheetWidget()));
  }
}
