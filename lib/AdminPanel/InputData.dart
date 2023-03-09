import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:laptop_commerce/Custom_Widget/Custom_Button.dart';
import 'package:laptop_commerce/Database/Database_Service.dart';
import 'package:laptop_commerce/Model/Laptop.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  late String Company;
  late String Condition;
  late String HDD;
  late String Model;
  late String RAM;
  late String Ssd;
  late String Price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Panel',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                //Company
                onChanged: (val) {
                  
                  Company = val;
                },
                decoration: InputDecoration(
                  labelText: 'Company',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                //Condition are here
                onChanged: (val) {
                  Condition = val;
                },
                decoration: InputDecoration(
                  labelText: 'Condition',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (val) {
                  //HDD are here
                  HDD = val;
                },
                decoration: InputDecoration(
                  labelText: 'HDD',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (val) {
                  //model are here...
                  Model = val;
                },
                decoration: InputDecoration(
                  labelText: 'Model',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (val) {
                  //Ram are her...
                  RAM = val;
                },
                decoration: InputDecoration(
                  labelText: 'RAM',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (val) {
                  //ssd are here..
                  Ssd = val;
                },
                decoration: InputDecoration(
                  labelText: 'SSD',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (val) {
                  //price are here...
                  Price = val;
                },
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () async {
                    var laptop = Laptop(
                        Company: Company,
                        Condition: Condition,
                        HDD: HDD,
                        Model: Model,
                        RAM: RAM,
                        Ssd: Ssd,
                        Price: Price);
                    bool isInserted =
                        await DatabaseHelper().add_Inventory(laptop);
                    if (isInserted) {
                      print('Document Inserted...');
                    } else {
                      print('Sorry did not inserted..');
                    }
                  },
                  child: CustomButton(ButtonText: 'Enter Data')),
            ],
          ),
        ),
      ),
    );
  }
}
