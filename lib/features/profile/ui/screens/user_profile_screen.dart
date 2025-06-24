import 'package:fitness_gym_app/config/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../commons/widgets/app_bar_custom.dart';
import '../../../../core/features/apps_colors.dart';
import '../../../../core/features/text_styles.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<UserProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBarCustom(
        automaticallyImplyLeading: true,
        title: Text(localizations.tab_profile, style: TextStyles.headerTextWhite),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.logout), onPressed: () => context.pushNamed(AppRoutes.signIn)),
        ],
      ),
      backgroundColor: AppsColors.blackColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            ),
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.06),
            child: Center(child: CircleAvatar(radius: 100, backgroundImage: AssetImage("assets/images/start_gym.png"))),
          ),
          Text('Andres Esquivel', style: TextStyles.heading1White),
          Text(localizations.profile_level_beginner, style: TextStyles.caption),
          Divider(
            color: AppsColors.grayColor,
            thickness: 0.5,
            indent: MediaQuery.of(context).size.width * 0.1,
            endIndent: MediaQuery.of(context).size.width * 0.1,
          ),
          ListTile(
            leading: const Icon(Icons.history, color: AppsColors.whiteColor),
            title: Text(localizations.member_ship, style: TextStyles.bodyTextWhite),
            onTap: () => context.pushNamed(AppRoutes.membershipProfile),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: AppsColors.whiteColor),
            title: Text(localizations.profile_edit, style: TextStyles.bodyTextWhite),
            onTap: () => context.pushNamed(AppRoutes.editProfile),
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: AppsColors.whiteColor),
            title: Text(localizations.profile_settings, style: TextStyles.bodyTextWhite),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
