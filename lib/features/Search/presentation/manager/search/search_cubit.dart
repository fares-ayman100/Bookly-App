import 'package:bookly_app/features/Search/data/repos/search_repo.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> fetchSearchBook(String query) async {
    emit(SearchLoading());
    final response = await searchRepo.searchBook(query: query);
    response.fold(
      (failuer) {
        emit(SearchFailuer(errMessage: failuer.errMessage));
      },
      (books) {
        emit(SearchSuccess(books: books));
      },
    );
  }
}
