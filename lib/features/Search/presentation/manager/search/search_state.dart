part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookModel> books;

  const SearchSuccess({required this.books});
}

class SearchLoading extends SearchState {}

class SearchFailuer extends SearchState {
  final String errMessage;

  const SearchFailuer({required this.errMessage});
}
