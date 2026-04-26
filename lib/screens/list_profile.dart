import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'detail_profile.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  int counter = 0;
  List<Profile> profiles = [];

  void addItem() {
    setState(() {
      counter++;
      profiles.add(
        Profile(
          id: counter.toString(),
          nama: "User ke-$counter",
          desc85: "Deskripsi profil nomor $counter",
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Profile"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final user = profiles[index];
          return Dismissible(
            key: Key(user.id),
            onDismissed: (direction) {
              setState(() {
                profiles.removeAt(index);
              });
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("${user.nama} dihapus")));
            },
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/OIP.oQmR7ipQJZECpuQud_xZjQHaHa?pid=1.7",
                ),
              ),
              title: Text(user.nama),
              subtitle: Text(user.desc85),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProfile(profile: user),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
