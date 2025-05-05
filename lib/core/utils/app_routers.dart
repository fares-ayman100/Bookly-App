import 'package:bookly_app/features/Splash/presentation/Views/splash_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_details_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const kHomeView = '/homeView';
  static const kBookDetails = '/bookDetails';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: kBookDetails,
        builder: (context, state) => BookDetailsView(),
      ),
    ],
  );
}
