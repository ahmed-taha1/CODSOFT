import 'package:get/get.dart';
import 'package:todo_app/data/models/task.dart';

class TaskController extends GetxController {
  final taskList = <Task>[].obs;
  
  void getTasks() {

  }

  Future<int> addTask({required Map<String, dynamic> taskAttr}) async{
    if(taskAttr['title'] == null || taskAttr['title'] == ''){
      return -1;
    }
    Task task = Task.fromMap(taskAttr);
    taskList.add(task);
    return 0;
  }
}
