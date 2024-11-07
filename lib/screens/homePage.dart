import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override

  Widget build(BuildContext context) {
    final List<Map<String,String>> items=[];
    void _alertbox({int? index}){

      String name = index != null ? items[index]["name"]!:"";
      String description = index != null ? items[index]["description"]!:"";
    TextEditingController nameController= TextEditingController(text: name);
      TextEditingController descriptionController=  TextEditingController(text: description);
      showDialog(
        context: context,
        builder: (context) {
        return AlertDialog(
          title: Text(index == null ? "add items":"edit items"),
    content: Column(mainAxisSize: MainAxisSize.min,
      children: [
        TextField(controller: nameController,decoration: InputDecoration(labelText: "name"),),
      TextField(controller: descriptionController,decoration: InputDecoration(labelText: "description"),
        ),
      ],
    ),
    actions: [
      TextButton(onPressed: () {
        Navigator.pop(context);
      } ,child: Text("cancel"),

    ),
      TextButton(onPressed: () {
        setState(() {
          if(index==null){
            items.add({"name":nameController.text,
      "description":descriptionController.text
            });

      }
          else{
            items[index]={
              "name":nameController.text,
              "description":descriptionController.text
      };
      }

        });
        Navigator.pop(context);
        },
       child: Text("Save"),
    ),


    ],
      );
      },
      );
    }
    void _deletedItem(int index){
      setState(() {
        items.removeAt(index);
      });
    }


    return Scaffold(
      appBar: AppBar(title: Text("userdatas",style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,),
      body: Column(
        children: [
          ElevatedButton(onPressed: () => _alertbox(), child: Text("add items")),
          Expanded(
              child:
          ListView.builder(
              itemCount: items.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(items[index]["name"]!),
                  subtitle: Text(items[index]["description"]!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () => _alertbox(index: index), icon:Icon(Icons.edit)),
                      IconButton(onPressed: () => _deletedItem(index), icon:Icon(Icons.delete),),

                    ],
                  ),


                );
              },

              
          )
          )

        ],
      ),
    );
  }
}
