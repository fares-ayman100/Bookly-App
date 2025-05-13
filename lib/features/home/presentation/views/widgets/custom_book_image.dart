import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.urlImaeg});
  final String urlImaeg;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 3.1,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouters.kBookDetails);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: 'urlImaeg',
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Icon(Icons.error, size: 34),
          ),
        )
      ),
    );
  }
}
