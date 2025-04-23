class SubsEntity {
  int? id;
  String? fullName;
  String? waterMeterSN;
  String? category;
  String? area;
  String? address;
}

class EntitlementsEntity {
  int? entitlNo; //رقم الاستحقاق
  int? id;
  DateTime? entitlDate; //تاريخ اخذ الاستحقاق
  String? entitlMonth; //شهر الاستحقاق
  int? beginMeter; //بداية العداد
  int? endMeter; //نهاية العداد
  int? amount; //كمية الاستهلاك
  int? price; //المبلغ المستحق
  bool? entitlemented; //هل تم الدفع
  EntitlementsEntity({
    this.entitlNo,
    this.id,
    this.entitlDate,
    this.entitlMonth,
    this.beginMeter,
    this.endMeter,
    this.amount,
    this.price,
    this.entitlemented,
  });
}

class PaymentsEntity {
  int? payNo;
  int? id;
  DateTime? payDate;
  int? entitlNo;
  PaymentsEntity({
    required this.entitlNo,
    required this.id,
    required this.payDate,
    required this.payNo,
  });
}
