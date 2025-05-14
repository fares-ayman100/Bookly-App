import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar_book_details.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                CustomAppBarBookDetails(),
                BookDetailsSection(),

                Expanded(child: const SizedBox(height: 50)),
                SimilarBooksSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

