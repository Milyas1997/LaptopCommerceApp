import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Model/Laptop.dart';

class DatabaseHelper {
  final _firbase = FirebaseFirestore.instance;

  Future<bool> add_Inventory(Laptop laptop) async {
    var credential = await _firbase.collection('Inventory').add({
      'Company': laptop.Company,
      'Condition': laptop.Condition,
      'HDD': laptop.HDD,
      'Model': laptop.Model,
      'Price': laptop.Price,
      'RAM': laptop.RAM,
      'SSD': laptop.Ssd
    });
    if (credential != null) {
      return true;
    }
    return false;
  }

  Future<List<Laptop>> getData() async {
    List<Laptop> laptopdata = [];
    await for (var collection in _firbase.collection('Inventory').snapshots()) {
       for (var documents in collection.docs) {
        print(documents);
        //laptopdata.add(documents.data() as Laptop);
      }
    }
    return laptopdata;
  }
}
