



import 'package:arikan06/lib/screens/show_gorev_details.dart';
import 'package:flutter/material.dart';

import '../Models/gorev.dart';
import '../data/db_helper.dart';
import 'gorev_add.dart';
import 'gorev_edit.dart';

class ShowGorevs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _ShowGorevsState();
  }

}

class _ShowGorevsState extends State{


  var dbHelper = new DbHelper();
  List<Gorev>? gorevs;
  int gorevCount=0;

  Gorev selectedGorev = Gorev.withId(id: 0,baslangicZamani: 0,bitisZamani: 0,isim: "",aciklama: "",tamamlandiMi: 0);

  @override
  void initState() {
    // TODO: implement initState
    var GorevsFuture = dbHelper.getGorevs;
    GorevsFuture.then((value){
      gorevs = value;
      gorevCount=value!.length;
    });

    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("Görevler"),
        centerTitle: true,

        actions: [
          new IconButton(onPressed: (){
            setState(() {
              GetGorevs();
            });
          }, icon: new Icon(Icons.update))
        ],

      ),
      body: buildGorevList(),

      floatingActionButton: FloatingActionButton(
        onPressed: (){goToGorevAdd();},
        child: Icon(Icons.add),
        tooltip: "Add new Gorev",
      ),
    );
  }

  buildGorevList() {
    return ListView.builder(
      itemCount: gorevCount,
        itemBuilder: (BuildContext contet,int position){
          return Card(

            color: Colors.lightGreenAccent,
            elevation: 2.0,
            child: ListTile(
              //leading: CircleAvatar(
               // backgroundColor: Colors.blue,
                //child: Text("G"),
              //),
              leading: new IconButton(onPressed: (){}, icon: new Icon(Icons.check)),
              title: Text(this.gorevs![position].isim.toString()),

              subtitle: Text("Görev:   "+this.gorevs![position].aciklama.toString() +"\nBaşlangıç Zamanı:   "+
                  this.gorevs![position].baslangicZamani.toString()
                  +"\nBitiş Zamanı:   "+this.gorevs![position].bitisZamani.toString()),
                trailing:  new IconButton(
                    onPressed: (){
                      selectedGorev=gorevs![position];
                      DeleteGorev(selectedGorev);

                    }, icon: new Icon(Icons.delete_forever_sharp)),

                onLongPress: (){
                selectedGorev=gorevs![position];
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowGorevDetails(selectedGorev)));
                },
              onTap: (){
                    selectedGorev = gorevs![position];
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GorevEdit(selectedGorev)));
              },
            ),
          );
        }
    );

  }

   buildIconTamamlandiMi(int a) {
      if(a ==0){
        return Icon(Icons.update);
      }
      else{
        return Icon(Icons.assignment_turned_in);
      }
  }

  void goToGorevAdd() async {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>GorevAdd()));
    if(result!=null){
      if(result){
        GetGorevs();
      }
    }
  }

  void GetGorevs() async{
    var GorevsFuture = dbHelper.getGorevs;
    GorevsFuture.then((value){
        gorevs = value;
        gorevCount=value!.length;
    });

  }

   DeleteGorev(Gorev? selectedGorev) async {
    print("buraya geldi");
    //Navigator.push(context, MaterialPageRoute(builder: (context)=> DeleteGorev(selectedGorev)));

    await dbHelper.delete(int.parse(selectedGorev!.id.toString()));

  }

}