import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'sell_template_purchase_type_state.dart';

part 'sell_template_purchase_type_cubit.freezed.dart';

class SellTemplatePurchaseTypeCubit
    extends BaseCubit<SellTemplatePurchaseTypeState> {
  SellTemplatePurchaseTypeCubit({required super.context})
      : super(initialState: SellTemplatePurchaseTypeState.initial());
}
