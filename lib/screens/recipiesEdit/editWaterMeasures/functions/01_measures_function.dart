class MeasuresF {
  Map measureGet(Map measureData) {
    List measuresList = [];
    List indexKeys = [];
    Map measureMap = {};
    List<String> ranges = [
      "0-2",
      "1-10",
      "0-10k",
      "10-100",
      "100-200",
      "100-10k"
    ];
    measureData.forEach((indexKey, value) {
      if (indexKey.contains("measure")) {
        indexKeys.add(indexKey);
        measureMap.addEntries([
          MapEntry(
              value, measureData[indexKey.replaceAll("measure", "valueInGms")])
        ]);
      }
    });
    indexKeys.sort();
    indexKeys.forEach((element) {
      measuresList.add(measureData[element]);
    });
    measuresList.remove("portion / serving");
    
    return {"measureList": measuresList, "measureMap": measureMap, "rangeList":ranges};
  }

  List<num> listRange(int index) {
    if (listRange(index) == "0-2") {
      return [
        0,
        0.1,
        0.2,
        0.25,
        0.3,
        0.4,
        0.5,
        0.6,
        0.7,
        0.75,
        0.8,
        0.9,
        1,
        1.1,
        1.2,
        1.25,
        1.3,
        1.4,
        1.5,
        1.6,
        1.7,
        1.75,
        1.8,
        1.9,
        2
      ];
    }
    if (listRange(index) == "1-10") {
      return [1, 1.5, 2, 2.5, 3, 4, 5, 6, 7.5, 8, 9, 10];
    }
    if (listRange(index) == "10-100") {
      return [10, 15, 20, 25, 30, 40, 50, 60, 70, 75, 80, 90, 100];
    }
    if (listRange(index) == "100-200") {
      return [
        100,
        110,
        120,
        125,
        130,
        140,
        150,
        160,
        170,
        175,
        180,
        190,
        200,
        250,
        300,
        400,
        500,
        600,
        700,
        750,
        800,
        900,
        1000
      ];
    }
    if (listRange(index) == "100-10k") {
      return [
        100,
        125,
        150,
        175,
        200,
        250,
        500,
        750,
        1000,
        1250,
        1500,
        2000,
        2500,
        5000,
        7500,
        1000
      ];
    } else {
      return [
        0,
        0.25,
        0.5,
        1,
        1.5,
        2,
        5,
        10,
        25,
        50,
        100,
        250,
        500,
        750,
        1000,
        2500,
        5000,
        1000
      ];
    }
  }
}
