import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

part 'popup_menu_button_widget_state.dart';

part 'popup_menu_button_widget_cubit.freezed.dart';

class PopupMenuButtonWidgetCubit extends BaseCubit<PopupMenuButtonWidgetState> {
  PopupMenuButtonWidgetCubit({required super.context})
      : super(initialState: PopupMenuButtonWidgetState.initial());
}
