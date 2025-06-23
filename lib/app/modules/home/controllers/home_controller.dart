import 'package:get/get.dart';
import 'package:onboard_coolva/app/data/firestore.dart';

class HomeController extends GetxController {
  final FirestoreService firestoreService = FirestoreService();

  // Stream jobs from Firestore
  Stream<List<Map<String, dynamic>>> get jobsStream => firestoreService.getListJob();

  Future<void> editJob(String docId, Map<String, dynamic> data) async {
    await firestoreService.editJob(docId, data);
  }
}
