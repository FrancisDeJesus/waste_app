// Points service.

import 'package:cloud_firestore/cloud_firestore.dart';

class PointsService {
  final _tx = FirebaseFirestore.instance.collection('points_txns');
  final _users = FirebaseFirestore.instance.collection('users');

  Stream<int> streamBalance(String userId) {
    return _tx.where('userId', isEqualTo: userId)
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((s) => s.docs.fold<int>(0, (sum, d) => sum + (d['delta'] as int)));
  }

  Future<void> addPoints(String userId, int delta, String reason) async {
    final batch = FirebaseFirestore.instance.batch();
    final txnRef = _tx.doc();
    batch.set(txnRef, {'userId': userId, 'delta': delta, 'reason': reason, 'createdAt': Timestamp.now()});
    final userRef = _users.doc(userId);
    batch.update(userRef, {'points': FieldValue.increment(delta)});
    await batch.commit();
  }
}
