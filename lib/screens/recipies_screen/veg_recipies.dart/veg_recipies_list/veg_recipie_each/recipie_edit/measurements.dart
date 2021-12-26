class Measurements {
  var servingData;

  Measurements({this.servingData});

  List listTools(indexMap) {
    List<int> list = <int>[];
    indexMap.forEach((k, v) {
      list.add(v);
    });

    for (int v in list) {
      if (v == 0) {
        list.remove(v);
      }
    }
    list.sort();
    List listToolsSort = [];
    for (int v in list) {
      for (var k in indexMap) {
        if (indexMap[k] == v) {
          listToolsSort.add(k);
        }
      }
    }
    return listToolsSort;
  }

  double gmsFromCup(tool, cupGms) {
    if (tool == "katori") {
      return cupGms * 150 / 250;
    }
    if (tool == "bowl") {
      return cupGms * 350 / 250;
    }
    if (tool == "teaCup") {
      return cupGms * 180 / 250;
    }
    if (tool == "glass") {
      return cupGms;
    }
    if (tool == "smallBowl") {
      return cupGms * 150 / 250;
    }
    if (tool == "largeGlass") {
      return cupGms * 150 / 250;
    }
    if (tool == "tbsp") {
      return cupGms / 16;
    }
    if (tool == "tsp") {
      return cupGms / 48;
    } else {
      return cupGms;
    }
  }
}
