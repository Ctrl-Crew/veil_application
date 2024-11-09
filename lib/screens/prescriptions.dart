import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PrescriptionHistoryPage extends StatefulWidget {
  @override
  _PrescriptionHistoryPageState createState() =>
      _PrescriptionHistoryPageState();
}

class _PrescriptionHistoryPageState extends State<PrescriptionHistoryPage> {
  List<dynamic> prescriptions = [];

  @override
  void initState() {
    super.initState();
    _loadPrescriptionData();
  }

  Future<void> _loadPrescriptionData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedData = prefs.getString('prescriptions');
    if (storedData != null) {
      setState(() {
        prescriptions = jsonDecode(storedData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: prescriptions.isEmpty
          ? const Center(child: Text('No prescription history found'))
          : ListView.builder(
              itemCount: prescriptions.length,
              itemBuilder: (context, index) {
                final prescription = prescriptions[index];
                return PrescriptionCard(prescription: prescription);
              },
            ),
    );
  }
}

class PrescriptionCard extends StatelessWidget {
  final Map<String, dynamic> prescription;

  PrescriptionCard({required this.prescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Name: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text(prescription['name'] ?? 'N/A')),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "Dosage: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text(prescription['dosage'] ?? 'N/A')),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "Duration: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text(prescription['duration'] ?? 'N/A')),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "Instructions: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child:
                        Text(prescription['additionalInstructions'] ?? 'N/A')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
