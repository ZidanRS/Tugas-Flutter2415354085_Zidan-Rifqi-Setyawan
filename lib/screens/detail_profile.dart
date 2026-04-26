import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/profile.dart';
import 'edit_profile.dart';

class DetailProfile extends StatefulWidget {
  final Profile profile;
  const DetailProfile({super.key, required this.profile});

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Profile')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 230,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.gp8lb38hIdJ81fSX2hmeKAHaEK?pid=1.7',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 140,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.oQmR7ipQJZECpuQud_xZjQHaHa?pid=1.7',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.profile.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.profile.desc85,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final updatedProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(profile: widget.profile),
                  ),
                );

                if (updatedProfile != null) {
                  setState(() {
                    widget.profile.nama = updatedProfile.nama;
                    widget.profile.desc85 = updatedProfile.desc85;
                  });
                  Fluttertoast.showToast(msg: "Update Berhasil!");
                }
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
