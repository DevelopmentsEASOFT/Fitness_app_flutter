import 'package:fitness_gym_app/core/features/text_styles.dart';
import 'package:fitness_gym_app/data/models/workout_home.dart';
import 'package:fitness_gym_app/data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../navigation/general_navigation.dart';
import 'widgets/workout_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final Future<WorkoutHome> workoutList = _showListWorkout();
    final userName = "Andres Esquivel"; // Puedes obtenerlo dinámicamente si lo tienes

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.home_greeting(userName), style: TextStyles.bodyTextWhite),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            labelStyle: TextStyles.bodyTextWhite,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            isScrollable: true,
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.01),
            tabs: [
              Tab(child: Text(l10n.tab_my_workouts)),
              Tab(child: Text(l10n.tab_nutritions)),
              Tab(child: Text(l10n.tab_discover)),
            ],
            indicatorColor: const Color.fromARGB(255, 114, 93, 238),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                WorkoutList(workoutList: workoutList),
                Center(child: Text(l10n.tab_nutritions, style: TextStyles.bodyTextWhite)),
                Center(child: Text(l10n.tab_discover, style: TextStyles.bodyTextWhite)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 114, 93, 238),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: l10n.tab_my_workouts),
          BottomNavigationBarItem(icon: const Icon(Icons.work), label: l10n.tab_nutritions),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: l10n.tab_profile),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle bottom navigation bar taps
          switch (index) {
            case 0:
              // Home tab
              break;
            case 1:
              // Workouts tab
              break;
            case 2:
              GeneralNavigation.goToUserProfile(context);
              break;
          }
        },
      ),
    );
  }

  Future<WorkoutHome> _showListWorkout() async {
    final Repository _repository = Repository();
    try {
      final workoutHome = await _repository.getWorkout();
      return workoutHome;
    } catch (error) {
      print('Error fetching workouts: $error');
      throw Exception('Failed to fetch workouts');
    }
  }
}
