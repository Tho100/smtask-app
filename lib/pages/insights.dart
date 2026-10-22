import 'package:flutter/material.dart';
import 'package:smtask/widgets/navigation_bar.dart';

class InsightsPage extends StatelessWidget {
  const InsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavigationBar(currentIndex: 2).build(context)
    );
  }
}