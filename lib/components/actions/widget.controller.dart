import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class WidgetController extends GetxController {
  RxDouble fontSize = 24.0.obs;

  void changeFontSize(double newSize) {
    fontSize.value = newSize;
    update();
  }
}
