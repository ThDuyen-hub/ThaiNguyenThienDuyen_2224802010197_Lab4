import 'package:flutter/material.dart';
import '../controllers/crud_services.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});
  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Contact")),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            
            TextField(
              controller: _nameController, 
              decoration: const InputDecoration(
                labelText: "Full Name", 
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _phoneController, 
              keyboardType: TextInputType.phone, 
              decoration: const InputDecoration(
                labelText: "Phone Number", 
                border: OutlineInputBorder()
              )
            ),
            const SizedBox(height: 25),
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty) {
                    CRUDService().addNewContact(_nameController.text, _phoneController.text);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill all fields"))
                    );
                  }
                },
                child: const Text("ADD CONTACT"),
              ),
            )
          ],
        ),
      ),
    );
  }
}