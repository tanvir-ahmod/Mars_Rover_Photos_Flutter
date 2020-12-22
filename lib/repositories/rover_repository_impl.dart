import 'dart:convert';

import 'package:mars_rover_image_flutter/models/query_model.dart';
import 'package:mars_rover_image_flutter/models/rover_data.dart';
import 'package:mars_rover_image_flutter/repositories/rover_repository.dart';
import 'package:http/http.dart' as http;

class RoverRepositoryImpl extends RoverRepository {
  final _baseUrl = "https://api.nasa.gov/mars-photos/api/v1/rovers";
  final _sol = "1000";
  final _apiKey = "DEMO_KEY";

  Future<RoverData> fetchImages(QueryModel queryModel) async {
    var queryString =
        '$_baseUrl/${queryModel.roverName}/photos?sol=$_sol&api_key=$_apiKey';
    if (queryModel.camera != null)
      queryString += "&camera=${queryModel.camera}";
    if (queryModel.earthDate != null)
      queryString += "&earth_date=${queryModel.earthDate}";

    final response = await http.get(queryString);

    if (response.statusCode == 200) {
      return RoverData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
