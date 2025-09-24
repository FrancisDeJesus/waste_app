// Points transaction model.

class PointsTxn {
  final String id;
  final String userId;
  final int delta;
  final String reason;
  final DateTime createdAt;

  PointsTxn({required this.id, required this.userId, required this.delta, required this.reason, required this.createdAt});

  Map<String, dynamic> toMap() => {
    'userId': userId, 'delta': delta, 'reason': reason, 'createdAt': createdAt,
  };
}
