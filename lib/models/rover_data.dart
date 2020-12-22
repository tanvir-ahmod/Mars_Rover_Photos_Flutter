import 'dart:core';

class RoverData {
  List<RoverPhoto> photos;

  RoverData({this.photos});

  factory RoverData.fromJson(Map<String, dynamic> parsedJson) {
    var photosFromJson = parsedJson['photos'] as List;
    // print(photosFromJson);
    List<RoverPhoto> imagesList =
        photosFromJson.map((i) => RoverPhoto.fromJson(i)).toList();

    return RoverData(photos: imagesList);
  }
}

class RoverX {
  int id;
  var landing_date;
  var launch_date;
  var name;
  var status;

  RoverX(
      {this.id, this.landing_date, this.launch_date, this.name, this.status});

  factory RoverX.fromJson(Map<String, dynamic> parsedJson) {
    return RoverX(
        id: parsedJson['id'],
        name: parsedJson['name'],
        landing_date: parsedJson['landing_date'],
        launch_date: parsedJson['launch_date'],
        status: parsedJson['status']);
  }
}

class RoverPhoto {
  CameraX camera;
  var earth_date;
  int id;
  var img_src;
  var rover;
  int sol;

  RoverPhoto(
      {this.camera,
      this.earth_date,
      this.id,
      this.img_src,
      this.rover,
      this.sol});

  factory RoverPhoto.fromJson(Map<String, dynamic> parsedJson) {
    return RoverPhoto(
        id: parsedJson['id'],
        earth_date: parsedJson['earth_date'],
        img_src: parsedJson['img_src'],
        rover: parsedJson['rover'],
        sol: parsedJson['sol'],
        camera: CameraX.fromJson(parsedJson['camera']));
  }
}

class CameraX {
  var full_name;
  int id;
  var name;
  int rover_id;

  CameraX({this.full_name, this.id, this.name, this.rover_id});

  factory CameraX.fromJson(Map<String, dynamic> parsedJson) {
    return CameraX(
        id: parsedJson['id'],
        full_name: parsedJson['full_name'],
        name: parsedJson['name'],
        rover_id: parsedJson['rover_id']);
  }
}
