class Company {
  int? id;
  String? name;
  String? website;
  String? owner;
  String? phone;
  int? industryId;
  // Null? industry;
  int? companyTypeId;
  // Null? companyType;
  int? companyStatusId;
  // Null? companyStatus;
  String? googleMapAddress;
  String? address;
  String? country;
  String? province;
  String? city;
  String? zipCode;

  Company(
      {id,
      name,
      website,
      owner,
      phone,
      industryId,
      // industry,
      companyTypeId,
      // companyType,
      companyStatusId,
      // companyStatus,
      googleMapAddress,
      address,
      country,
      province,
      city,
      zipCode});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    website = json['website'];
    owner = json['owner'];
    phone = json['phone'];
    industryId = json['industryId'];
    // industry = json['industry'];
    companyTypeId = json['companyTypeId'];
    // companyType = json['companyType'];
    companyStatusId = json['companyStatusId'];
    // companyStatus = json['companyStatus'];
    googleMapAddress = json['googleMapAddress'];
    address = json['address'];
    country = json['country'];
    province = json['province'];
    city = json['city'];
    zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['website'] = website;
    data['owner'] = owner;
    data['phone'] = phone;
    data['industryId'] = industryId;
    // data['industry'] = industry;
    data['companyTypeId'] = companyTypeId;
    // data['companyType'] = companyType;
    data['companyStatusId'] = companyStatusId;
    // data['companyStatus'] = companyStatus;
    data['googleMapAddress'] = googleMapAddress;
    data['address'] = address;
    data['country'] = country;
    data['province'] = province;
    data['city'] = city;
    data['zipCode'] = zipCode;
    return data;
  }
}
