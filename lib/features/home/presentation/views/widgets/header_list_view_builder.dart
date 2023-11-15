import 'package:bookly_app/features/home/presentation/views/widgets/custom_header_list_view_item.dart';
import 'package:flutter/material.dart';

class HeaderListViewBuilder extends StatelessWidget {
  const HeaderListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
        return const CustomHeaderListViewItem();
      }),
    );
  }
}