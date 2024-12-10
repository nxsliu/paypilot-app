class Customer {
  String name;
  String email;
  String businessName;

  Customer(this.name, this.email, this.businessName);

  bool get isValid => name.isNotEmpty && email.isNotEmpty;
}
