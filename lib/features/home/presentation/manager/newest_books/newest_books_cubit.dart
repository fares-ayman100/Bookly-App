import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var response = await homeRepo.fetchNewestBook();
    return response.fold(
      (failuer) {
        emit(NewestBooksFailuer(failuer.errMessage));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
