class Constants {
  static String applicationExeName = 'ecr_handheld_app_v2_window';
  static String fontFamily = "MyHelveticaNeue";

  // print line entity type
  static const int PrintLineText = 0;
  static const int PrintLineImage = 1;

  static const int printer_line_width = 32;

  // start print template attributes
  static const String TemplateGeneralDataCurrentDate = "General.currentDate";
  static const String TemplateGeneralDataDeviceId = "General.deviceid";
  static const String TemplateGeneralDataFromLocation = "General.fromLocation";
  static const String TemplateGeneralDataUser = "General.user";
  static const String TemplateGeneralDataLocationName = "SaleLocations.Name";
  static const String TemplateGeneralDataLocationSysId = "SaleLocations.SysID";
  static const String TemplateGeneralDataSaleZone = "General.saleZone";
  static const String TemplateGeneralDataTable = "General.table";
  static const String TemplateGeneralDataTableService = "General.tableservice";
  static const String TemplateGeneralDataTitle = "General.title";
  static const String TemplateGeneralDataAmount = "General.amount";

  static const String TemplateAccountFirstName = "Account.FirstName";
  static const String TemplateAccountLastName = "Account.LastName";
  static const String TemplateAccountFullName = "Account.FullName";

  static const String TemplateGeneralDataSaleNo = "General.saleNo";
  static const String TemplateGeneralDataBranchName = "branch.name";
  static const String TemplateTableColumnsEODGoods = "Goods";

  static const String TemplateTicketPrintName = "ticket.printName";
  static const String TemplateTicketDimensionName = "ticket.dimensionName";
  static const String TemplateTicketPrintText = "ticket.printText";
  static const String TemplateTicketDiscountedPrice = "ticket.discountedPrice";
  static const String TemplateTicketCurrency = "Currencies.name";
  static const String TemplateTicketQrCode = "QRCode";
  static const String TemplateTicketBarCode = "BarCode";
  static const String TemplateTicketOffer = "ticket.offer";

  //Ticketing print ticket
  static const String TemplateTicketBookingRef = "ticket.bookingRef";
  static const String TemplateTicketName = "ticket.name";
  static const String TemplateTicketDateTime = "ticket.dateTime";
  static const String TemplateTicketSubTotal = "ticket.subtotal";
  static const String TemplateTicketDetails = "TicketDetails";
  static const String TemplatePassengerTypeName = "PassengerTypeName";
  static const String TemplateQuantity = "Quantity";
  static const String TemplatePrice = "Price";
  static const String TemplateSeat = "Seat";
  static const String TemplateTicketDate = "ticket.date";
  static const String TemplateTicketTime = "ticket.time";

  //Sale Receipt
  static const String TemplateReceiptPaidBy = "SaleReceipt.paidBy";
  static const String TemplateTotal = "SaleReceipt.total";
  static const String TemplateCardPurchased = "SaleReceipt.cardPurchase";
  static const String TemplateAmountPaid = "SaleReceipt.amountPaid";
  static const String TemplateChange = "SaleReceipt.change";
  static const String TemplateCashRefundStatus = "SaleReceipt.cashRefundStatus";
  static const String TemplateReceiptCardType = "SaleReceipt.cardType";
  static const String TemplateStatus = "SaleReceipt.status";
  static const String TemplateCardMid = "SaleReceipt.mid";
  static const String TemplateCardTid = "SaleReceipt.tid";
  static const String TemplateCardAid = "SaleReceipt.aid";
  static const String TemplateCardAuthNumber = "SaleReceipt.authNumber";
  static const String TemplateCardTxnNumber = "SaleReceipt.txnNumber";
  static const String TemplateCardExpiredDate = "SaleReceipt.cardExpireDate";
  static const String TemplateReceiptSubtotal = "SaleReceipt.SubTotal";

  static const String TemplateTaxDetailTableName = "Sales.Taxes";
  static const String TemplateMerchantTableName = "Tax Price";
  static const String TemplateTableColumnsItem = "item";
  static const String TemplateTableColumnsTaxRate = "taxRate";
  static const String TemplateTableColumnsCurrency = "currency";
  static const String TemplateTableColumnsExTax = "exTax";
  static const String TemplateTableColumnsTax = "ItemsTax";
  static const String TemplateTableColumnsValue = "value";
  static const String TemplateTableColumnsGoods = "ItemsAmount";
  static const String TemplateTableColumnsTaxName = "Label";
  static const String TemplateTableColumnsQTY = "QTY";
  static const String TemplateTableColumnsVAT = "Vat";
  static const String TemplateTableColumnsEODValue = "Value";

  static const String TemplateMerchantTaxTotal = "MerchantCopy.taxTotal";
  static const String TemplateExRateTotal = "MerchantCopy.exTaxTotal";
  static const String TemplateGoodsTotal = "MerchantCopy.goodsTotal";

  static const String TemplateSaleTableName = "Sales";
  static const String TemplateSaleColumnsDocumentNo = "DocumentNo";

  static const String TemplateSaleDetailsTableName = "SaleDetails";
  static const String TemplateSaleDetailsSumQty = "SumQTY";
  static const String TemplateSaleDetailsProductPrintName = "ProductPrintName";
  static const String TemplateSaleDetailsTaxLabel = "TaxLabel";
  static const String TemplateSaleDetailsSumPrice = "SumPrice";

  static const String TemplatePaymentTableName = "Payments";
  static const String TemplatePaymentDescriptionPOS = "DescriptionPOS";
  static const String TemplatePaymentCurrencyName = "DocCurrencyName";
  static const String TemplatePaymentCurrencyAmount = "DocCurrencyAmount";

  // Declaration Types
  static const String TemplateDeclarationDetailTable = "DeclarationDetails";
  static const String TemplateDeclarationTableName = "Declaration";
  static const String TemplateTableColumnsLabel = "Label";
  static const String TemplateTableColumnsDeclared = "Declared";
  static const String TemplateTableColumnsCalculatedQTY = "CalculatedQTY";
  static const String TemplateTableColumnsDiff = "Diff";
  static const String TemplateTableColumnsCalculatedAmount = "CalculatedAmount";
  static const String TemplateEndOfDayVATTable = "Table2";
  static const String TemplateEndOfDayRefundTable = "Table3";
  static const String TemplateEndOfDayDiscountTable = "Table4";
  static const String TemplateEndOfDaySaleDetailTable = "Table";

  //Ticket form
  static const String TemplateTicketFormProductName = "Sale.ProductName";
  static const String TemplateTicketFormTotalPrice = "Sale.TotalPrice";
  static const String TemplateTicketFormCustomerName = "Customer.FullName";
  static const String TemplateTicketFormPhoneNo = "Customer.PhoneNo";
  static const String TemplateTicketFormTicketDay = "Customer.Day";
  static const String TemplateTicketFormTicketDate = "Customer.Date";
  static const TemplateTicketFormTicketTime = "Customer.Time";
  static const TemplateTicketFormRowSeat = "Customer.RowSeat";
  static const TemplateTicketFormCustomerLocation = "Customer.Location";
  static const TemplateTicketFormAdult = "Customer.Adult";
  static const TemplateTicketFormSenior = "Customer.Senior";
  static const TemplateTicketFormChild = "Customer.Child";
  static const TemplateTicketFormStudent = "Customer.Student";
  static const TemplateTicketFormComments = "Customer.Comments";
  static const TemplateTicketFormSupplier = "Customer.Supplier";

  //for card only
  static const String TemplateCardNumber = "saleReceipt.cardNumber";
  static const String DECLARATION_EXTERNAL_PDQ = "External PDQ";
  static const String DECLARATION_ONACCOUNT = "On Account";

  static const String TemplateSaleDetailsProductCode = "ProductCode";

  static const String TemplateGeneralDataUserFirstName = "Operator.FirstName";
  static const String TemplateGeneralDataUserFullName = "Operator.FullName";
  static const String TemplateGeneralDataCashierCode = "operator.code";
  static const String TemplateGeneralDataUserLastName = "Operator.LastName";

  //Optomany Receipt
  static const String TemplateOptomanyReceiptMerchantName =
      "OptomanySaleReceipt.merchantName";
  static const String TemplateOptomanyReceiptMerchantLocation =
      "OptomanySaleReceipt.merchantLocation";
  static const String TemplateOptomanyReceiptTransDateTime =
      "OptomanySaleReceipt.transDateTime";
  static const String TemplateOptomanyReceiptPaymentId =
      "OptomanySaleReceipt.paymentId";
  static const String TemplateOptomanyReceiptMerchantId =
      "OptomanySaleReceipt.merchantId";
  static const String TemplateOptomanyReceiptTerminalId =
      "OptomanySaleReceipt.terminalId";
  static const String TemplateOptomanyReceiptEmvAid =
      "OptomanySaleReceipt.emvAid";
  static const String TemplateOptomanyReceiptNumber =
      "OptomanySaleReceipt.receiptNumber";
  static const String TemplateOptomanyReceiptAppSeq =
      "OptomanySaleReceipt.appSeq";
  static const String TemplateOptomanyReceiptCardType =
      "OptomanySaleReceipt.cardType";
  static const String TemplateOptomanyReceiptCardScheme =
      "OptomanySaleReceipt.cardScheme";
  static const String TemplateOptomanyReceiptCardPan =
      "OptomanySaleReceipt.cardPan";
  static const String TemplateOptomanyReceiptTransType =
      "OptomanySaleReceipt.transType";
  static const String TemplateOptomanyReceiptAmountTrans =
      "OptomanySaleReceipt.amountTrans";
  static const String TemplateOptomanyReceiptTransApproved =
      "OptomanySaleReceipt.transApproved";
  static const String TemplateOptomanyReceiptResponseCode =
      "OptomanySaleReceipt.responseCode";
  static const String TemplateOptomanyReceiptCvmPinVerified =
      "OptomanySaleReceipt.cvmPinVerified";
  static const String TemplateOptomanyReceiptTransApprovedLabel =
      "OptomanySaleReceipt.transApprovedLabel";
  static const String TemplateOptomanyReceiptAuthorisationCode =
      "OptomanySaleReceipt.authorisationCode";

  //end print template attributes

  static const String DECLARATION_CASH = "Cash";
  static const String DECLARATION_CARD = "Card";
  static const String DECLARATION_REFUND = "Refunds";
  static const String TENDER_DISCOUNT = "Discount";
  static const String TENDER_VOUCHER = "Voucher";
  static const String DECLARATION_FLOAT = "Float";
  static const String DECLARATION_CREDITNOTE = "Credit Note";

  // Backup
  static const String BackUpData = 'BackUpData';

  // Validation rule
  static const String SAME_DAY_RETURN = "same day return";
  static const String NO_VALIDATION = "no validation";
  static const String VALID_FOR_ONE_CALENDAR_DAY = "valid for one calendar day";
  static const String SINGLE_USE = "single use";
  static const String VALID_FOR_THREE_MONTHS = "valid for 3 months";
  static const String DAY_TICKET = "day ticket";
  static const String EXPLORER_PASS = "explorer pass";
}

class TicketingPosSettingKey {
  static const basketTimeout = "Timeout - mins";
  static const printMerchantReceiptCopy = "Print Merchant Copy";
  static const ticketPrintingType = "Ticket printing type";
  static const floatType = 'Float';
  static const reasonRequired = 'Reason required?';
}

class PosSettingKey {
  static const backgroundSyncFrequency = "Background sync frequency";
  static const endOfDayReport = "End of day report";
  static const refundWithCreditNote = "Refund with credit note";
  static const printMerchantReceiptCopy = "Print Merchant Copy";
  static const openPrice = 'Open price';
  static const eODCashDeclaration = 'EOD Cash declaration';
  static const outOfStockWarning = 'Out of stock warning';
  static const floatType = 'Float';
  static const reasonRequired = 'Reason required?';
}

class WinBuildConfig {
  static const debug = "DEBUG";
  static const release = "RELEASE";
}

class PaymentProvider {
  static const redCard = 'RedCard';
  static const optomany = 'Optomany';
}

class PaymentByCardStatus {
  static const declined = 'Declined';
  static const approved = 'Approved';
}
