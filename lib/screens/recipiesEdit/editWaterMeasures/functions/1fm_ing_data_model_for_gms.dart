import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/models/1_each_ing_new_model.dart';

class IngDataModelForGms {
  List<String>? listWaterIngs;
  num? netGms;
  num? waterGms;
  num? grossGms;

  IngDataModelForGms({
    this.grossGms,
    this.listWaterIngs,
    this.netGms,
    this.waterGms,
  });

  IngDataModelForGms ingDataModelForGms(ingData) {
    Map ingDataFunctionMa = ingDataFunctionMap(ingData);
    return IngDataModelForGms.fromMap(ingDataFunctionMa);
  }

  factory IngDataModelForGms.fromMap(Map ingDataFunctionMap) {
    return IngDataModelForGms(
        grossGms: ingDataFunctionMap["grossGms"],
        listWaterIngs: ingDataFunctionMap["listWaterIngs"],
        netGms: ingDataFunctionMap["netGms"],
        waterGms: ingDataFunctionMap["waterGms"]);
  }

  Map ingDataFunctionMap(Map ingData) {
    num wg = 0, ng = 0, gg = 0;
    List<String> lw = [];

    ingData.forEach((key, eachIng) {
      if (eachIng is Map) {
        EachIng ei = EachIng.fromMap(eachIng);
        if (ei.fID == "Z001") {
          wg = wg + ei.totalGms!;
          String stg =
              "${ei.webAmount} ${ei.webUnit} ${ei.webName} ${ei.webNotes} = ${ei.totalGms!.round()} g";
          lw.add(stg);
        } else {
          ng = ng + ei.totalGms!;
        }
      }
    });
    gg = ng + wg;
    return {
      "grossGms": gg.round(),
      "netGms": ng.round(),
      "waterGms": wg.round(),
      "listWaterIngs": lw,
    };
  }
}
