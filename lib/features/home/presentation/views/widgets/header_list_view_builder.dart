import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_circluar_loading_indicator_widget.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/core/widgets/custom_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HeaderListViewBuilder extends StatelessWidget {
  const HeaderListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.featuredBooksData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBooksDetailsView,
                        extra: state.featuredBooksData[index],
                      );
                    },
                    child: CustomImageItem(
                      imgurl: state.featuredBooksData[index].volumeInfo
                              .imageLinks?.thumbnail ??
                          '',
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: CustomErrorMsg(errMsg: state.featuredErrMsg),
          );
        } else {
          return const Center(
            child: CustomCircularIndicator(),
          );
        }
      },
    );
  }
}
