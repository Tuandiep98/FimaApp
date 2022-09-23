class CategoryUIModel {
  String id;
  String name;
  String code;
  String image;
  String imageBase64;
  double totalAmount;
  double targetOfMonth;
  double totalAllMonth;
  double percent;

  CategoryUIModel({
    this.id,
    this.name,
    this.code,
    this.image,
    this.imageBase64,
    this.totalAmount = 0,
    this.targetOfMonth = 0,
    this.totalAllMonth = 0,
    this.percent = 0,
  });
}
