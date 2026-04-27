import 'package:flutter/material.dart';
import '../controllers/crud_services.dart';

class UpdateContactPage extends StatefulWidget {
  const UpdateContactPage({super.key});
  @override
  State<UpdateContactPage> createState() => _UpdateContactPageState();
}

class _UpdateContactPageState extends State<UpdateContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isInitialized = false; 
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    if (!_isInitialized) {
      final Map args = ModalRoute.of(context)!.settings.arguments as Map;
      _nameController.text = args["name"];
      _phoneController.text = args["phone"];
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
   
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final String docId = args["id"];

    return Scaffold(
      appBar: AppBar(title: const Text("Update Contact")),
      body: SingleChildScrollView( // Chống tràn màn hình
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController, 
              decoration: const InputDecoration(labelText: "Name", border: OutlineInputBorder())
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _phoneController, 
              decoration: const InputDecoration(labelText: "Phone", border: OutlineInputBorder())
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  CRUDService().updateContact(_nameController.text, _phoneController.text, docId);
                  Navigator.pop(context);
                },
                child: const Text("UPDATE"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                 
                  CRUDService().deleteContact(docId);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                child: const Text("DELETE"),
              ),
            )
          ],
        ),
      ),
    );
  }
}