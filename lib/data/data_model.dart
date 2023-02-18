// To parse this JSON data, do
//
//     final branchModel = branchModelFromJson(jsonString);

import 'dart:convert';


class BranchModel {
  BranchModel({
    required this.pageProps,
    required this.nSsp,
  });

  PageProps pageProps;
  bool nSsp;

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
    pageProps: PageProps.fromJson(json["pageProps"]),
    nSsp: json["__N_SSP"],
  );

}

class PageProps {
  PageProps({
    required this.branches,
    required this.lang,
    required this.namespaces,
  });

  PagePropsBranches branches;
  String lang;
  Namespaces namespaces;

  factory PageProps.fromJson(Map<String, dynamic> json) => PageProps(
    branches: PagePropsBranches.fromJson(json["branches"]),
    lang: json["__lang"],
    namespaces: Namespaces.fromJson(json["__namespaces"]),
  );

}

class PagePropsBranches {
  PagePropsBranches({
    required this.branches,
    required this.count,
  });

  List<Branch> branches;
  String count;

  factory PagePropsBranches.fromJson(Map<String, dynamic> json) => PagePropsBranches(
    branches: List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
    count: json["count"],
  );

}

class Branch {
  Branch({
    required this.id,
    required this.shipperId,
    required this.name,
    required this.image,
    required this.phone,
    required this.isActive,
    required this.address,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.destination,
    required this.workHourStart,
    required this.workHourEnd,
    this.jowiId,
    required this.iikoId,
    required this.iikoTerminalId,
    required this.fareId,
    required this.tgChatId,
    this.geozoneId,
    this.geozone,
    required this.ordersLimit,
    required this.radiusWithoutDeliveryPrice,
    required this.realTimeOrdersAmount,
    this.fare,
    this.menuId,
    this.menuTitle,
    required this.crm,
  });

  String id;
  String shipperId;
  String name;
  String image;
  String phone;
  bool isActive;
  String address;
  Location location;
  DateTime createdAt;
  String updatedAt;
  String destination;
  String workHourStart;
  String workHourEnd;
  dynamic jowiId;
  String iikoId;
  String iikoTerminalId;
  String fareId;
  String tgChatId;
  dynamic geozoneId;
  dynamic geozone;
  String ordersLimit;
  int radiusWithoutDeliveryPrice;
  int realTimeOrdersAmount;
  dynamic fare;
  dynamic menuId;
  dynamic menuTitle;
  Crm crm;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    shipperId: json["shipper_id"],
    name: json["name"],
    image: json["image"],
    phone: json["phone"],
    isActive: json["is_active"],
    address: json["address"],
    location: Location.fromJson(json["location"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    destination: json["destination"],
    workHourStart: json["work_hour_start"],
    workHourEnd: json["work_hour_end"],
    jowiId: json["jowi_id"],
    iikoId: json["iiko_id"],
    iikoTerminalId: json["iiko_terminal_id"],
    fareId: json["fare_id"],
    tgChatId: json["tg_chat_id"],
    geozoneId: json["geozone_id"],
    geozone: json["geozone"],
    ordersLimit: json["orders_limit"],
    radiusWithoutDeliveryPrice: json["radius_without_delivery_price"],
    realTimeOrdersAmount: json["real_time_orders_amount"],
    fare: json["fare"],
    menuId: json["menu_id"],
    menuTitle: json["menu_title"],
    crm: crmValues.map[json["crm"]]!,
  );

}

enum Crm { NONE }

final crmValues = EnumValues({
  "none": Crm.NONE
});

class Location {
  Location({
    required this.long,
    required this.lat,
  });

  double long;
  double lat;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    long: json["long"]?.toDouble(),
    lat: json["lat"]?.toDouble(),
  );
}

class Namespaces {
  Namespaces({
    required this.common,
    required this.branches,
  });

  Map<String, String> common;
  NamespacesBranches branches;

  factory Namespaces.fromJson(Map<String, dynamic> json) => Namespaces(
    common: Map.from(json["common"]).map((k, v) => MapEntry<String, String>(k, v)),
    branches: NamespacesBranches.fromJson(json["branches"]),
  );
}

class NamespacesBranches {
  NamespacesBranches({
    required this.daily,
    required this.branches,
    required this.branch,
    required this.list,
    required this.map,
    required this.openingHours,
    required this.schedule,
    required this.address,
    required this.phoneNumber,
    required this.phone,
    required this.destination,
    required this.monSun,
    required this.openUntil,
    required this.closedUntil,
    required this.worksAroundTheClock,
    required this.orderPickup,
  });

  String daily;
  String branches;
  String branch;
  String list;
  String map;
  String openingHours;
  String schedule;
  String address;
  String phoneNumber;
  String phone;
  String destination;
  String monSun;
  String openUntil;
  String closedUntil;
  String worksAroundTheClock;
  String orderPickup;

  factory NamespacesBranches.fromJson(Map<String, dynamic> json) => NamespacesBranches(
    daily: json["daily"],
    branches: json["branches"],
    branch: json["branch"],
    list: json["list"],
    map: json["map"],
    openingHours: json["opening_hours"],
    schedule: json["schedule"],
    address: json["address"],
    phoneNumber: json["phone_number"],
    phone: json["phone"],
    destination: json["destination"],
    monSun: json["mon-sun"],
    openUntil: json["open_until"],
    closedUntil: json["closed_until"],
    worksAroundTheClock: json["works_around_the_clock"],
    orderPickup: json["order_pickup"],
  );

}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
