import 'package:bookly_app/features/Search/presentation/manager/search/search_cubit.dart';
import 'package:bookly_app/features/Search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/Search/presentation/views/widgets/search_list_view_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().fetchSearchBook('programming');
    super.initState();
  }
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
                SearchListViewResult(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
