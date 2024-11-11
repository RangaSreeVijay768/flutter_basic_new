import 'package:basic/app/escale/widgets/get_all_customers/get_all_customers_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

part 'customer_screen_state.dart';

part 'customer_screen_cubit.freezed.dart';

class CustomerScreenCubit extends BaseCubit<CustomerScreenState> {
  CustomerScreenCubit({required super.context})
      : super(initialState: CustomerScreenState.initial());
}
