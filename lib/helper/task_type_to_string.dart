import 'package:smtask/shared/task_type.dart';

class TaskTypeToString {

  static String convert({required TaskType task}) {

    final typeToString = {
      TaskType.truckLoaded: 'Truck',
      TaskType.aisleStocked: 'Aisle',
      TaskType.planoCompleted: 'Planogram'
    };

    return typeToString[task]!;

  }

}