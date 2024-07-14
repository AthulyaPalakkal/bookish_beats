import 'package:bookish_beats/ADMIN/addcategory.dart';
import 'package:bookish_beats/ADMIN/adminHome.dart';
import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class viewcategory extends StatelessWidget {
  viewcategory({super.key});
  List<String> nms=[
    "Novel",
    "Classic",
    "Non Fiction",
    "Poems",
    "Story",
    "Translation",
    "Thriller",
    "Travelogue"

  ];
  @override
  Widget build(BuildContext context) {
    mainProvider provider = Provider.of<mainProvider>(context,listen: false);

    return Scaffold(
      floatingActionButton:  FloatingActionButton(shape: const CircleBorder(),
        backgroundColor: cl3E2501,
        onPressed: () {
        provider.clearcategoryname();

          Navigator.push(context, MaterialPageRoute(builder: (context)=>addcategory()));

        },
        child: const Icon(Icons.add,color: clWhite),
      ),
      appBar: AppBar(toolbarHeight: 60,
        flexibleSpace: Image.asset('assets/pic3.png',fit: BoxFit.fill,),
        bottom: const PreferredSize(preferredSize: Size.fromHeight(3),
          child:Padding(
            padding: EdgeInsets.only(bottom: 10),

          ),

        ),
        automaticallyImplyLeading: false,
        leading: InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>adminHome()));

        },
            child: const Icon(Icons.arrow_back,color: clWhite)),
        title: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text('Add category',style: TextStyle(fontFamily:'cantata' ,fontSize: 20,color: clWhite)),
        ),


      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<mainProvider>(
              builder: (context,value,child) {
                return GridView.builder(
                    itemCount: value.categorynameslist.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 3,
                    ),
                    itemBuilder: (BuildContext context,int index){
                      return Padding(

                        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                        child: Consumer<mainProvider>(
                          builder: (context,value,child) {
                            return GestureDetector(
                              onLongPress: (){
                                showDialog(context: context, builder: (abc)=>AlertDialog(
                                  content: const Text("Are you sure you want to delete?",style: TextStyle(color:clBlack,
                                    fontFamily: 'cantata',fontSize: 15
                                  )),
                                  actions: [
                                    TextButton(onPressed: (){
                                      value.deleteCategory(context,
                                      value.categorynameslist[index].id);
                                      Navigator.pop(context);

                                    },
                                        child: const Text("Delete"))
                                  ],
                                ));
                              },
                              child: Container(
                                width: 100,
                                height: 20,
                                decoration: BoxDecoration(color: clWhite,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black45,style: BorderStyle.solid)



                                ),
                                child: Center(child: Text(value.categorynameslist[index].categoryname,style: const TextStyle(color: clBlack,fontSize: 18,fontFamily: 'cantata'))),


                              ),
                            );
                          }
                        ),
                      );
                    }



                );
              }
            ),
          ),
        ],
      ),

    );
  }
}
