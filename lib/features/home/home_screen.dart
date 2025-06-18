import 'package:fitness_gym_app/core/features/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../commons/widgets/app_bar_custom.dart';
import '../../commons/widgets/tabs_step_custom.dart';
import '../../core/features/apps_colors.dart';
import '../../core/features/text_styles.dart';
import '../../navigation/general_navigation.dart';
import '../workouts/view/widgets/workout_list.dart';

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
    final userName = "Andres Esquivel";

    return Scaffold(
      appBar: AppBarCustom(
        automaticallyImplyLeading: false,
        title: Text(l10n.home_greeting(userName), style: TextStyles.heading3White),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              GeneralNavigation.goToLogin(context);
            },
          ),
        ],
      ),
      backgroundColor: AppsColors.blackColor,
      body: Column(
        children: [
          AppSizes.gapH12,
          TabsStepCustom(
            stepTabs: [
              WorkoutList(),
              Center(child: Text(l10n.tab_nutritions, style: TextStyles.bodyTextWhite)),
              Center(child: Text(l10n.tab_discover, style: TextStyles.bodyTextWhite)),
            ],
            tabsHeader: [
              Tab(child: Text(l10n.tab_my_workouts, style: TextStyles.heading3White)),
              Tab(child: Text(l10n.tab_nutritions, style: TextStyles.heading3White)),
              Tab(child: Text(l10n.tab_discover, style: TextStyles.heading3White)),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppsColors.blackColor,
        selectedItemColor: AppsColors.primaryColor,
        unselectedItemColor: AppsColors.secondaryColor,
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
}
