class CompanyContact {
  int? id;
  int? contactId;
  int? companyId;

  CompanyContact({this.id, this.contactId, this.companyId});

  CompanyContact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contactId = json['contactId'];
    companyId = json['companyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contactId'] = contactId;
    data['companyId'] = companyId;
    return data;
  }
}
