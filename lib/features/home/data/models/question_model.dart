import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel extends Question {
  @JsonKey(name: 'title')
  final String titleField;

  @JsonKey(name: 'subtitle')
  final String subtitleField;

  @JsonKey(name: 'image_uri')
  final String imageUriField;

  QuestionModel({
    required int id,
    required this.titleField,
    required this.subtitleField,
    required this.imageUriField,
  }) : super(
          id: id,
          question: titleField,
          answer: subtitleField,
          imageUrl: imageUriField,
        );

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
