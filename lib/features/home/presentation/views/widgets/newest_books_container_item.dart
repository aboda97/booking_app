import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/asstes_variables.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_circluar_loading_indicator_widget.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewestBooksContainerItem extends StatelessWidget {
  const NewestBooksContainerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, item) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBooksDetailsView);
                },
                child: Column(
                  children: [
                    SizedBox(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .5,
                                child: Text(
                                  'Harry Potter Series and and The Goblet of Fire',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.textStyle18
                                      .copyWith(fontFamily: kGTSectraFine),
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const Text('J.K.Rowlling',
                                  style: Styles.textStyle14),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                children: [
                                  const Text('19.9 \$',
                                      style: Styles.textStyle20),
                                  const SizedBox(
                                    width: 22.0,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.star_rate,
                                          size: 24,
                                          color: Colors.amberAccent,
                                        ),
                                      ),
                                      const Text('4.8',
                                          style: Styles.textStyle16),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Text('( 2390 )',
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
