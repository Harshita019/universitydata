import 'package:get/get.dart';
import 'package:universitydata/service.dart';
import 'model.dart';

class ApiController extends GetxController {
  final ApiService apiService = ApiService();
  RxList<Model> modelData = <Model>[].obs;

  Future<void> fetchDetails() async {
    try {
      final List<Model> fetchedData = await apiService.getUniversityList();
      modelData.assignAll(fetchedData);
    } catch (e) {
      print('Error: $e');
    }
  }
}
