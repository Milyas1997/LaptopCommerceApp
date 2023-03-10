import 'package:cloud_firestore/cloud_firestore.dart';

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
    return {
      'Model': Model,
      'Price': Price,
      'Ram': RAM,
      'Ssd': Ssd,
      'Company': Company,
      'Condition': Condition,
    };
  }

  //Map user data from firebase
  factory Laptop.fromSnapshot(Map<String, dynamic> document) {
    // final dataa = document.data()!;
    return Laptop(
        Company: document['Company'] ?? "N/A",
        Condition: document['Condition'] ?? "N/A",
        HDD: document['HDD'] ?? "N/A",
        Model: document['Model'] ?? "N/A",
        RAM: document['RAM'] ?? "N/A",
        Ssd: document['SSD'] ?? "N/A",
        Price: document['Price'] ?? "N/A");
  }
}
