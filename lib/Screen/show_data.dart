import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        title: const Text(
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
                if (snapshot.hasData) {
                  Map<String, dynamic> mydatasnap;
                  List<QueryDocumentSnapshot<Map<String, dynamic>>> inventoryfield = snapshot.data!.docs;
                  for (QueryDocumentSnapshot<Map<String, dynamic>> snap in inventoryfield) {
                    mydatasnap = snap.data();
                    print('mydatasnap are: $mydatasnap');
                    var datafirst = Laptop.fromSnapshot(mydatasnap);

                    listdata.add(datafirst);
                  }
                  return ListView.builder(
                      itemCount: listdata.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(listdata[index].Model),
                          title: Text(listdata[index].Company),
                          subtitle: Text('SSD:${listdata[index].Ssd}'),
                          trailing: Text('Price:${listdata[index].Price}'),

                          //leading: Text(ssd),
                        );
                      });
                }

                if (snapshot.hasError) {
                  return Text(snapshot.hasError.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              }))),
    );
  }
}
