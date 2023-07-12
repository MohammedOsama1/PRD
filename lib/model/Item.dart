class Item {
  int? iD;
  String? category;
  String? productTitle;
  int? price;
  int? productRate;
  String? countryOfOrigin;
  String? manufacturer;
  int? reviewsNumber;
  String? neutral;
  String? negative;
  String? positive;
  int? catId;
  String? image;
  String? createdAt;
  String? updatedAt;

  Item(
      {this.iD,
        this.category,
        this.productTitle,
        this.price,
        this.productRate,
        this.countryOfOrigin,
        this.manufacturer,
        this.reviewsNumber,
        this.neutral,
        this.negative,
        this.positive,
        this.catId,
        this.image,
        this.createdAt,
        this.updatedAt});

  Item.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    category = json['Category'];
    productTitle = json['productTitle'];
    price = json['Price'];
    productRate = json['ProductRate'];
    countryOfOrigin = json['countryOfOrigin'];
    manufacturer = json['Manufacturer'];
    reviewsNumber = json['ReviewsNumber'];
    neutral = json['Neutral'];
    negative = json['Negative'];
    positive = json['Positive'];
    catId = json['cat_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}