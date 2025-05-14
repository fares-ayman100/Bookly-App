part of 'similary_books_cubit.dart';

abstract class SimilaryBooksState extends Equatable {
  const SimilaryBooksState();

  @override
  List<Object> get props => [];
}

class SimilaryBooksInitial extends SimilaryBooksState {}

class SimilaryBooksSuccess extends SimilaryBooksState {
  final List<BookModel> books;

  const SimilaryBooksSuccess(this.books);
}

class SimilaryBooksFailuer extends SimilaryBooksState {
  final String errMessage;

  const SimilaryBooksFailuer(this.errMessage);
}

class SimilaryBooksLoading extends SimilaryBooksState {}
