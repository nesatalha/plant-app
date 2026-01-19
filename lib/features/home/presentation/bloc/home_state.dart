import 'package:equatable/equatable.dart';
import 'package:plant_app/features/home/domain/entities/category.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  final List<Category> categories;
  final List<Question> questions;

  const HomeStateLoaded({
    required this.categories,
    required this.questions,
  });

  @override
  List<Object?> get props => [categories, questions];
}

class HomeStateError extends HomeState {
  final String message;

  const HomeStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
