class ProfileModel {
  final int id;
  final String name;
  final int age;
  final String joinDate;
  final String gender;
  final int pointCount;
  final String roll;
  final String catugery;
  final String phone;
  final String email;

  final String city;
  final String area;
  final String street;

  ProfileModel({
    required this.name,
    required this.age,
    required this.joinDate,
    required this.gender,
    required this.phone,
    required this.email,
    required this.city,
    required this.area,
    required this.street,
    required this.id,
    required this.pointCount,
    required this.roll,
    required this.catugery,
  });
}
