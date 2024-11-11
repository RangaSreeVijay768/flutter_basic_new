import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'sell_template_truck_table_widget_state.dart';

part 'sell_template_truck_table_widget_cubit.freezed.dart';

class SellTemplateTruckTableWidgetCubit
    extends BaseCubit<SellTemplateTruckTableWidgetState> {
  SellTemplateTruckTableWidgetCubit({required super.context})
      : super(initialState: SellTemplateTruckTableWidgetState.initial());
}
