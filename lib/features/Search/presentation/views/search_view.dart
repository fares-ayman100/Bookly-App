import 'package:bookly_app/core/utils/services_locator.dart';
import 'package:bookly_app/features/Search/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/features/Search/presentation/manager/search/search_cubit.dart';
import 'package:bookly_app/features/Search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create:
              (context) => SearchCubit(getit.get<SearchRepoImplementation>()),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
