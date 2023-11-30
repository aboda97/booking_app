import 'package:bookly_app/core/widgets/custom_circluar_loading_indicator_widget.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_header_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CustomHeaderImage();
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorMsg(errMsg: state.featuredErrMsg);
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
