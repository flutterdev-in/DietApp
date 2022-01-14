class FoodModel {
  String? fID, img150, img500, commonName, servingName,recipieURL;
  Map? measureData;
  num? totalYields, itemsPerServing;

  FoodModel(
      {this.commonName,
      this.fID,
      this.img150,
      this.img500,
      this.measureData,
      this.itemsPerServing,
      this.servingName,
      this.totalYields,
      this.recipieURL});

  factory FoodModel.fromMap(Map fMap) {
    return FoodModel(
      fID: fMap["fID"],
      img150: fMap["imgURL"]["img150"],
      img500: fMap["imgURL"]["img500"],
      measureData: fMap["measureData"],
      commonName: fMap["names"]["Common_name"],
      servingName: fMap["servingData"]["defaultUnit"],
      totalYields: fMap["servingData"]["totalServings"],
      itemsPerServing: fMap["servingData"]["defaultValue"],
      recipieURL: fMap["fDetails"]["sourceURL"]
    );
  }
}
