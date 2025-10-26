import 'package:aplikasi_pertamaku/widgets/event_list_page.dart'; // Pastikan path ini benar
import 'package:flutter/material.dart';
import 'package:aplikasi_pertamaku/pages/add_event_tab.dart'; // Tambahkan path lengkap jika perlu
import 'package:aplikasi_pertamaku/pages/media_page.dart'; // Tambahkan path lengkap jika perlu

class HomePage extends StatefulWidget {
  // ignore: use_super_parameters
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Daftar event disimpan dalam list
  final List<Map<String, dynamic>> _events = [];

  // Fungsi untuk menambah event dari tab Tambah Event
  void _addNewEvent(Map<String, dynamic> newEvent) {
    setState(() {
      _events.add(newEvent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Pastikan ini 3, sesuai jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Event Planner"),
          backgroundColor: Colors.teal,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.list), text: "Daftar Event"),
              Tab(icon: Icon(Icons.add), text: "Tambah Event"),
              Tab(icon: Icon(Icons.perm_media), text: "Media"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Daftar event - Pastikan EventListPage menerima parameter events
            EventListPage(events: _events), // Gunakan _events, bukan events
            // Tab 2: Tambah event
            AddEventTab(onAddEvent: _addNewEvent),

            // Tab 3: Media
            MediaPage(), // Pastikan MediaPage adalah widget yang valid
          ],
        ),
      ),
    );
  }
}
