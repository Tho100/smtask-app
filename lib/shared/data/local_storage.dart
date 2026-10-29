import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:smtask/shared/task_type.dart';

class LocalStorage {

  TaskType type;

  LocalStorage({required this.type});

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/task_data.json');
  }

  Future<File> saveTaskData(Map<String, dynamic> data) async {
    
    final file = await _localFile;
    
    final jsonString = jsonEncode(data); 

    return file.writeAsString(jsonString);

  }

  Future<Map<String, int>?> readTaskData() async {

    try {

      final file = await _localFile;

      if (!await file.exists()) return null;

      final contents = await file.readAsString();

      return jsonDecode(contents) as Map<String, int>;
      
    } catch (e) {
      return null;
    }

  }

  void updateCompletedTask() async {

    
    
  }

}