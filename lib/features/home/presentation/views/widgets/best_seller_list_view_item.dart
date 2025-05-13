import 'package:bookly_app/constant.dart';

import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
class NewestBooksListViewItem extends StatelessWidget {
  const NewestBooksListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 125,
          child: CustomBookImage(
            urlImaeg: bookModel.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  bookModel.volumeInfo.title!,
                  style: Styles.textStyle20.copyWith(
                    fontFamily: kGtSectraFine,
                    fontSize: 25,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                bookModel.volumeInfo.authors![0],
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    'Free',
                    style: Styles.textStyle16.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  BooksRating(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
