import 'package:get/get.dart';
import 'package:onboard_coolva/app/data/firestore.dart';
import 'package:onboard_coolva/app/core/values/constants/job_app_status_constants.dart';

class AddJobController extends GetxController {
  final FirestoreService firestoreService = FirestoreService();

  //TODO: Implement AddJobController

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

  Future<void> addJob({
    required String title,
    required String company,
    required String date,
    required JobApplicationStatus status,
    String? catatan,
  }) async {
    await firestoreService.addJob(
      title: title,
      company: company,
      date: date,
      status: status,
      catatan: catatan,
    );
  }
}
