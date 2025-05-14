import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar_home_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/features_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBarHomeView(),
                SizedBox(height: 12),
                FeaturesBooksListView(),
                SizedBox(height: 40),
                Text(
                  'Newest Books',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverFillRemaining(child: BooksListView()),
        ],
      ),
    );
  }
}
