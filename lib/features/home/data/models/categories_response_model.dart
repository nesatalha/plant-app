import 'package:json_annotation/json_annotation.dart';
import 'package:plant_app/features/home/data/models/category_model.dart';

part 'categories_response_model.g.dart';

@JsonSerializable()
class CategoriesResponseModel {
  final List<CategoryModel> data;

  const CategoriesResponseModel({
    required this.data,
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) => _$CategoriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseModelToJson(this);
}
