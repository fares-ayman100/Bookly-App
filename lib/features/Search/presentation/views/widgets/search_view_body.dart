import 'package:bookly_app/features/Search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/Search/presentation/views/widgets/search_list_view_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomSearchTextField(),
                const SizedBox(height: 5),
                SearchListViewResult(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

