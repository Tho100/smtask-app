import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smtask/colors.dart';
import 'package:smtask/dialogs/task_options.dart';
import 'package:smtask/pages/home.dart';
import 'package:smtask/pages/insights.dart';

class MainNavigationBar {

  int currentIndex = 0;

  MainNavigationBar({required this.currentIndex});

  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme.bgBlack,
      child: SafeArea(
        top: false,
        child: Center(
          heightFactor: 1,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              backgroundColor: Colors.black,
              selectedItemColor: ColorTheme.mainOrange,
              unselectedItemColor: ColorTheme.secondaryGray,
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
              items: [

                const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home, size: 28),
                  label: ''
                ),

                BottomNavigationBarItem(
                  icon: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: ColorTheme.mainOrange,
                      fixedSize: const Size(48, 48),
                      padding: EdgeInsets.zero
                    ),
                    onPressed: () => TaskOptions().show(context),
                    child: Transform.translate(
                      offset: const Offset(1, 0),
                      child: const Icon(CupertinoIcons.add, color: ColorTheme.bgBlack, size: 25)
                    ),
                  ),
                  label: ''
                ),

                const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chart_bar_square, size: 32),
                  label: ''
                ),

              ]
               
            ),
          ),
        ),
      ),
    );
  }

}