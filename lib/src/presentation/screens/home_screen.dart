import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaho_coding_challenge/src/app/const/app_const.dart';
import 'package:yaho_coding_challenge/src/logic/cubit/home/home_cubit.dart';
import 'package:yaho_coding_challenge/src/logic/cubit/home/home_state.dart';
import 'package:yaho_coding_challenge/src/presentation/widgets/grid_user/grid_user_widget.dart';
import 'package:yaho_coding_challenge/src/presentation/widgets/list_user/list_user_widget.dart';
import 'package:yaho_coding_challenge/src/resources/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController controller;


  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
    BlocProvider.of<HomeCubit>(context).getUserFirstPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: kPrimary,
      ),
      body: Center(
        child: BlocConsumer<HomeCubit, HomeState>(
          builder: (_, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator();
            } else {
              final listData = state.listUserInformation;
              if (state.displayType == DisplayType.list) {
                return ListUserWidget(
                    listData: listData, controller: controller);
              } else {
                return GridUserWidget(
                  listData: listData,
                  controller: controller,
                );
              }
            }
          },
          listener: (_, state) {
            if (state.appError != null) {}
          },
        ),
      ),
      floatingActionButton: _switchTypeFloatButton(),
    );
  }

  Widget _switchTypeFloatButton() => FloatingActionButton(
        onPressed: () {
          BlocProvider.of<HomeCubit>(context).switchDisplayType();
        },
        backgroundColor: kSecondary,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.displayType == DisplayType.list) {
              return const Icon(Icons.list);
            } else {
              return const Icon(Icons.grid_on);
            }
          },
        ),
      );

  void _scrollListener() {
    if (BlocProvider.of<HomeCubit>(context).isAllowLoadMore()) {
      if (controller.position.extentAfter < AppConst.threshold) {
        BlocProvider.of<HomeCubit>(context).getUserNextPage();
      }
    }
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }
}
