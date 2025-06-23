import 'package:get/get.dart';

import '../controllers/add_job_controller.dart';

class AddJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddJobController>(
      () => AddJobController(),
    );
  }
}
