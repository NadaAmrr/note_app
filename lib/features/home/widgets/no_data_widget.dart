import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_styles.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("there is no notes 😔", style: AppStyle.styleBold16),
        ],
      ),
    );
  }
}
