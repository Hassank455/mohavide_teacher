import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Student_Profile extends StatefulWidget {
  @override
  State<Student_Profile> createState() => _Student_ProfileState();
}

class _Student_ProfileState extends State<Student_Profile> {
bool ismale = true ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body :Directionality(
        textDirection:TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 106,
                  height: 106,
                  child: Image(image: AssetImage('assets/images/Mask.png'),),
                ),
              ],
            ),
              Container(
                width: double.infinity,
                height: 70,
                color: Color(0xFFFBFBFF),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Icon(Icons.person_pin_rounded),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('إسم الطالب', style: TextStyle(fontSize: 14),),
                      Spacer(),
                      Text('الطالب أحمد سمير', style: TextStyle(fontSize: 12 ,color: Color(0xFFC8C2BC)),),
                    ],)
                  ],),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 70,
                color: Color(0xFFFBFBFF),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Icon(Icons.people_alt_rounded),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('عمر الطالب', style: TextStyle(fontSize: 14),),
                      Spacer(),
                      Text('12 عام', style: TextStyle(fontSize: 12 ,color: Color(0xFFC8C2BC)),),
                    ],)
                  ],),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 70,
                color: Color(0xFFFBFBFF),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                    Icon(ismale ?Icons.male : Icons.female),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                      Text('جنس الطالب', style: TextStyle(fontSize: 14),),
                      Spacer(),
                      Text('ذكر', style: TextStyle(fontSize: 12 ,color: Color(0xFFC8C2BC)),),
                    ],)
                  ],),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 70,
                color: Color(0xFFFBFBFF),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Icon(Icons.person),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('الأجزاء المحفوظة', style: TextStyle(fontSize: 14),),
                      Spacer(),
                      Text('عم , تبارك , الشورى', style: TextStyle(fontSize: 12 ,color: Color(0xFFC8C2BC)),),
                    ],)
                  ],),
                ),
              ),
          ],),
        ),
      ),
    );
  }
}




//             ],
//           ),
//         ),
//     ),
//     );
//     }
// }
