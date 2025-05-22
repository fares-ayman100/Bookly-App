import 'package:bookly_app/features/Search/data/repos/search_repo.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchRandomBooks() async {
    emit(SearchLoading());
    final response = await searchRepo.searchBook(query: 'popular books');
    response.fold(
      (failure) {
        emit(SearchFailure(errMessage: failure.errMessage));
      },
      (books) {
        if (books.isEmpty) {
          emit(SearchFailure(errMessage: 'No books found'));
        } else {
          emit(SearchSuccess(books: books));
        }
      },
    );
  }

  Future<void> fetchSearchBook(String query) async {
    if (query.trim().isEmpty) {
      await fetchRandomBooks();
      return;
    }

    emit(SearchLoading());
    final response = await searchRepo.searchBook(query: query);
    response.fold(
      (failure) {
        emit(SearchFailure(errMessage: failure.errMessage));
      },
      (books) {
        if (books.isEmpty) {
          emit(SearchFailure(errMessage: 'No books found for "$query"'));
        } else {
          emit(SearchSuccess(books: books));
        }
      },
    );
  }
}
