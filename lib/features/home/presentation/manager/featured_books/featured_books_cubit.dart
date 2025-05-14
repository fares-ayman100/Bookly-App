import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var response = await homeRepo.fetchFeautureBook();
    return response.fold(
      (failuer) {
        emit(FeaturedBooksFailuer(failuer.errMessage));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
