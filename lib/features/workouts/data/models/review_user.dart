class ReviewUser {
  final String name;
  final String avatarUrl;

  ReviewUser({required this.name, required this.avatarUrl});

  factory ReviewUser.fromJson(Map<String, dynamic> json) {
    return ReviewUser(name: json['name'], avatarUrl: json['avatarUrl']);
  }
}
