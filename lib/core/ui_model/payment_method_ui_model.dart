class PaymentMethodUIModel {
  String id;
  String name;
  int codePoint;
  String image;
  String imageBase64;
  String fontFamily;
  String emoji;
  String emojiCategory;

  PaymentMethodUIModel({
    this.id,
    this.name,
    this.codePoint,
    this.image,
    this.imageBase64,
    this.fontFamily,
    this.emoji = '',
    this.emojiCategory,
  });
}
