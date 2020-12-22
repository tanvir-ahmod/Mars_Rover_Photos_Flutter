import 'dart:convert';

import 'package:mars_rover_image_flutter/models/rover_data.dart';
import 'package:mars_rover_image_flutter/repositories/rover_repository.dart';
import 'package:http/http.dart' as http;

class RoverRepositoryImpl extends RoverRepository {
  Future<RoverData> fetchImages() async {
    final response =
        await http.get('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=DEMO_KEY');

    if (response.statusCode == 200) {
      return RoverData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
