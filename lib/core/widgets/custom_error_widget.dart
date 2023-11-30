import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorMsg extends StatelessWidget {
  const CustomErrorMsg({super.key, required this.errMsg});
  final String errMsg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMsg,
        style: Styles.textStyle18.copyWith(
          color: Colors.red,
        ),
      ),
    );
  }
}
