import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smtask/colors.dart';
import 'package:smtask/helper/date_help.dart';
import 'package:smtask/helper/task_type_to_string.dart';
import 'package:smtask/shared/data/local_storage.dart';
import 'package:smtask/shared/task_type.dart';
import 'package:smtask/widgets/navigation_bar.dart';

class HomePage extends StatefulWidget {

  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  late Future<Map<String, int>> _taskDataFuture;

  String _dateAsOfCardMessage() {
    
    final dateHelp = DateHelp.currentDate();

    final day = dateHelp['day'];
    final month = dateHelp['month'];
    final year = dateHelp['year'];

    return 'As of $day/$month/$year';

  }

  Widget _topBar() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: ColorTheme.mainOrange,
              fixedSize: const Size(45, 45)
            ),
            onPressed: () {}, 
            child: const Icon(CupertinoIcons.profile_circled, size: 30)
          ),
          
          const Spacer(),

          Text(
            'smtask',
            style: GoogleFonts.inter(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: ColorTheme.mainOrange
            ),
          ),


          const Spacer(),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: ColorTheme.mainOrange,
              fixedSize: const Size(45, 45)
            ),
            onPressed: () {}, 
            child: const Icon(CupertinoIcons.settings, size: 25)
          ),

        ],
      ),
    );
  }

  Widget _completedTaskCard({
    required String title, 
    required String description, 
    required IconData icon, 
    required int value
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      height: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorTheme.bgBlack,
        border: Border.all(
          color: ColorTheme.secondaryGray
        )
      ),
      child: Row(
        children: [

          const SizedBox(width: 15),

          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: ColorTheme.mainOrange,
              borderRadius: BorderRadius.circular(18)
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: ColorTheme.secondaryWhite,
                  fontWeight: FontWeight.w700
                ),
              ),

              const SizedBox(height: 4),

              Text(
                description,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: ColorTheme.thirdWhite,
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Text(
              value.toString(),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w800      
              ),
            ),
          )

        ],
      ),
    );
  }

  Widget _completedTasks() {
    return FutureBuilder(
      future: _taskDataFuture,
      builder: (_, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: ColorTheme.mainOrange)
          );
        }

        final taskStats = snapshot.data!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Completed Task',
                style: GoogleFonts.inter(
                  color: ColorTheme.mainOrange,
                  fontSize: 13,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),

            const SizedBox(height: 15),

            _completedTaskCard(
              title: 'Rockage Loaded', 
              description: 'Rockages loaded from \nthe warehouse truck',
              icon: Icons.local_shipping,
              value: taskStats[TaskTypeToString.convert(task: TaskType.truckLoaded)]!
            ),

            const SizedBox(height: 10),

            _completedTaskCard(
              title: 'Aisles Stocked', 
              description: 'Aisles fully stocked',
              icon: Icons.shelves,
              value: taskStats[TaskTypeToString.convert(task: TaskType.aisleStocked)]!
            ),

            const SizedBox(height: 10),

            _completedTaskCard(          
              title: 'Planograms Completed', 
              description: 'Bays planogram completed',
              icon: Icons.grid_on,
              value: taskStats[TaskTypeToString.convert(task: TaskType.planoCompleted)]!
            ),

            const SizedBox(height: 10),

          ],
        );
      },
    );
  }

  Widget _mainCard() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 240, 185, 163),
              ColorTheme.mainOrange,
            ]
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 220, 148, 107),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 4)
            )
          ]
        ),
        width: MediaQuery.of(context).size.width * 0.92,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 8),

              Text(
                'Your Points',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: ColorTheme.secondaryGray,
                  fontWeight: FontWeight.w800
                ),
              ),

              const SizedBox(height: 4),

              Text(
                '255',
                style: GoogleFonts.inter(
                  fontSize: 42,
                  color: Colors.black,
                  fontWeight: FontWeight.w900
                ),
              ),

              const SizedBox(height: 12),

              Text(
                _dateAsOfCardMessage(),
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: ColorTheme.secondaryGray,
                  fontWeight: FontWeight.w700
                ),
              )

            ],
          ),
        ),
  
      ),
    );
  }

  @override
  void initState() {
    _taskDataFuture = LocalStorage().readTaskData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavigationBar(currentIndex: 0).build(context),
      body: SingleChildScrollView(
        child: Column(
          children: [

            _topBar(),
            
            const SizedBox(height: 24),

            _mainCard(),

            const SizedBox(height: 35),

            _completedTasks(),
            
            const SizedBox(height: 10),

          ],
        ),
      ),
    );

  }

}