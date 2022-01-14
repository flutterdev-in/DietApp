class EachIng {
  num?  newAmount, totalGms, gmsPerUnit;
  String? webAmount,webUnit, webName, webNotes, newUnit, newName, fID;
  EachIng({
    this.webAmount,
    this.webUnit ,
    this.webName ,
    this.webNotes,
    this.newUnit ,
    this.newName,
    this.fID ,
    this.newAmount ,
    this.totalGms ,
    this.gmsPerUnit ,
  });
  factory EachIng.fromMap(Map eachIngMap) {
    return EachIng(
      webAmount: eachIngMap["webAmount"],
      webUnit: eachIngMap["webUnit"],
      webName: eachIngMap["webName"],
      webNotes: eachIngMap["webNotes"],
      newUnit: eachIngMap["newUnit"],
      newName: eachIngMap["newName"],
      fID: eachIngMap["fID"],
      newAmount: eachIngMap["newAmount"],
      totalGms: eachIngMap["totalGms"],
      gmsPerUnit: eachIngMap["gmsPerUnit"],
    );
  }

  Map<String, dynamic> toMap() => {
        "webAmount": webAmount,
        "webUnit": webUnit,
        "webName": webName,
        "webNotes": webNotes,
        "newUnit": newUnit,
        "newName": newName,
        "fID": fID,
        "newAmount": newAmount,
        "totalGms": totalGms,
        "gmsPerUnit": gmsPerUnit,
      };
}
