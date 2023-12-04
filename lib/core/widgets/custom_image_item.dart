import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageItem extends StatelessWidget {
  final String imgurl;
  const CustomImageItem({super.key, required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 3 / 4,
        child: Container(
          margin: const EdgeInsets.only(
            right: 16.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imgurl,
              placeholder: (context, url) => Image.asset(
                'assets/images/loading_image.png',
                color: Colors.white,
              ),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/images/no_image.png'),
            ),
          ),
        ));
  }
}
