import 'package:basic/app/core/api_url/api_url.dart';
import 'package:basic/app/core/services/usb_serial.dart';
import 'package:basic/app/escale/screens/bluetooth_printer_screen/bluetooth_printer_screen.dart';
import 'package:basic/app/escale/screens/escale_weight_screen/escale_weight_screen.dart';
import 'package:basic/app/escale/screens/escale_weight_screen/escale_weight_screen2.dart';
import 'package:basic/app/escale/screens/sell_page.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import 'popup_menu_button_widget_controller.dart';
import 'popup_menu_button_widget_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class PopupMenuButtonWidget
    extends BaseStatelessWidget<PopupMenuButtonWidgetController,
        PopupMenuButtonWidgetCubit,
        PopupMenuButtonWidgetState> {

  PopupMenuButtonWidget({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopupMenuButtonWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<PopupMenuButtonWidgetCubit,
          PopupMenuButtonWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            // padding: edge_insets_0,
            child: PopupMenuButton(
              // padding: edge_insets_0,
              elevation: 10,
              shadowColor: AppColors.textHeading,
              surfaceTintColor: AppColors.bgPrimary,
              constraints: const BoxConstraints(
                // minWidth: 90,
                maxWidth: 150,
              ),
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius.br_10),
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.textHeading,
              ),
              offset: const Offset(0.0, 60.0),
              itemBuilder: (BuildContext context) =>
              [
                // PopupMenuItem(
                //   child: Text("Connect Scale"),
                //   onTap: () async{
                //     connectUsbSerial();
                //   },
                // ),
                PopupMenuItem(
                  child: Text("PRINTER"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BluetoothPrinterScreen()));
                  },
                ),
                PopupMenuItem(
                  child: Text("LOGOUT"),
                  onTap: () {
                    getCubit(context).logout();
                    context.go("/welcome");
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  PopupMenuButtonWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    PopupMenuButtonWidgetCubit cubit = PopupMenuButtonWidgetCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
