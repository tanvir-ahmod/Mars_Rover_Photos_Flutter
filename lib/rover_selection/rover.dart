class Rover {
  int id;
  String name;
  String image;
  String launchDate;
  String landingDate;
  String currentStatus;
  String camera = "FHAZ";

  Rover(
      {this.id,
      this.name,
      this.image,
      this.launchDate,
      this.landingDate,
      this.currentStatus,
      this.camera});
}
