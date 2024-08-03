import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'item_bloc.dart';
import 'item_event.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ItemBloc()..add(LoadItems()),
        child: const HomePage(),
      ),
    );
  }
}
