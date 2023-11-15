import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/asstes_variables.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerContainerItem extends StatelessWidget {
  const BestSellerContainerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: Row(
        children: [
          AspectRatio(
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
          ),
           Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Harry Potter Series', //'Harry Potter Series and and The Globlet of Fire'
                style: Styles.textStyle18.copyWith(
                  fontFamily: kGTSectraFine
                ),
              ),
              const Text(
                'J.K Rowlling',
                style: Styles.textStyle14
              ),
            ],
          )
        ],
      ),
    );
  }
}
