import 'package:flutter/material.dart';
import 'package:open_crm/screens/contact_edit_page.dart';
import '../models/contact.dart';

class ContactDetailPage extends StatelessWidget {
  final Contact contact;

  const ContactDetailPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    const fontCaptionStyle = TextStyle(fontSize: 12, color: Colors.grey);
    const fontContentStyle = TextStyle(fontSize: 14);
    return Scaffold(
        appBar: AppBar(
          title: Text(contact.firstName),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ContactEditPage(contact: contact)))
                      .then((value) => Navigator.pop(context));
                },
                icon: const Icon(Icons.edit))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 20),
          children: [
            Center(
              child: Text(contact.jobTitle),
            ),
            const Icon(Icons.person),
            const Divider(
              color: Colors.grey,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(32, 5, 32, 32),
              child: Row(children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('First Name',
                                    style: fontCaptionStyle),
                                Text(contact.firstName,
                                    style: fontContentStyle),
                                const Divider(
                                  color: Colors.grey,
                                )
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Last Name',
                                    style: fontCaptionStyle),
                                Text(contact.lastName, style: fontContentStyle),
                                const Divider(
                                  color: Colors.grey,
                                )
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Job Title',
                                    style: fontCaptionStyle),
                                Text(contact.jobTitle, style: fontContentStyle),
                                const Divider(
                                  color: Colors.grey,
                                )
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Owner', style: fontCaptionStyle),
                                Text(contact.owner, style: fontContentStyle),
                                const Divider(
                                  color: Colors.grey,
                                )
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Email', style: fontCaptionStyle),
                                Text(contact.email, style: fontContentStyle),
                                const Divider(
                                  color: Colors.grey,
                                )
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
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
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Address', style: fontCaptionStyle),
                                Text(contact.address, style: fontContentStyle),
                                const Divider(
                                  color: Colors.grey,
                                )
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Country',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(contact.country, style: fontContentStyle),
                                const Divider(
                                  color: Colors.grey,
                                )
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Province', style: fontCaptionStyle),
                                Text(contact.province, style: fontContentStyle),
                                const Divider(
                                  color: Colors.grey,
                                )
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('City', style: fontCaptionStyle),
                                Text(contact.city, style: fontContentStyle),
                                const Divider(
                                  color: Colors.grey,
                                )
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Zipcode', style: fontCaptionStyle),
                                Text(contact.zipCode, style: fontContentStyle),
                                const Divider(
                                  color: Colors.grey,
                                )
                              ],
                            )),
                      ]),
                )
              ]),
            )
          ],
        ));
  }
}
