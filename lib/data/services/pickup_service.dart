// Pickup service.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/pickup_request.dart';

class PickupService {
  final _col = FirebaseFirestore.instance.collection('pickup_requests');

  Future<void> create({
    required String userId,
    required WasteType type,
    required bool hasRecyclables,
    required DateTime when,
  }) async {
    await _col.add({
      'userId': userId,
      'wasteType': type.name,
      'hasRecyclables': hasRecyclables,
      'scheduledAt': Timestamp.fromDate(when),
      'status': 'pending',
    });
  }
}
