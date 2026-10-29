import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smtask/colors.dart';
import 'package:smtask/helper/task_type_to_string.dart';
import 'package:smtask/pages/task_completed.dart';
import 'package:smtask/shared/task_type.dart';

class TaskOptions {
  
  Widget _buildOption({
    required BuildContext context, 
    required TaskType option, 
    required IconData icon
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Ink(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: ColorTheme.secondaryGray, 
            border: Border.all(
              color: ColorTheme.thirdWhite,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TaskCompleted(type: option))),
            borderRadius: BorderRadius.circular(25), 
            child: Center( 
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: ColorTheme.mainOrange,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        Text(
          TaskTypeToString.convert(task: option),
          style: GoogleFonts.inter(
            color: ColorTheme.secondaryWhite,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),

      ],
    );
  }

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 21),
          backgroundColor: ColorTheme.secondaryGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              children: [

                const SizedBox(height: 20),

                Text(
                  'Pick Task',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    _buildOption(context: context, option: TaskType.truckLoaded, icon: Icons.local_shipping),

                    const SizedBox(width: 18),

                    _buildOption(context: context, option: TaskType.aisleStocked, icon: Icons.shelves),

                    const SizedBox(width: 18),

                    _buildOption(context: context, option: TaskType.planoCompleted, icon: Icons.grid_on),

                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}