class TransactionsByTruckCustomerModel {
  int? wt;
  String? bg;

  TransactionsByTruckCustomerModel({this.wt, this.bg});

  TransactionsByTruckCustomerModel.fromJson(Map<String, dynamic> json) {
    wt = json['wt'];
    bg = json['bg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wt'] = this.wt;
    data['bg'] = this.bg;
    return data;
  }
}
