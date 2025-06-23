import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onboard_coolva/app/core/values/constants/job_app_status_constants.dart';

class FirestoreService {
  final CollectionReference jobs =
      FirebaseFirestore.instance.collection('jobs');

  Future<void> addJob({
    required String title,
    required String company,
    required String date,
    required JobApplicationStatus status,
    String? catatan,
  }) async {
    await jobs.add({
      'title': title,
      'company': company,
      'date': date,
      'status': status.name,
      'catatan': catatan ?? '',
    });
  }

  Future<void> editJob(String docId, Map<String, dynamic> data) async {
    await jobs.doc(docId).update(data);
  }

  Future<void> deleteJob(String docId) async {
    await jobs.doc(docId).delete();
  }

  Stream<List<Map<String, dynamic>>> getListJob() {
    return jobs.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return {
          ...data,
          'id': doc.id,
          'status': JobApplicationStatus.values.firstWhere(
            (e) => e.name == data['status'],
            orElse: () => JobApplicationStatus.noResponse,
          ),
        };
      }).toList();
    });
  }
}