import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_image_item.dart';
import 'package:bookly_app/features/home/data/models/book_home_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestContainerItem extends StatelessWidget {
  const NewestContainerItem({super.key, required this.bookHomeModel});
  final BookHomeModel bookHomeModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBooksDetailsView,
          extra: bookHomeModel,
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 150.0,
            child: Row(
              children: [
                CustomImageItem(
                    imgurl:
                        bookHomeModel.volumeInfo.imageLinks?.thumbnail ?? ''),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookHomeModel.volumeInfo.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle18
                            .copyWith(fontFamily: kGTSectraFine),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(bookHomeModel.volumeInfo.authors![0],
                        style: Styles.textStyle14),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        const Text('Free', style: Styles.textStyle20),
                        const SizedBox(
                          width: 22.0,
                        ),
                        const SizedBox(
                          width: 80.0,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rate,
                              size: 24,
                              color: Colors.amberAccent,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                                '${bookHomeModel.volumeInfo.averageRating?.round() ?? 0}',
                                style: Styles.textStyle16),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                                '( ${bookHomeModel.volumeInfo.ratingsCount ?? 0} )',
                                style: Styles.textStyle14
                                    .copyWith(color: Colors.grey)),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Divider(
              color: Colors.white,
              thickness: .3,
            ),
          ),
        ],
      ),
    );
  }
}
