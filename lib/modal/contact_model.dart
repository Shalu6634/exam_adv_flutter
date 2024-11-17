class ContactModal {
  String? id;
  String name, phone, email;

  ContactModal(
      {this.id, required this.name, required this.phone, required this.email});

  Map<String, String> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  factory ContactModal.fromMap(Map m1) {
    return ContactModal(id: m1['id'],
        name: m1['name'], phone: m1['phone'], email: m1['email']);
  }
}
