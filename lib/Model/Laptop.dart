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

  Laptop.fromJson(json) {
    Company:
    json['Company'];
    Condition :json['Condition'];
    HDD : json['HDD'];
    Model :json['Model'];
    Price : json['Price'];
    RAM : json['RAM'];
    Ssd :json['SSD'];

  }

  tojson(){
    return {
      'Model':this.Model,
      'Price': this.Price,
      'Ram': this.RAM,
      'Ssd': this.Ssd,
      'Company':this.Company,
      'Condition': this.Condition,

    };
  }
    //Map user data from firebase
    factory Laptop.fromSnapshot(DocumentSnapshot <Map<String,dynamic>> document){
      final data= document.data()!;
      return Laptop(Company: data['Company'], Condition: data['Condition'], HDD: data['HDD'], Model: data['Model'], RAM: data['RAM'], Ssd: data['SSD'], Price: data['Price']);

    }

 
}
