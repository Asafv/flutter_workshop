import 'package:common_dependencies/common_dependencies.dart';
import 'package:home/src/home_controller.dart';

// once we define our bindings, we have a dedicated place to
// initialize our dependencies for the controller
class HomeBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => HomeController());
}
