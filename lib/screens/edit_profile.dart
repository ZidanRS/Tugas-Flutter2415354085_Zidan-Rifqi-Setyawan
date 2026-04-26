import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfile extends StatefulWidget {
  final Profile profile;
  const EditProfile({super.key, required this.profile});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _namaController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.profile.nama);
    _descController = TextEditingController(text: widget.profile.desc85);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                widget.profile.nama = _namaController.text;
                widget.profile.desc85 = _descController.text;
                Navigator.pop(context, widget.profile);
              },
              child: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
