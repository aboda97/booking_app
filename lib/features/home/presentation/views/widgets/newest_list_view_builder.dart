import 'package:bookly_app/core/widgets/custom_circluar_loading_indicator_widget.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_container_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListViewBuilder extends StatelessWidget {
  const NewestListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.newestBooksData.length,
            itemBuilder: (context, item) {
              return NewestContainerItem(
                bookHomeModel: state.newestBooksData[item],
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorMsg(errMsg: state.newestErrMsg);
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
