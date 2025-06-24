class MembershipHistory {
  final DateTime date;
  final String invoice;
  final String amount;

  MembershipHistory({required this.date, required this.invoice, required this.amount});

  factory MembershipHistory.fromJson(Map<String, dynamic> json) {
    return MembershipHistory(
      date: DateTime.parse(json['date']),
      invoice: json['invoice'] as String,
      amount: json['amount'] as String,
    );
  }

  String get formattedDate {
    return '${date.day}/${date.month}/${date.year}';
  }
}
