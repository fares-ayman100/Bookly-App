import 'package:bookly_app/core/utils/functions/launch.dart';
import 'package:bookly_app/core/widget/custom_buttom.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButtom(
              backgroundColor: Colors.white,
              text: 'Free',
              textcolor: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButtom(
              onPressed: () async {
                if (bookModel.volumeInfo.previewLink != null) {
                  await launchCustomerUrl(
                    context,
                    bookModel.volumeInfo.previewLink!,
                  );
                }
              },
              backgroundColor: const Color(0xffEF8262),
              text: getText(bookModel),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
