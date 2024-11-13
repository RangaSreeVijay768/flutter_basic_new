import 'package:basic/app/core/controllers/base_controller.dart';
import 'sell_form_template_cubit.dart';

class SellFormTemplateController extends BaseController<SellFormTemplateCubit> {

  // bottomNavigationBar: Container(
  //   padding: edge_insets_y_10,
  //   decoration: const BoxDecoration(
  //       color: AppColors.white,
  //       boxShadow: [shadows.bs_primary]),
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         width: MediaQuery.of(context).size.width / 2,
  //         child: TextButton(
  //           style: TextButton.styleFrom(
  //             backgroundColor: AppColors.bgPrimary,
  //           ),
  //           onPressed: (state.loadingButton == true)
  //               ? null
  //               : () async {
  //             getCubit(context).setLoadingButtonStatus(true);
  //             var completedControllers = sellFormTemplateControllers
  //                 .where((controller) => controller.getChildCubit().isFormComplete())
  //                 .toList();
  //
  //             for (var controller in completedControllers) {
  //               await controller
  //                   .getChildCubit()
  //                   .createTransaction(controller.getChildCubit().createRequestData());
  //             }
  //
  //             sellFormTemplateControllers.clear();
  //             sellFormTemplateControllers.add(SellFormTemplateController());
  //
  //             await getAllTransactionsController
  //                 .getChildCubit()
  //                 .getAllTransactions(getAllTransactionsController.getChildCubit().createRequestData());
  //
  //             getCubit(context).setLoadingButtonStatus(false);
  //           },
  //           child: const Text(
  //             "Submit",
  //             style: TextStyle(color: AppColors.white),
  //           ),
  //         ),
  //       )
  //     ],
  //   ),
  // ),

}
