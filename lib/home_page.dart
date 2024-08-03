import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'item_bloc.dart';
import 'item_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items List'),
      ),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ItemLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.items[index].name),
                );
              },
            );
          } else if (state is ItemError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}
