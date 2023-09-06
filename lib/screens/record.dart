import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';
class Record1 extends StatelessWidget {
  const Record1({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider=Provider.of<HomeProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(title: Text('Record of Deleted'),),
      body: Column(
        children: [




          Consumer<HomeProvider>(builder: (context, value, child) {

          return  Expanded(
            child: ListView.builder(
              itemCount: value.deleteRecord.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:Text(value.deleteRecord[index]) ,




                );




              },),
          );

          },)


        ],


      ),



    );
  }
}
