import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/forgot/forgot.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ForgotBloc(),
        ),
        // BlocProvider(
        //   create: (context) => TransferBloc(),
        // ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trans Evilz',
        home: SplashScreen(),
      ),
    );
  }
}
