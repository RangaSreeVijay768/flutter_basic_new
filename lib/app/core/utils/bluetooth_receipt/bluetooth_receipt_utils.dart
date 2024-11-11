import 'package:basic/app/escale/models/transactions_by_customer_id_models.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:intl/intl.dart';

import '../../../escale/request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_response.dart';



class BluetoothReceiptUtils{

  static String generateBarcodeContent(int customerId) {
    String customerIdStr = customerId.toString().padLeft(6, '0');

    final now = DateTime.now();
    String formattedDate = "${now.day.toString().padLeft(2, '0')}${now.month.toString().padLeft(2, '0')}${now.year.toString().substring(2)}";

    return "$customerIdStr$formattedDate";
  }



  static List<LineText> getPrintReceiptText(String customerName, List<GetTransactionsByCustomerIdResponse> transactions, String barcodeContent) {
    double totalCost = 0;
    List<LineText> list = [];

    list.add(LineText(type: LineText.TYPE_TEXT, content: customerName, align: LineText.ALIGN_CENTER, weight: 1, fontZoom: 3, linefeed: 1));

    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final time = DateFormat('HH:mm:ss').format(DateTime.now());

    list.add(LineText(type: LineText.TYPE_TEXT, content: date, align: LineText.ALIGN_LEFT, fontZoom: 2, linefeed: 0));
    list.add(LineText(type: LineText.TYPE_TEXT, content: time, align: LineText.ALIGN_RIGHT, fontZoom: 2, linefeed: 1));

    list.add(LineText(content: '--------------------------------', align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));
    list.add(LineText(type: LineText.TYPE_TEXT, content: "Items       Bags   Kg      Amount", align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));
    list.add(LineText(content: '--------------------------------', align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));

    for (var trans in transactions) {
      totalCost += trans.cost!;
      String bags = trans.totalBags.toString().padLeft(3, ' ');
      String weight = trans.totalWeight!.toStringAsFixed(2).padLeft(5, ' ');
      String cost = trans.cost!.toStringAsFixed(0);

      list.add(LineText(type: LineText.TYPE_TEXT, content: trans.items!.trim(), align: LineText.ALIGN_LEFT, fontZoom: 2, linefeed: 0));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '$bags  $weight', align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 0));
      list.add(LineText(type: LineText.TYPE_TEXT, content: cost, align: LineText.ALIGN_RIGHT, fontZoom: 2, linefeed: 1));
    }

    list.add(LineText(content: '--------------------------------', align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));
    list.add(LineText(type: LineText.TYPE_TEXT, content: "TOTAL", align: LineText.ALIGN_LEFT, fontZoom: 3, linefeed: 0));
    list.add(LineText(type: LineText.TYPE_TEXT, content: "Rs $totalCost", align: LineText.ALIGN_RIGHT, weight: 1, fontZoom: 3, linefeed: 1));
    list.add(LineText(content: '--------------------------------', align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));

    list.add(LineText(type: LineText.TYPE_BARCODE, content: barcodeContent, align: LineText.ALIGN_CENTER, height: 60, width: 2, linefeed: 1));
    list.add(LineText(type: LineText.TYPE_TEXT, content: "Powered By @Sabzisetu", align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));
    list.add(LineText(content: '--------------------------------', align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));

    return list;
  }

}
