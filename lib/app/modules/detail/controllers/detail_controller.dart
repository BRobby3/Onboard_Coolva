import 'package:get/get.dart';
import 'package:onboard_coolva/app/data/firestore.dart';

class DetailController extends GetxController {
  final FirestoreService firestoreService = FirestoreService();

  //TODO: Implement DetailController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> editJob(String docId, Map<String, dynamic> data) async {
    await firestoreService.editJob(docId, data);
  }

  Stream<List<Map<String, dynamic>>> get jobsStream => firestoreService.getListJob();
}
