import 'package:plant_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plant_app/features/home/domain/entities/category.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getCategories() async {
    try {
      final responseModels = await remoteDataSource.getCategories();
      return responseModels
          .expand((response) => response.data)
          .map((categoryModel) => Category(
                id: categoryModel.id,
                name: categoryModel.name,
                imageUrl: categoryModel.imageUrl,
              ))
          .toList();
    } catch (e) {
      throw Exception('Failed to get categories: $e');
    }
  }

  @override
  Future<List<Question>> getQuestions() async {
    try {
      final responseModels = await remoteDataSource.getQuestions();
      return responseModels
          .expand((response) => response.data)
          .map((questionModel) => Question(
                id: questionModel.id,
                question: questionModel.question,
                answer: questionModel.answer,
                imageUrl: questionModel.imageUrl,
              ))
          .toList();
    } catch (e) {
      throw Exception('Failed to get questions: $e');
    }
  }
}
