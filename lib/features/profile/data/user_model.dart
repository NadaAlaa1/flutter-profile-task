class UserModel {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final String phone;
  final String birthDate;
  final String gender;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.phone,
    required this.birthDate,
    required this.gender,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      phone: map['phone'] ?? '',
      birthDate: map['birthDate'] ?? '',
      gender: map['gender'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'phone': phone,
      'birthDate': birthDate,
      'gender': gender,
    };
  }

  UserModel copyWith({
  String? id,
  String? name,
  String? email,
  String? imageUrl,
  String? phone,
  String? birthDate,
  String? gender,
}) {
  return UserModel(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    imageUrl: imageUrl ?? this.imageUrl,
    phone: phone ?? this.phone,
    birthDate: birthDate ?? this.birthDate,
    gender: gender ?? this.gender,
  );
}

}

