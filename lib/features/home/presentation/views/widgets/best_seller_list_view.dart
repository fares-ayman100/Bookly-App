import 'package:bookly_app/core/widget/custom_Circular_Indicator.dart';
import 'package:bookly_app/core/widget/custom_error.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: NewestBooksListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is NewestBooksFailuer) {
          return CustomError(errMessage: state.errMessage);
        } else {
          return CustomCircularIndicator();
        }
      },
    );
  }
}
