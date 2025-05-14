import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'similary_books_state.dart';

class SimilaryBooksCubit extends Cubit<SimilaryBooksState> {
  SimilaryBooksCubit(this.homeRepo) : super(SimilaryBooksInitial());
  HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(SimilaryBooksLoading());
    var response = await homeRepo.getFeautureBook();
    return response.fold(
      (failuer) {
        emit(SimilaryBooksFailuer(failuer.errMessage));
      },
      (books) {
        emit(SimilaryBooksSuccess(books));
      },
    );
  }
}
