import 'package:plant_app/features/home/domain/entities/category.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:plant_app/features/home/data/models/category_image_model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Category {
  @JsonKey(name: 'title')
  final String titleField;

  @JsonKey(name: 'image')
  final CategoryImageModel imageField;

  CategoryModel({
    required int id,
    required this.titleField,
    required this.imageField,
  }) : super(
          id: id,
          name: titleField,
          imageUrl: imageField.url,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
