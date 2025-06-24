import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../commons/widgets/app_bar_custom.dart';
import '../../../../commons/widgets/tabs_step_custom.dart';
import '../../../../commons/widgets/under_construction.dart';
import '../../../../config/router/app_routes.dart';
import '../../../../core/features/app_sizes.dart';
import '../../../../core/features/apps_colors.dart';
import '../../../../core/features/text_styles.dart';
import '../../../workouts/ui/widgets/workout_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with SingleTickerProviderStateMixin {
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
    final localizations = AppLocalizations.of(context)!;
    final userName = "Andres Esquivel";

    final bool isMorning = DateTime.now().hour < 18;
    final String greetingMessage =
        isMorning ? localizations.home_greeting(userName) : localizations.home_greetingnight(userName);

    return Scaffold(
      appBar: AppBarCustom(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(
              isMorning ? Icons.sunny : Icons.mode_night,
              color: isMorning ? AppsColors.amberColor : AppsColors.blueColor,
            ),
            SizedBox(width: 5),
            Text(greetingMessage, style: TextStyles.headerTextWhite),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          IconButton(icon: const Icon(Icons.logout), onPressed: () => context.pushNamed(AppRoutes.signIn)),
        ],
      ),
      backgroundColor: AppsColors.blackColor,
      body: Column(
        children: [
          AppSizes.gapH12,
          TabsStepCustom(
            stepTabs: [WorkoutList(), UnderConstruction(), UnderConstruction()],
            tabsHeader: [
              Tab(child: Text(localizations.tab_my_workouts, style: TextStyles.stepTextWhite)),
              Tab(child: Text(localizations.tab_estadistics, style: TextStyles.stepTextWhite)),
              Tab(child: Text(localizations.tab_discover, style: TextStyles.stepTextWhite)),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppsColors.blackColor,
        selectedItemColor: AppsColors.primaryColor,
        unselectedItemColor: AppsColors.secondaryColor,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: localizations.tab_my_workouts),
          BottomNavigationBarItem(icon: const Icon(Icons.chair), label: localizations.tab_estadistics),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: localizations.tab_profile),
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
              context.pushNamed(AppRoutes.userProfile);
              break;
          }
        },
      ),
    );
  }
}
