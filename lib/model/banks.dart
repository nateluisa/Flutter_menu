class Bank {
  final int id;
  final String name;
  final int agency;
  final int account;

  Bank(
    this.id,
    this.name,
    this.agency,
    this.account,
  );

  @override
  String toString() {
    return 'Bank{id: $id, name: $name, agency: $agency, account: $account}';
  }
}
