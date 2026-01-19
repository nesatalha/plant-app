import 'package:json_annotation/json_annotation.dart';

part 'category_image_model.g.dart';

@JsonSerializable()
class CategoryImageModel {
  final String url;

  const CategoryImageModel({
    required this.url,
  });

  factory CategoryImageModel.fromJson(Map<String, dynamic> json) => _$CategoryImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryImageModelToJson(this);
}
