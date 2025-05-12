import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repos.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    var result = await homeRepo.getNewestBook();
    return result.fold(
      (failuer) {
        failuer.errMessage;
      },
      (books) {
        books;
      },
    );
  }
}
