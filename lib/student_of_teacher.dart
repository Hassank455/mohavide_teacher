import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohavide_teacher/sons_models.dart';
import 'package:mohavide_teacher/studet_tabs.dart';

class StudentOfTeacher extends StatelessWidget {
  const StudentOfTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<SonModel> sons = [
      SonModel(

        name: 'محمد أحمد خالد ' ,
        age: 10 ,
      ),
      SonModel(

        name: 'علي ايمن احمد ' ,
        age: 8 ,
      ),
      SonModel(

        name: 'وليد أحمد خالد ' ,
        age: 12 ,
      ),
      SonModel(

        name: 'سامر خالد مسعود ' ,
        age: 7 ,
      ),
      SonModel(

        name: 'محمود أحمد مسعود ' ,
        age: 12 ,
      ),
      SonModel(

        name: 'محمد شفيق جندية ' ,
        age: 16 ,
      ),
      SonModel(

        name: 'حسان كمال المصدر ' ,
        age: 10 ,
      ),
      SonModel(

        name: 'محمود نايف النعيزي ' ,
        age: 15 ,
      ),
      SonModel(

        name: 'محمد صقر العرعير ' ,
        age: 15 ,
      ),
      SonModel(

        name: 'صابر حاكم احمد ' ,
        age: 15 ,
      ),
      SonModel(

        name: 'علي احمد كامل ' ,
        age: 15 ,
      ),
      SonModel(

        name: 'تامر عاصم حازم ' ,
        age: 15 ,
      ),

    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.search , color: Colors.black,)),
        title: Text('طلاب المحفظ محمود أحمد' ,style: TextStyle(color: Colors.black),),
        centerTitle: true,

        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_forward , color: Colors.black,)),
        ],

      ),
    body: Directionality(
    textDirection: TextDirection.rtl,
    child:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
          const Padding(
            padding: EdgeInsets.only(bottom:30 ),
            child: Text('قائمة الطلاب المسجلين لدي',
              style: TextStyle(fontSize: 14 ,color: Colors.black), ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentTabs()));

            },
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>Sons(sons[index]) ,
                separatorBuilder:(context, index) =>SizedBox(height: 20,) ,
                itemCount: sons.length),
          ),

        ],),
      ),
    ),
    ),
    );
  }
  Widget Sons(SonModel son) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.grey[100],
    ),
    width: double.infinity,
    height: 100,

    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow:[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/eye.png'),
                  fit: BoxFit.cover,
                ),
              ),

            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text('${son.name}',style: TextStyle(fontSize: 16,/*overflow:TextOverflow.ellipsis*/ ),),
                Text(' ${son.age} عام ',style: TextStyle(fontSize: 14 , color: Colors.grey),),

              ],),
          ),
        ),
         Expanded(
            flex:1 ,
            child: IconButton(onPressed: (){

            }, icon: (Icon(Icons.print)))),
      ],
    ),
  );
}
