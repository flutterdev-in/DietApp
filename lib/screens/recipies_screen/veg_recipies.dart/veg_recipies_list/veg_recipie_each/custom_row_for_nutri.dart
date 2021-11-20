import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRowforNutri extends StatelessWidget {
  CustomRowforNutri({Key? key}) : super(key: key);
  var _rData = Get.arguments;
  String? nID;
  int? precision;
  String? unit;
  late double startSize;
  late double endSize;
  late double textSizefact;
  CustomRowforNutri.forNE(
      {Key? key,
      required this.nID,
      this.precision = 1,
      this.unit = "g",
      this.startSize = 25,
      this.endSize = 60,
      this.textSizefact = 1.2})
      : super(key: key);
  CustomRowforNutri.forSNE(
      {Key? key,
      required this.nID,
      this.precision = 1,
      this.unit = "g",
      this.startSize = 40,
      this.endSize = 67,
      this.textSizefact = 1.2})
      : super(key: key);
  CustomRowforNutri.forE(
      {Key? key,
      required this.nID,
      this.precision = 1,
      this.unit = "g",
      this.startSize = 8,
      this.endSize = 3,
      this.textSizefact = 1.08})
      : super(key: key);
  CustomRowforNutri.forSE(
      {Key? key,
      required this.nID,
      this.precision = 1,
      this.unit = "g",
      this.startSize = 40,
      this.endSize = 68,
      this.textSizefact = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _rValue;
    try {
      _rValue = double.parse((_rData[nID!]!).toStringAsFixed(precision!));
    } catch (e) {
      _rValue = "     ";
    }

    return Row(mainAxisSize: MainAxisSize.max, children: [
      Container(
        width: startSize,
      ),
      Expanded(
        child: Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  nID!,
                  textScaleFactor: textSizefact,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "$_rValue $unit",
                  textScaleFactor: textSizefact,
                ),
              )
            ],
          ),
        ),
      ),
      Container(
        width: endSize,
      ),
    ]);
  }
}
