// Pickup request model.

enum WasteType { customer, kitchen, service }

class PickupRequest {
  final String id;
  final String userId;
  final WasteType wasteType;
  final bool hasRecyclables; // glass/plastics? (from your flow)
  final DateTime scheduledAt;
  final String status; // pending/assigned/collected
  final String? driverId;

  PickupRequest({
    required this.id,
    required this.userId,
    required this.wasteType,
    required this.hasRecyclables,
    required this.scheduledAt,
    this.status = 'pending',
    this.driverId,
  });

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'wasteType': wasteType.name,
    'hasRecyclables': hasRecyclables,
    'scheduledAt': scheduledAt,
    'status': status,
    'driverId': driverId,
  };
}
