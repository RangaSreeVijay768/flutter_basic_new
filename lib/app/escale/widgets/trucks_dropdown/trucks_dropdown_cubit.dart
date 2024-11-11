import 'package:basic/app/escale/widgets/sell_form_template/sell_form_template_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'trucks_dropdown_state.dart';
part 'trucks_dropdown_cubit.freezed.dart';

class TrucksDropdownCubit extends BaseCubit<TrucksDropdownState> {
TrucksDropdownCubit({required super.context}) : super(initialState:TrucksDropdownState.initial());
}
