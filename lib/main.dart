import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yaho_coding_challenge/src/app/module/app_module.dart';
import 'package:yaho_coding_challenge/src/data/repository/user_repository.dart';
import 'package:yaho_coding_challenge/src/logic/cubit/home/home_cubit.dart';
import 'package:yaho_coding_challenge/src/presentation/screens/home_screen.dart';
import 'package:yaho_coding_challenge/src/resources/app_colors.dart';

final getIt = GetIt.instance;

void main() {
  AppModule.initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => HomeCubit(getIt.get<UserRepository>()),
        child: const HomeScreen(),
      ),
    );
  }
}
