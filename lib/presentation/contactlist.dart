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
    _fetchSelectedContacts(); // Fetch selected contacts from Firestore
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
          (contact.displayName ?? '').toLowerCase().contains(query.toLowerCase()));
    });
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
class SelectedContactsPage extends StatelessWidget {
  final List<Contact> selectedContacts;

  SelectedContactsPage({required this.selectedContacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Contacts'),
      ),
      body: ListView.builder(
        itemCount: selectedContacts.length,
        itemBuilder: (context, index) {
          Contact contact = selectedContacts[index];
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
              // Handle onTap
            },
          );
        },
      ),
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