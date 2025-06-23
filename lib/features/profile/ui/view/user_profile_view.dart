import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../commons/widgets/app_bar_custom.dart';
import '../../../../core/features/apps_colors.dart';
import '../../../../core/features/text_styles.dart';
import '../../../../navigation/general_navigation.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBarCustom(
        automaticallyImplyLeading: true,
        title: Text(l10n.tab_profile, style: TextStyles.headerTextWhite),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
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
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            ),
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.06),
            child: Center(child: CircleAvatar(radius: 100, backgroundImage: AssetImage("assets/images/start_gym.png"))),
          ),
          Text('Andres Esquivel', style: TextStyles.heading1White),
          Text(l10n.profile_level_beginner, style: TextStyles.caption),
          Divider(
            color: AppsColors.grayColor,
            thickness: 0.5,
            indent: MediaQuery.of(context).size.width * 0.1,
            endIndent: MediaQuery.of(context).size.width * 0.1,
          ),
          ListTile(
            leading: const Icon(Icons.history, color: AppsColors.whiteColor),
            title: Text(l10n.member_ship, style: TextStyles.bodyTextWhite),
            onTap: () => GeneralNavigation.goToMemberShipProfile(context),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: AppsColors.whiteColor),
            title: Text(l10n.profile_edit, style: TextStyles.bodyTextWhite),
            onTap: () => GeneralNavigation.goToEditProfile(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: AppsColors.whiteColor),
            title: Text(l10n.profile_settings, style: TextStyles.bodyTextWhite),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
