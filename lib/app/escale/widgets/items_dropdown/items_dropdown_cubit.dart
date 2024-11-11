import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'items_dropdown_state.dart';

part 'items_dropdown_cubit.freezed.dart';

class ItemsDropdownCubit extends BaseCubit<ItemsDropdownState> {
  ItemsDropdownCubit({required super.context})
      : super(initialState: ItemsDropdownState.initial());
}
