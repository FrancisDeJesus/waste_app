// User model.

class AppUser {
  final String uid;
  final String name;
  final String restaurant;
  final String address;
  final int points;

  AppUser({required this.uid, required this.name, required this.restaurant, required this.address, this.points = 0});

  Map<String, dynamic> toMap() => {
    'name': name,
    'restaurant': restaurant,
    'address': address,
    'points': points,
  };

  static AppUser fromMap(String uid, Map<String, dynamic> m) => AppUser(
    uid: uid,
    name: m['name'] ?? '',
    restaurant: m['restaurant'] ?? '',
    address: m['address'] ?? '',
    points: (m['points'] ?? 0) as int,
  );
}
