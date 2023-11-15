import 'package:bookly_app/core/utils/asstes_variables.dart';
import 'package:flutter/material.dart';

class CustomHeaderListViewItem extends StatelessWidget {
  const CustomHeaderListViewItem({super.key});

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
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              AssetsVariables.bookingCoverImage,
            ),
          ),
        ),
      ),
    );
  }
}
