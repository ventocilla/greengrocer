import 'package:greengrocer/src/config/app_data.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';

class ItemModel {
  String itemName;
  String imgUrl;
  String unit;
  double price;
  String description;

  ItemModel({
    required this.itemName,
    required this.imgUrl,
    required this.unit,
    required this.price,
    required this.description,
  });
}
