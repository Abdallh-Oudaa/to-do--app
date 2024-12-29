import 'package:flutter/cupertino.dart';
import 'package:to_do_app/data-layer/firebase/task-dao.dart';

import '../data-layer/model/Task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task>? tasks;
  getAllTasks()async{
   tasks=await TaskDao.getTasksFromFireStore();
   notifyListeners();
  }
}