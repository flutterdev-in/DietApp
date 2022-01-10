class FoodModelForEachIngEdit {
  var fID;
  var img150;
  var img500;
  var measureData;
  var commonName;
  FoodModelForEachIngEdit(
      {this.commonName, this.fID, this.img150, this.img500, this.measureData});

  factory FoodModelForEachIngEdit.fromMap(Map fMap) {
    return FoodModelForEachIngEdit(
      fID: fMap["fID"],
      img150: fMap["imgURL"]["img150"],
      img500: fMap["imgURL"]["img500"],
      measureData: fMap["measureData"],
      commonName: fMap["names"]["Common_name"],
    );
  }
}
