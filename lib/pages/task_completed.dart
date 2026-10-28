import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smtask/colors.dart';
import 'package:smtask/shared/task_type.dart';

class TaskCompleted extends StatefulWidget {

  TaskType type;

  TaskCompleted({super.key, required this.type});

  @override
  State<TaskCompleted> createState() => _TaskCompletedState();

}

class _TaskCompletedState extends State<TaskCompleted> {

  final _totalTaskCompletedController = TextEditingController();

  String _taskTypeString() {
    
    switch (widget.type) {
      case TaskType.truckLoaded:
        return 'Truck Loaded';
      case TaskType.aisleStocked:
        return 'Aisle Stocked';
      case TaskType.planoCompleted:
        return 'Planograms';
    }

  }

  @override
  void dispose() {
    _totalTaskCompletedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10, left: 16, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              _taskTypeString(),
              style: GoogleFonts.inter(
                color: ColorTheme.mainOrange,
                fontWeight: FontWeight.w900,
                fontSize: 27
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'How many of this task have you completed?',
              style: GoogleFonts.inter(
                color: ColorTheme.secondaryWhite,
                fontWeight: FontWeight.w700,
                fontSize: 14
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _totalTaskCompletedController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: '0',
                hintStyle: GoogleFonts.inter(
                  color: ColorTheme.secondaryWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 24
                ),
                floatingLabelStyle: const TextStyle(color: Colors.white), 
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.5, 
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),
            ),
            
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                  ),
                  backgroundColor: ColorTheme.mainOrange,
                ),
                onPressed: () => print("HI"), 
                child: Text(
                  'Done',
                  style: GoogleFonts.inter(
                    color: ColorTheme.bgBlack,
                    fontWeight: FontWeight.w800,
                    fontSize: 16
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

}