import 'package:get/get.dart';
import 'package:getx_matrix/widget_controller/matrix_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatrixController>(
      () => MatrixController(),
    );
  }
}
