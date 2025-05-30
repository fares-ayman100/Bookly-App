part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksSuccess(this.books);
}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksFailuer extends FeaturedBooksState {
  final String errMessage;

  const FeaturedBooksFailuer(this.errMessage);
}
