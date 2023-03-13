import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaho_coding_challenge/src/app/const/app_const.dart';
import 'package:yaho_coding_challenge/src/data/model/user_information.dart';
import 'package:yaho_coding_challenge/src/logic/cubit/home/home_cubit.dart';
import 'package:yaho_coding_challenge/src/presentation/screens/home_screen.dart';
import 'package:yaho_coding_challenge/src/presentation/widgets/grid_user/user_infor_grid_item_widget.dart';
import 'package:yaho_coding_challenge/src/presentation/widgets/loading_more_widget.dart';

class GridUserWidget extends StatefulWidget {
  const GridUserWidget(
      {Key? key, required this.listData, required this.controller})
      : super(key: key);
  final List<UserInformation> listData;
  final ScrollController controller;

  @override
  State<GridUserWidget> createState() => _GridUserWidgetState();
}

class _GridUserWidgetState extends State<GridUserWidget> {
  ScrollController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    _loadMore();
  }

  @override
  void didUpdateWidget(covariant GridUserWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
        controller: widget.controller,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 0.9
        ),
        itemCount: widget.listData.length,
        itemBuilder: (_, index) {
          final userInfo = widget.listData[index];
          if (userInfo is LoadingMore) {
            return const LoadingMoreWidget();
          } else {
            return UserInforGridItemWidget(
                userInformation: userInfo, index: index);
          }
        });
  }

  void _loadMore() {
    if (BlocProvider.of<HomeCubit>(context).isAllowLoadMore()) {
      if (controller.position.extentAfter < AppConst.threshold) {
        BlocProvider.of<HomeCubit>(context).getUserNextPage();
      }
    }
  }
}
