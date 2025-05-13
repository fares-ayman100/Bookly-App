import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/core/utils/services_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
  
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FeaturedBooksCubit(getit.get<HomeRepoImplementation>())
                    ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create:
              (context) =>
                  NewestBooksCubit(getit.get<HomeRepoImplementation>())
                    
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme().apply(
            displayColor: Colors.white,
            bodyColor: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
