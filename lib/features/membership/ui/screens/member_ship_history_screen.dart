import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../commons/widgets/base_app_bar.dart';
import '../../../../commons/widgets/service_error_message.dart';
import '../../../../core/features/apps_colors.dart';
import '../../../../core/features/text_styles.dart';
import '../../data/models/member_ship_history.dart';
import '../../data/providers/member_ship_provider.dart';

class MembershipHistoryScreen extends ConsumerStatefulWidget {
  const MembershipHistoryScreen({super.key});

  @override
  ConsumerState<MembershipHistoryScreen> createState() => _MembershipHistoryViewState();
}

class _MembershipHistoryViewState extends ConsumerState<MembershipHistoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(memberShipViewModelProvider.notifier).fetchMembershipHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(memberShipViewModelProvider);

    return Scaffold(
      appBar: BaseAppBar(
        automaticallyImplyLeading: true,
        title: Text(localizations.member_ship_history, style: TextStyles.headerTextWhite),
      ),
      backgroundColor: AppsColors.blackColor,
      body:
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.error != null || state.memberShipHistory == null
              ? ServiceErrorMessage()
              : HistoryShipInfo(localization: localizations, shipInfoList: state.memberShipHistory?.shipList),
    );
  }
}

class HistoryShipInfo extends StatelessWidget {
  const HistoryShipInfo({super.key, required this.shipInfoList, required this.localization});
  final List<MembershipHistory>? shipInfoList;
  final AppLocalizations localization;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            localization.member_ship_recent,
            style: TextStyle(color: AppsColors.whiteColor, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: shipInfoList?.length ?? 0,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final bill = shipInfoList?[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bill!.formattedDate,
                            style: const TextStyle(
                              color: AppsColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${localization.member_ship_invoice} ${bill.invoice}',
                            style: const TextStyle(color: Colors.blueGrey, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      bill.amount,
                      style: const TextStyle(color: AppsColors.whiteColor, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
