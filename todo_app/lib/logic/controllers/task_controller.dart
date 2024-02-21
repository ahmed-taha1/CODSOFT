import 'package:get/get.dart';
import 'package:todo_app/data/db/db_helper.dart';
import 'package:todo_app/data/models/task.dart';

class TaskController extends GetxController {
  final taskList = <Task>[].obs;

  Future<void> getTasks() async{
    final List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((e) => Task.fromMap(e)).toList());
  }

  Future<int> addTask({required Map<String, dynamic> taskAttr}) async{
    if(taskAttr['title'] == null || taskAttr['title'] == ''){
      return -1;
    }
    Task task = Task.fromMap(taskAttr);
    taskList.add(task);
    return await DBHelper.insert(task);
  }

  Future<int> deleteTask({required int id}) async{
    taskList.removeWhere((element) => element.id == id);
    return await DBHelper.delete(id);
  }

  Future<void> updateTask({required Task task}) async{
    taskList[taskList.indexWhere((element) => element.id == task.id)] = task;
    await DBHelper.update(task);
  }
}