import 'package:final_config_enviroment/repository/movie_repository.dart';
import 'package:final_config_enviroment/ui/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MovieRepository>(() => MovieRepositoryImlp());
  }
}
