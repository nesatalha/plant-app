import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final int id;
  final String question;
  final String answer;
  final String imageUrl;

  const Question({
    required this.id,
    required this.question,
    required this.answer,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [id, question, answer, imageUrl];
}
