class CategoryUIModel {
  String id;
  String name;
  int codePoint;
  String image;
  String imageBase64;
  double totalAmount;
  double targetOfMonth;
  double totalAllMonth;
  double percent;
  String fontFamilly;

  CategoryUIModel({
    this.id,
    this.name,
    this.codePoint,
    this.image,
    this.imageBase64,
    this.totalAmount = 0,
    this.targetOfMonth = 0,
    this.totalAllMonth = 0,
    this.percent = 0,
    this.fontFamilly = 'CupertinoIcons',
  });
}
