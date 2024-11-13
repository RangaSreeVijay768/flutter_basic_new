class Trucks {
  int? id;
  String? number;
  String? name;
  String? items;
  int? weight;
  int? lotsize;
  int? currentlotsize;
  double? currentweight;
  String? status;
  DateTime? createdAt;  // Changed to DateTime
  DateTime? updatedAt;  // Changed to DateTime
  int? shopId;
  int? userId;

  Trucks(
      {this.id,
        this.number,
        this.name,
        this.items,
        this.weight,
        this.lotsize,
        this.currentlotsize,
        this.currentweight,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.shopId,
        this.userId});

  // Method to create a Truck instance from JSON
  Trucks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    name = json['name'];
    items = json['items'];
    weight = json['weight'];
    lotsize = json['lotsize'];
    currentlotsize = json['currentlotsize'];
    currentweight = json['currentweight'];
    status = json['status'];

    // Parse DateTime fields from string to DateTime objects
    createdAt = json['createdAt'] != null
        ? DateTime.parse(json['createdAt'])
        : null;
    updatedAt = json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'])
        : null;

    shopId = json['shopId'];
    userId = json['userId'];
  }

  // Method to convert Truck instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['name'] = this.name;
    data['items'] = this.items;
    data['weight'] = this.weight;
    data['lotsize'] = this.lotsize;
    data['currentlotsize'] = this.currentlotsize;
    data['currentweight'] = this.currentweight;
    data['status'] = this.status;

    // Convert DateTime to string when converting to JSON
    data['createdAt'] = this.createdAt?.toIso8601String();
    data['updatedAt'] = this.updatedAt?.toIso8601String();

    data['shopId'] = this.shopId;
    data['userId'] = this.userId;
    return data;
  }
}
