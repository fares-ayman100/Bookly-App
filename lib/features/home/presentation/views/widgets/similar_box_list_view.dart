import 'package:bookly_app/core/widget/custom_Circular_Indicator.dart';
import 'package:bookly_app/core/widget/custom_error.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/similary_books/similary_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilaryBooksCubit, SimilaryBooksState>(
      builder: (context, state) {
        if (state is SimilaryBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(
                    urlImaeg:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        '',
                    bookModel: bookModel,
                  ),
                );
              },
            ),
          );
        } else if (state is SimilaryBooksFailuer) {
          return CustomError(errMessage: state.errMessage);
        } else {
          return CustomCircularIndicator();
        }
      },
    );
  }
}
