import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:laptop_commerce/Database/Database_Service.dart';
import 'package:laptop_commerce/Model/Laptop.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  late String Company;
  // late String Condition;
  // late String Ram;
  // late String hdd;
  // late String ssd;
  // late String price;
  late String model;
  late var studentobj;
  late Laptop laptopobj;
  List<Laptop> listdata = [];

  // Future<void> getData() async {
  //   final _firestorinstance =
  //       await FirebaseFirestore.instance.collection('Inventory').snapshots();
  //   await for (var snapshot in _firestorinstance) {
  //     for (var docss in snapshot.docs) {
  //       laptopobj = Laptop.fromSnapshot(docss);
  //       listdata.add(laptopobj);

  //       //print('Price are:${laptopobj.Price}');
  //       //print(docs.runtimeType);
  //       //print(docss.data());
  //       //final data = await docss.data;
  //     }

  //     // Future<List<Laptop>> listdata = getData();
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //listdatatwo = await getData();
    // print(listdata.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inventory Avaliable',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Inventory')
                  .snapshots(),
              builder: ((context, snapshot) {
                var mydatasnap;
                final inventoryfield = snapshot.data!.docs;
                for (var snap in inventoryfield) {
                  Company = snap['Company'];
                  print('Comapny: $Company');

                  model = snap['Model'];
                  print('Model : $model');

                  mydatasnap = snap.data();
                  var datafirst = Laptop.fromJson(mydatasnap);

                  listdata.add(datafirst);
                }

                if (snapshot.hasError) {
                  print(snapshot.data!.docs);
                  return Text(snapshot.hasError.toString());
                }
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(mydatasnap[index]['Company']),
                        trailing: Text(mydatasnap[index]['Price']),
                        //leading: Text(ssd),
                      );
                    });
              }))),
    );
  }
}
