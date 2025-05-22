import 'package:bookly_app/core/widget/custom_Circular_Indicator.dart';
import 'package:bookly_app/features/Search/presentation/manager/search/search_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListViewResult extends StatelessWidget {
  const SearchListViewResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) {
        // Only rebuild if the state type changes or if we have new books
        if (previous is SearchSuccess && current is SearchSuccess) {
          return previous.books != current.books;
        }
        return previous.runtimeType != current.runtimeType;
      },
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: NewestBooksListViewItem(book: state.books[index]),
              );
            },
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search_off, size: 50, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  state.errMessage,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
