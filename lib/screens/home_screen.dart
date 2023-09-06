import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning_series/provider/home_provider.dart';

import 'record.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final noteProvider=Provider.of<HomeProvider>(context,listen: false);
    print('Build 1');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Provider'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                enabled: true,
                maxLines: 2,
              ),

            ),
            Consumer<HomeProvider>(builder: (context, value, child) {
              return ElevatedButton(


                  style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),

                  onPressed: () {

                    value.addNote(_textController.text.toString());

                    print('elevated button');



                  }, child: Text('Add Data'));
            },),
            SizedBox(height: 5,),
            Consumer<HomeProvider>(builder: (context, value, child) {
              return ElevatedButton(


                  style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),

                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Record1(),));

                    print('elevated button');



                  }, child: Text('Navigate'));
            },),
            SizedBox(height: 5,),
            
              Consumer<HomeProvider>(builder: (context, value, child) {
                print(' build 2');
                return        Expanded(
                  child: ListView.builder(

                    itemCount: value.folder.length,
                    itemBuilder: (context, index) {

                      return Dismissible(

                        key: Key(value.folder[index]),
                        direction: DismissDirection.startToEnd,
                        onDismissed: (direction){
                          String deleted = value.folder[index];
                          value.deleteNote(index); // Call the deleteNote method on the provider
                          print("Deleted: $deleted");
                        },

                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),


                        ),

                        child: ListTile(

                          title: Text(value.folder[index]),

                        ),

                      );




                    },),
                );


              },)

            



            //show saved data





          ],
        ),
      ),
    );
  }
}
