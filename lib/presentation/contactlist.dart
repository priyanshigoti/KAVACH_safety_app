

import 'dart:math';
import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth package
import 'package:cloud_firestore/cloud_firestore.dart';

// Define a class to handle user authentication
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in anonymously
  Future<User?> signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print("Error signing in anonymously: $e");
      return null;
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

// Define a class to manage contacts
class ContactManager {
  final CollectionReference contactCollection =
  FirebaseFirestore.instance.collection('contacts');

  // Add contact to Firestore
  Future<void> addContact(String displayName) async {
    try {
      User? user = AuthService().getCurrentUser();
      if (user != null) {
        await contactCollection
            .doc(user.uid)
            .collection('selected_contacts')
            .doc(displayName) // Use displayName as document ID
            .set({'displayName': displayName});
      }
    } catch (e) {
      print("Error adding contact: $e");
    }
  }

  // Remove contact from Firestore
  Future<void> removeContact(String displayName) async {
    try {
      User? user = AuthService().getCurrentUser();
      if (user != null) {
        await contactCollection
            .doc(user.uid)
            .collection('selected_contacts')
            .doc(displayName)
            .delete();
      }
    } catch (e) {
      print("Error removing contact: $e");
    }
  }

  // Retrieve user contacts from Firestore
  Stream<QuerySnapshot> getUserContacts() {
    User? user = AuthService().getCurrentUser();
    if (user != null) {
      return contactCollection
          .doc(user.uid)
          .collection('selected_contacts')
          .snapshots();
    } else {
      return Stream.empty();
    }
  }
}

// Define ContactSearch widget
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
    _fetchSelectedContacts();
  }

  Future<void> _fetchContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
      _filteredContacts = _contacts;
    });
  }

  Future<void> _fetchSelectedContacts() async {
    try {
      Stream<QuerySnapshot> snapshot = ContactManager().getUserContacts();
      snapshot.listen((QuerySnapshot querySnapshot) {
        setState(() {
          _selectedContacts.clear();
          querySnapshot.docs.forEach((doc) {
            String displayName = doc.get('displayName');
            Contact contact = _contacts.firstWhere(
                    (element) => element.displayName == displayName,
                orElse: () => Contact(displayName: displayName));
            _selectedContacts.add(contact);
          });
        });
      });
    } catch (e) {
      print("Error fetching selected contacts: $e");
    }
  }

  void _filterContacts(String query) {
    setState(() {
      _filteredContacts = _contacts.where((contact) =>
          (contact.displayName ?? '')
              .toLowerCase()
              .contains(query.toLowerCase()));
    });
  }

  Future<void> _showAddContactDialog(Contact contact) async {
    String displayName = contact.displayName ?? '';
    if (_selectedContacts.any((c) => c.displayName == displayName)) {
      // Contact is already added, show alert dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Contact Already Added'),
            content: Text('This contact has already been added.'),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4C2559),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: Text('OK',style: TextStyle(color: Colors.white),),
              ),
            ],
          );
        },
      );
    } else {
      // Contact is not added, show confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Contact'),
            content: Text('Do you want to add $displayName?'),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: Text('No',style: TextStyle(color: Color(0xFF4C2559)),),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4C2559),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  _addContact(contact);
                  Navigator.of(context).pop(); // Close dialog
                },
                child: Text('Yes',style: TextStyle(color: Colors.white),),
              ),
            ],
          );
        },
      );
    }
  }

  void _addContact(Contact contact) async {
    ContactManager().addContact(contact.displayName ?? '');
    setState(() {
      _selectedContacts.add(contact);
    });
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
          ),
        ),
      ),
      body: _filteredContacts != null
          ? ListView.builder(
        itemCount: _filteredContacts.length,
        itemBuilder: (context, index) {
          Contact contact = _filteredContacts.elementAt(index);
          String firstLetter = contact.displayName != null &&
              contact.displayName!.isNotEmpty
              ? contact.displayName![0].toUpperCase()
              : '';
          return ListTile(
            title: Text(contact.displayName ?? ''),
            leading: CircleAvatar(
              backgroundColor: _generateRandomColor(),
              child: Text(firstLetter),
            ),
            onTap: () {
              _showAddContactDialog(contact);
            },
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: _selectedContacts.isNotEmpty
          ? FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedContactsPage(
                selectedContacts: _selectedContacts,
              ),
            ),
          );
        },
        label: Text(
          'Add SOS Contacts',
          textAlign: TextAlign.center,
        ),
      )
          : null,
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
  }
}

// Define SelectedContactsPage widget
class SelectedContactsPage extends StatefulWidget {
  final List<Contact> selectedContacts;

  SelectedContactsPage({
    required this.selectedContacts,
  });

  @override
  _SelectedContactsPageState createState() => _SelectedContactsPageState();
}

class _SelectedContactsPageState extends State<SelectedContactsPage> {
  late List<Contact> _selectedContacts;

  @override
  void initState() {
    super.initState();
    _selectedContacts = widget.selectedContacts;
  }

  void _removeContact(Contact contact) async {
    ContactManager().removeContact(contact.displayName ?? '');
    setState(() {
      _selectedContacts.remove(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Contacts',style:TextStyle(color:Colors.white)),
        backgroundColor: Color(0xFF4C2559),
      ),
      body: ListView.builder(
        itemCount: _selectedContacts.length,
        itemBuilder: (context, index) {
          Contact contact = _selectedContacts[index];
          String firstLetter = contact.displayName != null &&
              contact.displayName!.isNotEmpty
              ? contact.displayName![0].toUpperCase()
              : '';
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Card(
              color: Colors.grey.shade100,
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                title: Text(contact.displayName ?? ''),
                leading: CircleAvatar(
                  backgroundColor: _generateRandomColor(),
                  child: Text(firstLetter),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    _showRemoveContactDialog(context, contact);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text('Remove', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showRemoveContactDialog(
      BuildContext context, Contact contact) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove Contact'),
          content: Text('Do you want to remove ${contact.displayName}?'),
          actions: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: Text('No',style: TextStyle(color: Color(0xFF4C2559)),)
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C2559),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                _removeContact(contact);
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
  }
}

// Main function
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AuthService().signInAnonymously();
  runApp(MaterialApp(
    home: ContactSearch(),
  ));
}