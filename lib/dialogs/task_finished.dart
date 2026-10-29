import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smtask/colors.dart';

class TaskFinished {

  void show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 21),
          backgroundColor: ColorTheme.secondaryGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: Column(
              children: [

                const SizedBox(height: 20),

                Text(
                  'Task Completed',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorTheme.mainOrange,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 40),
                ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, 
                  child: Text(
                    'Continue',
                    style: GoogleFonts.inter(
                      color: ColorTheme.mainOrange,
                      fontWeight: FontWeight.w700,
                      fontSize: 14
                    ),
                  )
                )
              
              ],
            ),
          ),
        );
      },
    );
  }

}