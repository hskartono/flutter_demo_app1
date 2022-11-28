import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:open_crm/models/contact.dart';
import 'package:http/http.dart' as http;
import 'package:open_crm/screens/contact_create_page.dart';
import 'package:open_crm/screens/contact_detail_page.dart';
import 'package:open_crm/utils/strings.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ContactListPage> {
  final List<Contact> _contacts = [];

  Future<List<Contact>> getAll() async {
    var url = '${Strings.baseApi}Contacts';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      _contacts.clear();
    }
    var decodedData = jsonDecode(response.body);
    for (var u in decodedData) {
      _contacts.add(Contact.fromJson(u));
    }

    return _contacts;
  }

  @override
  Widget build(BuildContext context) {
    // getAll();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      body: FutureBuilder(
        future: getAll(),
        builder: ((context, AsyncSnapshot<List<Contact>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(_contacts[index].firstName),
                  subtitle: Text(_contacts[index].jobTitle),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      deleteContact(_contacts[index].id);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactDetailPage(
                                contact: _contacts[index]))).then((value) {
                      setState(() {});
                    });
                  },
                );
              });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContactCreatePage()))
              .then((value) {
            setState(() {});
          });
        },
        tooltip: 'Create Contact',
        child: const Icon(Icons.add),
      ),
    );
  }

  deleteContact(int id) async {
    var apiUrl = '${Strings.baseApi}Contacts/$id';
    await http.delete(Uri.parse(apiUrl)).then((value) {
      setState(() {});
    });
  }
}
