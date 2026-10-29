import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:smtask/helper/task_type_to_string.dart';
import 'package:smtask/shared/task_type.dart';
// TODO: REname to TaskLocalStorage
class LocalStorage {

  final _defaultData = {
    'truck': 0,
    'aisle': 0,
    'plano': 0,
  };

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/task_data.json');
  }

  Future<void> saveTaskData({required Map<String, int> data}) async {
    
    final file = await _localFile;

    final jsonString = jsonEncode(data);

    await file.writeAsString(jsonString);

  }

  Future<Map<String, int>> readTaskData() async {

    try {

      final file = await _localFile;

      if (!await file.exists()) {
        return _defaultData;
      }

      final contents = await file.readAsString();

      final decodedMap = jsonDecode(contents);

      return Map<String, int>.from(decodedMap);

    } catch (e) {
      return _defaultData;
    }

  }

  void updateCompletedTask({
    required TaskType type, 
    required int totalCompletedTask
  }) async {

    final typeString = TaskTypeToString.convert(task: type);

    final currentData = await readTaskData();

    currentData[typeString] = totalCompletedTask;

    await saveTaskData(data: currentData);

  }

}