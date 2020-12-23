import 'package:mars_rover_image_flutter/models/rover.dart';
import 'package:mars_rover_image_flutter/models/rover_camera.dart';

class LocalRoverDataSource {
  var _rovers = [
    Rover(
        id: 1,
        image: "assets/images/curiosity.webp",
        name: "Curiosity",
        launchDate: "2011-11-26",
        landingDate: "2012-08-06",
        currentStatus: "Active"),
    Rover(
        id: 2,
        image: "assets/images/opportunity.webp",
        name: "Opportunity",
        launchDate: "2003-07-07",
        landingDate: "2004-01-25",
        currentStatus: "Complete"),
    Rover(
        id: 3,
        image: "assets/images/spirit.webp",
        name: "Spirit",
        launchDate: "2003-06-10",
        landingDate: "2004-01-04",
        currentStatus: "Complete"),
  ];

  List<Rover> getAllRovers() {
    return _rovers;
  }

  List<RoverCamera> getAvailableCameraById(int id) {
    List<RoverCamera> availableCameras;
    switch (id) {
      case 1:
        {
          availableCameras
              .add(RoverCamera("FHAZ", "assets/images/curiosity_fhaz.webp"));
          availableCameras
              .add(RoverCamera("RHAZ", "assets/images/curiosity_rhaz.jpg"));
          availableCameras
              .add(RoverCamera("MAST", "assets/images/curiosity_mast.webp"));
          availableCameras.add(
              RoverCamera("CHEMCAM", "assets/images/curiosity_chemcam.jpg"));
          availableCameras.add(
              RoverCamera("NAVCAM", "- assets/images/opportunity_navcam.jpg"));
        }
        break;
      case 2:
        {
          availableCameras.add(
              RoverCamera("PANCAM", "assets/images/opportunity_navcam.webp"));
          availableCameras
              .add(RoverCamera("RHAZ", "assets/images/opportunity_pancam.jpg"));
        }
        break;

      case 3:
        {
          availableCameras
              .add(RoverCamera("FHAZ", "assets/images/spirit_navcam.webp"));
          availableCameras
              .add(RoverCamera("RHAZ", "assets/images/spirit_pancam.jpg"));
        }
        break;
    }

    return availableCameras;
  }
}
