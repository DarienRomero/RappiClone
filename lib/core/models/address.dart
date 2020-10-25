class Address {
  final String description;
  final String id;

  Address({
    this.description,
    this.id,
  });

  static Address fromJson(Map<String, dynamic> json, String documentID) {
    return Address(
      id: documentID,
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
      };
}
