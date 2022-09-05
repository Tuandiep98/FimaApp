class TransactionUIModel {
  String categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  int amount;
  int type;
  String currencyId;
  String currencySymbol;
  String note;
  String bank;

  TransactionUIModel({
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.amount,
    this.type,
    this.currencyId,
    this.currencySymbol,
    this.note,
    this.bank,
  });
}
