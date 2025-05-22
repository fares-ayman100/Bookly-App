import 'package:bookly_app/core/widget/custom_Circular_Indicator.dart';
import 'package:bookly_app/core/widget/custom_error.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          // Each item is 150px height + 20px padding (10px top + 10px bottom)
          final itemHeight = 170.0;
          return SizedBox(
            height: itemHeight * state.books.length,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: NewestBooksListViewItem(book: state.books[index]),
                );
              },
            ),
          );
        } else if (state is NewestBooksFailuer) {
          return CustomError(errMessage: state.errMessage);
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
