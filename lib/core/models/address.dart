class Address {
  final String description;

  Address({this.description});

  static Address fromJson(Map<String, dynamic> json) {
    return Address(
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
      };
}
