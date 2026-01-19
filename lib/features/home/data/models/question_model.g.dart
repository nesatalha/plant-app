// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      id: (json['id'] as num).toInt(),
      titleField: json['title'] as String,
      subtitleField: json['subtitle'] as String,
      imageUriField: json['image_uri'] as String,
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.titleField,
      'subtitle': instance.subtitleField,
      'image_uri': instance.imageUriField,
    };
