import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_container_item.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16.0,
      ),
      child: SafeArea(
        child: ListView(
          children: const [
            CustomSearchTextFormField(),
            SizedBox(
              height: 24.0,
            ),
            Text(
              'Results',
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: 16.0,
            ),
            NewestBooksContainerItem(),
          ],
        ),
      ),
    );
  }
}
