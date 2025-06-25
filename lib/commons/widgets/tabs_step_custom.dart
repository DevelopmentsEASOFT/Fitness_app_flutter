import 'package:flutter/material.dart';

import '../../core/features/apps_colors.dart';
import '../../core/features/text_styles.dart';

class TabsStepCustom extends StatefulWidget {
  final String? headerTile;
  final String? subTitle;
  final String? description;
  final List<Widget> stepTabs;
  final List<Widget> tabsHeader;
  const TabsStepCustom({
    super.key,
    this.headerTile,
    this.subTitle,
    this.description,
    required this.stepTabs,
    required this.tabsHeader,
  });

  @override
  State<TabsStepCustom> createState() => _TabsStepCustom();
}

class _TabsStepCustom extends State<TabsStepCustom> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(color: AppsColors.blackColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.headerTile != null
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.headerTile!, style: TextStyles.heading2White),
                )
                : const SizedBox.shrink(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    labelColor: AppsColors.primaryColor,
                    unselectedLabelColor: AppsColors.whiteColor,
                    indicatorColor: AppsColors.primaryColor,
                    tabs: widget.tabsHeader,
                    tabAlignment: TabAlignment.center,
                    labelStyle: TextStyles.bodyTextWhite,
                    isScrollable: true,
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.01),
                    dividerHeight: 0,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TabBarView(controller: _tabController, children: widget.stepTabs),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
