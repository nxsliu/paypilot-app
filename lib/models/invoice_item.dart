class InvoiceItem {
  String? id;
  String? name;
  double unitCost = 0.00;
  double quantity = 1;
  bool GST = false;

  InvoiceItem(this.id);

  InvoiceItem.fullInit(
      this.id, this.name, this.unitCost, this.quantity, this.GST);

  bool get isValid =>
      name != null && name!.isNotEmpty && unitCost > 0 && quantity > 0;

  double get totalNoGSTAmount => unitCost * quantity;

  double get totalGSTAmount => unitCost * quantity * (GST ? 0.1 : 0);

  double get totalAmount => totalAmount + totalNoGSTAmount;
}
