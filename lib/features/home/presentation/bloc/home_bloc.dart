import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';
import 'package:plant_app/features/home/presentation/bloc/home_event.dart';
import 'package:plant_app/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeStateInitial()) {
    on<HomeEventLoadData>(_onLoadData);
  }

  Future<void> _onLoadData(
    HomeEventLoadData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeStateLoading());
    try {
      final categories = await homeRepository.getCategories();
      final questions = await homeRepository.getQuestions();
      emit(HomeStateLoaded(
        categories: categories,
        questions: questions,
      ));
    } catch (e) {
      emit(HomeStateError(message: e.toString()));
    }
  }
}
