class Client {
  final int id;
  final String name;
  final String address;
  final int number;
  final String district;
  final int telephone;

  Client(
    this.id,
    this.name,
    this.address,
    this.number,
    this.district,
    this.telephone,
  );

  @override
  String toString() {
    return 'Client{id: $id, name: $name, adress: $address, number: $number, district: $district, telephone: $telephone,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'number': number,
      'district': district,
      'telephone': telephone

    };
  }
}
