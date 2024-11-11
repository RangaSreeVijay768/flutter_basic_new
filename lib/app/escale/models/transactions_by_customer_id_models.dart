class TransactionsByCustomerIdModels {
  int? customerid;
  int? truckid;
  String? items;
  String? totalBags;
  int? totalWeight;
  int? cost;

  TransactionsByCustomerIdModels(
      {this.customerid,
        this.truckid,
        this.items,
        this.totalBags,
        this.totalWeight,
        this.cost});

  TransactionsByCustomerIdModels.fromJson(Map<String, dynamic> json) {
    customerid = json['customerid'];
    truckid = json['truckid'];
    items = json['items'];
    totalBags = json['totalBags'];
    totalWeight = json['totalWeight'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this.customerid;
    data['truckid'] = this.truckid;
    data['items'] = this.items;
    data['totalBags'] = this.totalBags;
    data['totalWeight'] = this.totalWeight;
    data['cost'] = this.cost;
    return data;
  }
}
