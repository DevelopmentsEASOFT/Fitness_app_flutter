class MemberShipHistory {
  final DateTime date;
  final String invoice;
  final String amount;

  MemberShipHistory({required this.date, required this.invoice, required this.amount});

  factory MemberShipHistory.fromJson(Map<String, dynamic> json) {
    return MemberShipHistory(
      date: DateTime.parse(json['date']),
      invoice: json['invoice'] as String,
      amount: json['amount'] as String,
    );
  }

  String get formattedDate {
    return '${date.day}/${date.month}/${date.year}';
  }
}
