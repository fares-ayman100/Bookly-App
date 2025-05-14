import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.urlImaeg,
    required this.bookModel,
  });
  final String urlImaeg;
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 3.1,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouters.kBookDetails, extra: bookModel);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: urlImaeg,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Icon(Icons.error, size: 34),
          ),
        ),
      ),
    );
  }
}
