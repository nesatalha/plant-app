import 'package:json_annotation/json_annotation.dart';
import 'package:plant_app/features/home/data/models/question_model.dart';

part 'questions_response_model.g.dart';

@JsonSerializable()
class QuestionsResponseModel {
  final List<QuestionModel> data;

  const QuestionsResponseModel({
    required this.data,
  });

  factory QuestionsResponseModel.fromJson(Map<String, dynamic> json) => _$QuestionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseModelToJson(this);
}
