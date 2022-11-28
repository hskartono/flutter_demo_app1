import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../utils/strings.dart';
import 'package:http/http.dart' as http;

class ContactEditPage extends StatefulWidget {
  final Contact contact;
  const ContactEditPage({super.key, required this.contact});

  @override
  State<ContactEditPage> createState() => _ContactEditPageState(contact);
}

class _ContactEditPageState extends State<ContactEditPage> {
  final Contact _contact;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _jobTitle = TextEditingController();
  final TextEditingController _accountOwner = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _telephone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _province = TextEditingController();
  final TextEditingController _city = TextEditingController();

  _ContactEditPageState(this._contact);

  bindData(Contact data) {
    _firstName.text = data.firstName;
    _lastName.text = data.lastName;
    _jobTitle.text = data.jobTitle;
    _accountOwner.text = data.owner;
    _email.text = data.email;
    _telephone.text = data.phone;
    _address.text = data.address;
    _country.text = data.country;
    _province.text = data.province;
    _city.text = data.city;
  }

  @override
  Widget build(BuildContext context) {
    bindData(_contact);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Edit Contact'),
          actions: [
            IconButton(
                onPressed: () {
                  submitData(_contact.id);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        body: ListView(
          children: [
            Form(
                key: _formKey,
                child: Container(
                    padding: const EdgeInsets.fromLTRB(32, 10, 32, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Personal Information',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )
                              ],
                            )),
                        const Divider(
                          color: Colors.grey,
                        ),
                        TextFormField(
                          controller: _firstName,
                          decoration: const InputDecoration(
                              hintText: 'This field is required',
                              labelText: 'First Name',
                              icon: Icon(Icons.person)),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'First name cannot empty';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _lastName,
                          decoration: const InputDecoration(
                              labelText: 'Last Name', icon: Icon(Icons.people)),
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          controller: _jobTitle,
                          decoration: const InputDecoration(
                              labelText: 'Job Title', icon: Icon(Icons.badge)),
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          controller: _accountOwner,
                          decoration: const InputDecoration(
                              labelText: 'Account Owner',
                              icon: Icon(Icons.account_box)),
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          controller: _email,
                          decoration: const InputDecoration(
                              labelText: 'Email', icon: Icon(Icons.email)),
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          controller: _telephone,
                          decoration: const InputDecoration(
                              labelText: 'Telephone', icon: Icon(Icons.phone)),
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Location',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )
                              ],
                            )),
                        const Divider(
                          color: Colors.grey,
                        ),
                        TextFormField(
                          controller: _address,
                          decoration: const InputDecoration(
                              labelText: 'Address', icon: Icon(Icons.home)),
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          controller: _country,
                          decoration: const InputDecoration(
                              labelText: 'Country', icon: Icon(Icons.flag)),
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          controller: _province,
                          decoration: const InputDecoration(
                              labelText: 'Province',
                              icon: Icon(Icons.local_attraction)),
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          controller: _city,
                          decoration: const InputDecoration(
                              labelText: 'City',
                              icon: Icon(Icons.location_city)),
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value) {
                            submitData(_contact.id);
                          },
                        ),
                      ],
                    ))),
          ],
        ));
  }

  submitData(int id) {
    if (_formKey.currentState!.validate()) {
      print('valid');
      updateContact(id).then((value) {
        setState(() {
          if (value) {
            print('sukses');
            Navigator.pop(context);
          }
        });
      });
      return true;
    } else {
      print('please check your input');
      return false;
    }
  }

  Future updateContact(int id) async {
    var apiUrl = '${Strings.baseApi}Contacts/$id';

    final Map data = {
      "id": id,
      "firstName": _firstName.text,
      "lastName": _lastName.text,
      "jobTitle": _jobTitle.text,
      "owner": _accountOwner.text,
      "email": _email.text,
      "phone": _telephone.text,
      "address": _address.text,
      "country": _country.text,
      "province": _province.text,
      "city": _city.text
    };

    // print("JSON Data: ${data}");

    await http.put(Uri.parse(apiUrl), body: jsonEncode(data), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    return true;
  }
}
