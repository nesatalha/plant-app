import 'dart:convert';

import 'package:plant_app/core/constants/api_constants.dart';
import 'package:plant_app/core/network/network_manager.dart';
import 'package:plant_app/features/home/data/models/categories_response_model.dart';
import 'package:plant_app/features/home/data/models/question_model.dart';
import 'package:plant_app/features/home/data/models/questions_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoriesResponseModel>> getCategories();
  Future<List<QuestionsResponseModel>> getQuestions();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final NetworkManager networkManager;

  HomeRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<List<CategoriesResponseModel>> getCategories() async {
    try {
      final response = await networkManager.get(ApiConstants.getCategories);
      final decodedData = jsonDecode(response.data);

      if (decodedData is Map<String, dynamic>) {
        return [CategoriesResponseModel.fromJson(decodedData)];
      }
      throw Exception('Invalid response format: expected Map');
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  @override
  Future<List<QuestionsResponseModel>> getQuestions() async {
    try {
      final response = await networkManager.get(ApiConstants.getQuestions);
      final decodedData = jsonDecode(response.data);

      if (decodedData is List) {
        final questions = decodedData.map((json) => QuestionModel.fromJson(json as Map<String, dynamic>)).toList();
        return [QuestionsResponseModel(data: questions)];
      }
      throw Exception('Invalid response format: expected List');
    } catch (e) {
      throw Exception('Failed to load questions: $e');
    }
  }
}
