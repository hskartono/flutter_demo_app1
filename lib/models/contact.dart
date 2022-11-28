class Contact {
  int id = 0;
  String firstName = '';
  String lastName = '';
  String jobTitle = '';
  String owner = '';
  String email = '';
  String phone = '';
  String googleMapAddress = '';
  String address = '';
  String country = '';
  String province = '';
  String city = '';
  String zipCode = '';
  int accountStatusId = 0;
  // Null? accountStatus;
  int accountSourceId = 0;
  // Null? accountSource;
  // List<Null>? companies;

  Contact({
    id,
    firstName,
    lastName,
    jobTitle,
    owner,
    email,
    phone,
    googleMapAddress,
    address,
    country,
    province,
    city,
    zipCode,
    accountStatusId,
    // accountStatus,
    accountSourceId,
    // accountSource,
    // companies
  });

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    jobTitle = json['jobTitle'];
    owner = json['owner'];
    email = json['email'];
    phone = json['phone'];
    googleMapAddress =
        (json['googleMapAddress'] == null) ? "" : json['googleMapAddress'];
    address = json['address'];
    country = json['country'];
    province = json['province'];
    city = json['city'];
    zipCode = (json['zipCode'] == null) ? '' : json['zipCode'];
    accountStatusId =
        (json['accountStatusId'] == null) ? 0 : json['accountStatusId'];
    // accountStatus = json['accountStatus'];
    accountSourceId =
        (json['accountSourceId'] == null) ? 0 : json['accountSourceId'];
    // accountSource = json['accountSource'];
    // if (json['companies'] != null) {
    //   companies = <company>[];
    //   json['companies'].forEach((v) {
    //     companies!.add(company.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['jobTitle'] = jobTitle;
    data['owner'] = owner;
    data['email'] = email;
    data['phone'] = phone;
    data['googleMapAddress'] = googleMapAddress;
    data['address'] = address;
    data['country'] = country;
    data['province'] = province;
    data['city'] = city;
    data['zipCode'] = zipCode;
    data['accountStatusId'] = accountStatusId;
    // data['accountStatus'] = accountStatus;
    data['accountSourceId'] = accountSourceId;
    // data['accountSource'] = accountSource;
    // if (companies != null) {
    //   data['companies'] = companies!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
