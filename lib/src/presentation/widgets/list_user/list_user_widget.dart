


import 'package:flutter/material.dart';
import 'package:yaho_coding_challenge/src/data/model/user_information.dart';
import 'package:yaho_coding_challenge/src/presentation/widgets/list_user/user_infor_widget.dart';
import 'package:yaho_coding_challenge/src/presentation/widgets/loading_more_widget.dart';

class ListUserWidget extends StatelessWidget {
  const ListUserWidget({Key? key, required this.listData, required this.controller}) : super(key: key);
  final List<UserInformation> listData;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: listData.length,
      padding:
      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemBuilder: (_, index) {
        final userInfo = listData[index];
        if (userInfo is LoadingMore) {
          return const LoadingMoreWidget();
        } else {
          return UserInforWidget(
              userInformation: userInfo, index: index );
        }
      },
    );
  }
}
