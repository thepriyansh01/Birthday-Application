import 'package:get/get.dart';
import 'package:myapp/database/db_helper.dart';
import 'package:myapp/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addTask({TaskToDo? task}) async {
    return await DBHelper.insert(task);
  }
}
