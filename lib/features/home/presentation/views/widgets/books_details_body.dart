import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_circluar_loading_indicator_widget.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/data/models/book_home_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly_app/core/widgets/custom_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksDetailsBody extends StatelessWidget {
  const BooksDetailsBody({super.key, required this.bookHomeModel});

  final BookHomeModel bookHomeModel;

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
              child: CustomImageItem(
                imgurl: bookHomeModel.volumeInfo.imageLinks?.thumbnail ?? '',
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              bookHomeModel.volumeInfo.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle24.copyWith(fontFamily: kGTSectraFine),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              bookHomeModel.volumeInfo.authors?[0] ?? '',
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
                Text(
                  '${bookHomeModel.volumeInfo.averageRating ?? 0}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle18,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  '( ${bookHomeModel.volumeInfo.ratingsCount ?? 0} )',
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
            BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
              builder: (context, state) {
                if (state is SimilarBooksSuccess) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .25,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.similarBooksData.length,
                      itemBuilder: (context, index) {
                        return CustomImageItem(
                          imgurl: state.similarBooksData[index].volumeInfo
                                  .imageLinks?.thumbnail ??
                              '',
                        );
                      },
                    ),
                  );
                } else if (state is SimilarBooksFailure) {
                  return Center(
                    child: CustomErrorMsg(errMsg: state.similarErrMsg),
                  );
                } else {
                  return const Center(
                    child: CustomCircularIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
