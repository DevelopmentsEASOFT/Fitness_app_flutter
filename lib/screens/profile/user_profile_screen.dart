import 'package:fitness_gym_app/core/features/text_styles.dart';
import 'package:fitness_gym_app/navigation/general_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
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
            color: Colors.grey,
            thickness: 0.5,
            indent: MediaQuery.of(context).size.width * 0.1,
            endIndent: MediaQuery.of(context).size.width * 0.1,
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: Text(l10n.profile_edit, style: TextStyles.bodyTextWhite),
            onTap: () => GeneralNavigation.goToEditProfile(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: Text(l10n.profile_settings, style: TextStyles.bodyTextWhite),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
