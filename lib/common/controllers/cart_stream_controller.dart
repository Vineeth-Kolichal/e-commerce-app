import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final collectionProvider = StreamProvider<QuerySnapshot<Map<String, dynamic>>>(
  (ref) {
    return FirebaseFirestore.instance.collection('cart').snapshots();
  },
);
