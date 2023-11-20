import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsButton extends StatelessWidget {
  const BookDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        bottomLeft: Radius.circular(16.0))),
                child: Center(
                  child: Text(
                    '19.99\$',
                    style: Styles.textStyle18.copyWith(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                    color: Color(0xffEF8262),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0))),
                child: const Center(
                  child: Text(
                    'Free Preview',
                    style: Styles.textStyle18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
