// To parse this JSON data, do
//
//     final foodListModel = foodListModelFromJson(jsonString);

import 'dart:convert';

List<FoodListModel> foodListModelFromJson(String str) => List<FoodListModel>.from(json.decode(str).map((x) => FoodListModel.fromJson(x)));

String foodListModelToJson(List<FoodListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodListModel {
  FoodListModel({
    this.productId,
    this.productName,
    this.category,
    this.price,
  });

  final int productId;
  final String productName;
  final String category;
  final int price;

  factory FoodListModel.fromJson(Map<String, dynamic> json) => FoodListModel(
    productId: json["productID"] == null ? null : json["productID"],
    productName: json["productName"] == null ? null : json["productName"],
    category: json["category"] == null ? null : json["category"],
    price: json["price"] == null ? null : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "productID": productId == null ? null : productId,
    "productName": productName == null ? null : productName,
    "category": category == null ? null : category,
    "price": price == null ? null : price,
  };
}
