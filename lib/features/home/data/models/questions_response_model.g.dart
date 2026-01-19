// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsResponseModel _$QuestionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    QuestionsResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionsResponseModelToJson(
        QuestionsResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
