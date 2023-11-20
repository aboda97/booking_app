import 'package:bookly_app/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_header_image.dart';
import 'package:flutter/material.dart';

class BooksDetailsBody extends StatelessWidget {
  const BooksDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var widthOfView = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const BookDetailsCustomAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthOfView * .2),
              child: const CustomHeaderImage(),
            ),
          ],
        ),
      ),
    );
  }
}
