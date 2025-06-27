class Trainer {
  final String name;
  final String avatarUrl;
  final String role;

  Trainer({required this.name, required this.avatarUrl, required this.role});

  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(name: json['name'], avatarUrl: json['avatar_url'], role: json['role']);
  }
}
