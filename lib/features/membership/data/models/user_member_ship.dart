class UserMembership {
  final String membershipType;
  final String status;
  final DateTime nextRenewalDate;
  final double amount;

  UserMembership({
    required this.membershipType,
    required this.status,
    required this.nextRenewalDate,
    required this.amount,
  });

  factory UserMembership.fromJson(Map<String, dynamic> json) {
    return UserMembership(
      membershipType: json['membershipType'],
      status: json['status'],
      nextRenewalDate: DateTime.parse(json['nextRenewalDate']),
      amount: (json['amount'] as num).toDouble(),
    );
  }

  String get nextRenewalDateFormatted {
    return '${nextRenewalDate.day}/${nextRenewalDate.month}/${nextRenewalDate.year}';
  }
}
