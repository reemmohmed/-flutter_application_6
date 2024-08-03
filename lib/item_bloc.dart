import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'item_event.dart';
import 'item_state.dart';
import 'item_model.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial()) {
    on<LoadItems>(_onLoadItems);
  }

  void _onLoadItems(LoadItems event, Emitter<ItemState> emit) async {
    emit(ItemLoading());
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final List<dynamic> data = json.decode(response);
      final List<ItemModel> items =
          data.map((json) => ItemModel.fromJson(json)).toList();
      emit(ItemLoaded(items));
    } catch (e) {
      emit(ItemError('Failed to load items'));
    }
  }
}
