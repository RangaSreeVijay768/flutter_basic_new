import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'recieve_graphs_state.dart';

part 'recieve_graphs_cubit.freezed.dart';

class RecieveGraphsCubit extends BaseCubit<RecieveGraphsState> {
  RecieveGraphsCubit({required super.context})
      : super(initialState: RecieveGraphsState.initial());
}
