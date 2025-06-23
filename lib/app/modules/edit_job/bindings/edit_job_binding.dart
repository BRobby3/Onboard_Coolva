import 'package:get/get.dart';

import '../controllers/edit_job_controller.dart';

class EditJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditJobController>(
      () => EditJobController(),
    );
  }
}
