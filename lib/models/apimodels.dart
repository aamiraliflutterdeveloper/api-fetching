// To parse this JSON data, do
//
//     final shop = shopFromJson(jsonString);

import 'dart:convert';

Shop shopFromJson(String str) => Shop.fromJson(json.decode(str));

String shopToJson(Shop data) => json.encode(data.toJson());

class Shop {
  Shop({
    this.report,
    this.item,
    this.customer,
  });

  dynamic report;
  List<Item> item;
  List<Customer> customer;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    report: json["report"],
    item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
    customer: List<Customer>.from(json["customer"].map((x) => Customer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "report": report,
    "item": List<dynamic>.from(item.map((x) => x.toJson())),
    "customer": List<dynamic>.from(customer.map((x) => x.toJson())),
  };
}

class Customer {
  Customer({
    this.cuSCode,
    this.cuSName,
    this.cuSAddress,
    this.cuSPhoneNo,
    this.cuSMobile,
  });

  String cuSCode;
  String cuSName;
  dynamic cuSAddress;
  dynamic cuSPhoneNo;
  dynamic cuSMobile;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    cuSCode: json["cuS_CODE"],
    cuSName: json["cuS_NAME"],
    cuSAddress: json["cuS_ADDRESS"],
    cuSPhoneNo: json["cuS_PHONE_NO"],
    cuSMobile: json["cuS_MOBILE"],
  );

  Map<String, dynamic> toJson() => {
    "cuS_CODE": cuSCode,
    "cuS_NAME": cuSName,
    "cuS_ADDRESS": cuSAddress,
    "cuS_PHONE_NO": cuSPhoneNo,
    "cuS_MOBILE": cuSMobile,
  };
}

class Item {
  Item({
    this.iteMCode,
    this.iteMName,
    this.iteMBaseUnit,
    this.iteMRate,
    this.iteMType,
    this.discount,
  });

  String iteMCode;
  String iteMName;
  dynamic iteMBaseUnit;
  int iteMRate;
  dynamic iteMType;
  int discount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    iteMCode: json["iteM_CODE"],
    iteMName: json["iteM_NAME"],
    iteMBaseUnit: json["iteM_BASE_UNIT"],
    iteMRate: json["iteM_RATE"],
    iteMType: json["iteM_TYPE"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "iteM_CODE": iteMCode,
    "iteM_NAME": iteMName,
    "iteM_BASE_UNIT": iteMBaseUnit,
    "iteM_RATE": iteMRate,
    "iteM_TYPE": iteMType,
    "discount": discount,
  };
}
