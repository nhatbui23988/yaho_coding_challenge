import 'package:flutter/material.dart';
import 'package:yaho_coding_challenge/src/resources/app_colors.dart';

class LoadingMoreWidget extends StatelessWidget {
  const LoadingMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 12),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CircularProgressIndicator(color: kDarkPrimary,),
          ),
          Text("Loading more...")
        ],
      ),
    );
  }


}
