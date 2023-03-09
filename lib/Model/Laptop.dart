import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Laptop {
  late String Company;
  late String Condition;
  late String HDD;
  late String Model;
  late String RAM;
  late String Ssd;
  late String Price;
  Laptop(
      {required this.Company,
      required this.Condition,
      required this.HDD,
      required this.Model,
      required this.RAM,
      required this.Ssd,
      required this.Price});


  tojson() {
    return  {
      'Model': this.Model,
      'Price': this.Price,
      'Ram': this.RAM,
      'Ssd': this.Ssd,
      'Company': this.Company,
      'Condition': this.Condition,
    };
  }

  //Map user data from firebase
  factory Laptop.fromSnapshot(Map<String, dynamic> document) {
   // final dataa = document.data()!;
    return Laptop(
        Company: document['Company'],
        Condition: document['Condition'],
        HDD: document['HDD'],
        Model: document['Model'],
        RAM: document['RAM'],
        Ssd: document['SSD'],
        Price: document['Price']);
  }
}
