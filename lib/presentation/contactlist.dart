import 'dart:math';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactSearch extends StatefulWidget {
  @override
  _ContactSearchState createState() => _ContactSearchState();
}

class _ContactSearchState extends State<ContactSearch> {
  late Iterable<Contact> _contacts = [];
  late Iterable<Contact> _filteredContacts = [];
  TextEditingController _searchController = TextEditingController();
  List<Contact> _selectedContacts = [];

  @override
  void initState() {
    super.initState();
    _fetchContacts();
    _retrieveSelectedContacts();
  }

  Future<void> _fetchContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
      _filteredContacts = _contacts;
    });
  }

  void _filterContacts(String query) {
    setState(() {
      _filteredContacts = _contacts.where((contact) =>
          (contact.displayName ?? '').toLowerCase().contains(query.toLowerCase()));
    });
  }

  Future<void> _retrieveSelectedContacts() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('selected_contacts').get();
      List<Contact> selectedContacts = [];
      querySnapshot.docs.forEach((doc) {
        String displayName = doc['displayName'];
        selectedContacts.add(Contact(displayName: displayName));
      });
      setState(() {
        _selectedContacts = selectedContacts;
      });
    } catch (e) {
      print('Error retrieving selected contacts from Firestore: $e');
    }
  }

  void _addContact(Contact contact) async {
    setState(() {
      if (!_selectedContacts.contains(contact)) {
        _selectedContacts.add(contact);
      }
    });
    try {
      await FirebaseFirestore.instance.collection('selected_contacts').add({
        'displayName': contact.displayName,
      });
    } catch (e) {
      print('Error adding contact to Firestore: $e');
    }
  }

  void _removeContact(Contact contact) async {
    setState(() {
      _selectedContacts.remove(contact);
    });
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('selected_contacts')
          .where('displayName', isEqualTo: contact.displayName)
          .get();
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    } catch (e) {
      print('Error removing contact from Firestore: $e');
    }
  }

  void _viewSelectedContacts() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectedContactsPage(
          selectedContacts: _selectedContacts,
          onRemoveContact: _removeContact,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _filterContacts,
          decoration: InputDecoration(
            hintText: 'Search Contacts...',
            focusColor: Colors.black,
          ),
          cursorColor: Colors.black,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _filteredContacts != null
          ? ListView.builder(
        itemCount: _filteredContacts.length,
        itemBuilder: (context, index) {
          Contact contact = _filteredContacts.elementAt(index);
          String firstLetter = contact.displayName != null && contact.displayName!.isNotEmpty
              ? contact.displayName![0].toUpperCase()
              : '';
          return ListTile(
            title: Text(contact.displayName ?? ''),
            leading: CircleAvatar(
              backgroundColor: _generateRandomColor(),
              child: Text(firstLetter),
            ),
            onTap: () {
              _addContact(contact);
            },
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: _selectedContacts.isNotEmpty
          ? FloatingActionButton.extended(
        onPressed: _viewSelectedContacts,
        label: Text('Add SOS Contacts', textAlign: TextAlign.center,),
      )
          : null,
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
  }
}

class SelectedContactsPage extends StatefulWidget {
  final List<Contact> selectedContacts;
  final Function(Contact) onRemoveContact;

  SelectedContactsPage({
    required this.selectedContacts,
    required this.onRemoveContact,
  });

  @override
  _SelectedContactsPageState createState() => _SelectedContactsPageState();
}

class _SelectedContactsPageState extends State<SelectedContactsPage> {
  void _removeContact(Contact contact) {
    setState(() {
      widget.selectedContacts.remove(contact);
    });
    widget.onRemoveContact(contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Contacts'),
      ),
      body: ListView.builder(
        itemCount: widget.selectedContacts.length,
        itemBuilder: (context, index) {
          Contact contact = widget.selectedContacts[index];
          String firstLetter = contact.displayName != null && contact.displayName!.isNotEmpty
              ? contact.displayName![0].toUpperCase()
              : '';
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
            child: Card(
              color: Colors.purple.shade50,
              child:  ListTile(
                title: Text(contact.displayName ?? ''),
                leading: CircleAvatar(
                  backgroundColor: _generateRandomColor(),
                  child: Text(firstLetter),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    _removeContact(contact);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
  }
}