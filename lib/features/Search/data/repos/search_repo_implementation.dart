import 'package:bookly_app/core/errors/failuer.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/Search/data/repos/search_repo.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImplementation(this.apiServices);
  @override
  Future<Either<Failuer, List<BookModel>>> searchBook({
    required String query,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint: 'volumes?q=$query&filter=free-ebooks&orderBy=newest',
      );
      
      if (data == null) {
        return left(ServerError('No data received from the server'));
      }

      if (!data.containsKey('items')) {
        return right([]);
      }

      List<BookModel> books = [];
      var items = data['items'];
      if (items != null && items is List) {
        for (var book in items) {
          try {
            books.add(BookModel.fromJson(book));
          } catch (e) {
            continue;
          }
        }
      }
      
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioException(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
