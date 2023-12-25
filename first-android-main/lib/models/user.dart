class User {
  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phone;
  String avatar;
  int provinceid;
  String provincename;
  int districtid;
  String districtname;
  int wardid;
  String wardname;
  String birthday;
  String address;
  // ignore: non_constant_identifier_names
  int role_id;
  String status;
  User({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    this.email = '',
    this.phone = '',
    this.avatar = '',
    this.provinceid = 0,
    this.provincename = '',
    this.districtid = 0,
    this.districtname = '',
    this.wardid = 0,
    this.wardname = '',
    this.birthday = "",
    this.address = "",
    // ignore: non_constant_identifier_names
    this.role_id = 0,
    this.status = "Active",
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      username: json['username'],
      email: json['email'],
      phone: json['phone'] ?? '',
      avatar: json['avatar'] ?? '',
      provinceid: json['provinceid'] ?? 0,
      provincename: json['provincename'] ?? '',
      districtid: json['districtid'] ?? 0,
      districtname: json['districtname'] ?? '',
      birthday: json['birthday'] ?? '',
      address: json['address'] ?? '',
      wardid: json['wardid'] ?? 0,
      wardname: json['wardname'] ?? '',
      role_id: json['role_id'],
      status: json['status'],
    );
  }
  factory User.fromUser(User value) {
    return User(
      id: value.id,
      firstName: value.firstName,
      lastName: value.lastName,
      username: value.username,
      email: value.email,
      phone: value.phone,
      avatar: value.avatar,
      provinceid: value.provinceid,
      provincename: value.provincename,
      districtid: value.districtid,
      districtname: value.districtname,
      wardid: value.wardid,
      wardname: value.wardname,
      birthday: value.birthday,
      address: value.address,
      role_id: value.role_id,
      status: value.status,
    );
  }
}
