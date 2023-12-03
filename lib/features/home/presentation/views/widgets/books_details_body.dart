import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_header_image.dart';
import 'package:flutter/material.dart';

class BooksDetailsBody extends StatelessWidget {
  const BooksDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var widthOfView = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const BookDetailsCustomAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthOfView * .2),
              child: const CustomHeaderImage(
                  imgurl:
                      'https://m.media-amazon.com/images/I/914pEgyd14L._AC_UF1000,1000_QL80_.jpg'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              'Harry Potter Series',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle24.copyWith(fontFamily: kGTSectraFine),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              'J.K.Rowling',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
                const Text(
                  '4.8',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle18,
                ),
                Text(
                  '( 2390 )',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16.copyWith(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            const BookDetailsButton(),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'You can also like',
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CustomHeaderImage(
                    imgurl:
                        'https://m.media-amazon.com/images/I/914pEgyd14L._AC_UF1000,1000_QL80_.jpg',
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
