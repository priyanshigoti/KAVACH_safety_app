

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';


class ContactSearch extends StatefulWidget {
  @override
  _ContactSearchState createState() => _ContactSearchState();
}

class _ContactSearchState extends State<ContactSearch> {
  late Iterable<Contact> _contacts=[];
  late Iterable<Contact> _filteredContacts = [];
  TextEditingController _searchController = TextEditingController();
  List<Contact> _selectedContacts = [];

  @override
  void initState() {
    super.initState();
    _fetchContacts();
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
          (contact.displayName ?? '').toLowerCase().contains(query.toLowerCase())
      );

    });
  }


  //
  void _addContact(Contact contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invite Contact'),
          content: Text('Are you sure you want to invite ${contact.displayName}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _inviteContact(contact); // Add the contact after confirmation
              },
              child: Text('Yes',style: TextStyle(color: Color(0xFF4C2559)),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No',style: TextStyle(color: Color(0xFF4C2559)),),
            ),
          ],
        );
      },
    );
  }

  void _inviteContact(Contact contact) {
    setState(() {
      if (!_selectedContacts.contains(contact)) {
        _selectedContacts.add(contact);
      }
    });
  }

  void _removeContact(Contact contact) {
    setState(() {
      _selectedContacts.remove(contact);
    });
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
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: TextField(
  //         controller: _searchController,
  //         onChanged: _filterContacts,
  //         decoration: InputDecoration(
  //
  //           hintText: 'Search Contacts...',
  //           focusColor: Colors.black,
  //         ),
  //       ),
  //     ),
  //     body: _filteredContacts != null
  //         ? ListView.builder(
  //       itemCount: _filteredContacts.length,
  //       itemBuilder: (context, index) {
  //         Contact contact = _filteredContacts.elementAt(index);
  //         return ListTile(
  //           title: Text(contact.displayName ?? ''),
  //           onTap: () {
  //             _addContact(contact);
  //           },
  //         );
  //       },
  //     )
  //         : Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //     floatingActionButton: _selectedContacts.isNotEmpty
  //         ? FloatingActionButton.extended(
  //       onPressed: _viewSelectedContacts,
  //
  //
  //       label: Text('Add SOS Contacts',textAlign: TextAlign.center,),
  //     )
  //         : null,
  //   );
  // }
  @override
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
          cursorColor: Colors.black, // Set the cursor color to black
          style: TextStyle(color: Colors.black), // Set the text color to black
        ),
      ),

      body: _filteredContacts != null
          ? ListView.builder(
        itemCount: _filteredContacts.length,
        itemBuilder: (context, index) {
          Contact contact = _filteredContacts.elementAt(index);
          // Get the first letter of the contact's display name
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
        label: Text('Add SOS Contacts',textAlign: TextAlign.center,),
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
          return ListTile(
            title: Text(contact.displayName ?? ''),
            trailing: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  widget.onRemoveContact(contact);
                });
              },
            ),
          );
        },
      ),
    );
  }
}



