import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';

class ApiService {
  Future<List<Model>> getUniversityList() async {

    final response = await http.get(Uri.parse("http://universities.hipolabs.com/search?country=United+States"));

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);
      final List<Model> jsonResponse =
      decodedData.map((data) => Model.fromJson(data)).toList();
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
