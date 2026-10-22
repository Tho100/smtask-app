import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smtask/colors.dart';
import 'package:smtask/pages/home.dart';
import 'package:smtask/pages/insights.dart';

class MainNavigationBar {

  int currentIndex = 0;

  MainNavigationBar({required this.currentIndex});

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      iconSize: 25,
      backgroundColor: Colors.black,
      selectedItemColor: ColorTheme.mainOrange,
      unselectedItemColor: ColorTheme.secondaryGray,
      unselectedLabelStyle: GoogleFonts.inter(
        color: ColorTheme.secondaryWhite,
        fontSize: 10,
        fontWeight: FontWeight.w700
      ),  
      selectedLabelStyle: GoogleFonts.inter(
        color: ColorTheme.mainOrange,
        fontSize: 10,
        fontWeight: FontWeight.w700
      ),  
      onTap: (index) {

        if (index == 0) {
          Navigator.pushReplacement(
            context, 
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const HomePage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
            )
          );
        }

        if (index == 2) {
          Navigator.pushReplacement(
            context, 
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const InsightsPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
            )
          );
        }

      },
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Icon(CupertinoIcons.home),
          ), 
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Icon(Icons.add_circle_outline),
          ), 
          label: 'Add'
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Icon(CupertinoIcons.graph_square),
          ), 
          label: 'Insights'
        ),
      ]
       
    );
  }

}