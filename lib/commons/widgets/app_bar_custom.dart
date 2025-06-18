import 'package:flutter/material.dart';

import '../../core/features/apps_colors.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final bool? automaticallyImplyLeading;

  const AppBarCustom({super.key, required this.title, this.actions, this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      title: title,
      actions: actions,
      backgroundColor: AppsColors.blackColor,
      iconTheme: const IconThemeData(color: AppsColors.whiteColor),
      foregroundColor: AppsColors.whiteColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
