import 'package:flutter/material.dart';
import '../controllers/auth_services.dart';
import '../controllers/crud_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Thêm dòng này để định nghĩa QuerySnapshot

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        actions: [
          IconButton(
            onPressed: () {
              AuthService().signOut().then((value) {
                Navigator.pushReplacementNamed(context, "/login");
              });
            }, 
            icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: CRUDService().getContacts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No contacts found"));
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var res = snapshot.data!.docs[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(res["name"][0].toUpperCase()), 
                  ),
                  title: Text(res["name"]),
                  subtitle: Text(res["phone"]),
                  onTap: () => Navigator.pushNamed(
                    context, 
                    "/update", 
                    arguments: {
                      "name": res["name"], 
                      "phone": res["phone"], 
                      "id": res.id
                    }
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/add"),
        child: const Icon(Icons.add),
      ),
    );
  }
}