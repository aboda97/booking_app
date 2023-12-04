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
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imgurl),
          ),
        ),
      ),
    );
  }
}
