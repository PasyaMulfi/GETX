import 'package:get/get.dart';

class CounterController extends GetxController {
  final count = 0.obs;

  void increment() {
    if (count.value < 100) count.value++;
  }

  void decrement() {
    if (count.value > 1) count.value--;
  }
}
