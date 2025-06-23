import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../commons/templates/service_error_view.dart';
import '../../../../commons/widgets/app_bar_custom.dart';
import '../../../../commons/widgets/primary_elevated_button_custom.dart';
import '../../../../core/features/apps_colors.dart';
import '../../../../core/features/text_styles.dart';
import '../../data/models/user_member_ship.dart';
import '../../data/providers/member_ship_provider.dart';
import '../../../../navigation/general_navigation.dart';

class MemberShipView extends ConsumerStatefulWidget {
  const MemberShipView({super.key});

  @override
  ConsumerState<MemberShipView> createState() => _MemberShipViewState();
}

class _MemberShipViewState extends ConsumerState<MemberShipView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(memberShipViewModelProvider.notifier).fetchMembershipInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(memberShipViewModelProvider);

    return Scaffold(
      appBar: AppBarCustom(
        automaticallyImplyLeading: true,
        title: Text(l10n.member_ship, style: TextStyles.headerTextWhite),
      ),
      backgroundColor: AppsColors.blackColor,
      body:
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.error != null || state.membership == null
              ? ServiceErrorView()
              : MemberShipInfo(l10n: l10n, membership: state.membership),
    );
  }
}

class MemberShipInfo extends StatelessWidget {
  const MemberShipInfo({super.key, required this.l10n, required this.membership});

  final AppLocalizations l10n;
  final UserMemberShip? membership;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.member_ship_details, style: TextStyles.heading3White),
          const SizedBox(height: 16),

          _MembershipDetailTile(icon: Icons.star_border, title: l10n.member_ship, subtitle: membership!.membershipType),
          const SizedBox(height: 12),
          _MembershipDetailTile(
            icon: Icons.check_circle_outline,
            title: l10n.member_ship_status,
            subtitle: membership!.status,
          ),
          const SizedBox(height: 32),
          Text(l10n.member_ship_next_renewal, style: TextStyles.heading3White),
          const SizedBox(height: 16),
          _MembershipDetailTile(
            icon: Icons.calendar_today,
            title: l10n.next_renewal_date,
            subtitle: membership!.nextRenewalDateFormatted,
          ),
          const SizedBox(height: 12),
          _MembershipDetailTile(
            icon: Icons.attach_money,
            title: l10n.member_ship_amount,
            subtitle: '\$${membership!.amount.toStringAsFixed(2)}',
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: PrimaryElevatedButtonCustom(
              onPressed: () => GeneralNavigation.goToHistoryMemberShip(context),
              text: l10n.member_ship_history,
              isLoading: false,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _MembershipDetailTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _MembershipDetailTile({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(color: AppsColors.grayColor, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(16),
          child: Icon(icon, size: 28, color: AppsColors.whiteColor),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyles.bodyTextWhite),
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyles.captionWhite),
          ],
        ),
      ],
    );
  }
}
