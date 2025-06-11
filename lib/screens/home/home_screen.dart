import 'package:fitness_gym_app/core/features/text_styles.dart';
import 'package:fitness_gym_app/data/models/workout_home.dart';
import 'package:fitness_gym_app/data/repository/repository.dart';
import 'package:flutter/material.dart';

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
    final Future<WorkoutHome> workoutList = _showListWorkout();
    return Scaffold(
      appBar: AppBar(
        title: Text('Good Morning!\nAndres Esquivel', style: TextStyles.bodyTextWhite),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: Colors.white,

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings
            },
          ),
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            tabs: [Tab(child: Text('My Workouts')), Tab(child: Text('Nutritions')), Tab(child: Text('Discover'))],
            indicatorColor: Color.fromARGB(255, 114, 93, 238),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                WorkoutList(workoutList: workoutList),
                Center(child: Text('Planes de nutrición', style: TextStyles.bodyTextWhite)),
                Center(child: Text('Novedades', style: TextStyles.bodyTextWhite)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Color.fromARGB(255, 114, 93, 238),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Workout'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation based on index
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

class WorkoutList extends StatelessWidget {
  const WorkoutList({super.key, required this.workoutList});

  final Future<WorkoutHome> workoutList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WorkoutHome>(
      future: workoutList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}', style: TextStyles.bodyTextWhite));
        } else if (!snapshot.hasData || snapshot.data!.workouts.isEmpty) {
          return Center(child: Text('No workouts found', style: TextStyles.bodyTextWhite));
        }
        final workouts = snapshot.data?.workouts ?? [];

        return ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            final workout = workouts[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(image: AssetImage('assets/images/workout_gym.jpg'), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(workout.type, style: TextStyles.bodyTextWhite),
                    SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(workout.title, style: TextStyles.heading1White),
                            Text(workout.trainer, style: TextStyles.bodyTextWhite),
                          ],
                        ),
                        Icon(Icons.favorite, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
