import 'package:bookly_app/core/utils/services_locator.dart';
import 'package:bookly_app/features/Search/presentation/views/search_view.dart';
import 'package:bookly_app/features/Splash/presentation/Views/splash_view.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/manager/similary_books/similary_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const kHomeView = '/homeView';
  static const kBookDetails = '/bookDetails';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: kBookDetails,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      SimilaryBooksCubit(getit.get<HomeRepoImplementation>()),
              child: BookDetailsView(bookModel: state.extra as BookModel),
            ),
      ),
      GoRoute(path: kSearchView, builder: (context, state) => SearchView()),
    ],
  );
}
