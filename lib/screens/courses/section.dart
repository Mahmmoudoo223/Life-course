import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/models/course_model.dart';
import 'package:course_app/screens/pdfs/pdfs_widget.dart';
import 'package:course_app/screens/videos/videos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SectionWidget extends StatelessWidget {
  CourseModel courseModel;
  SectionType type;
  bool haveSubscription;

  SectionWidget({required this.courseModel,required this.type,this.haveSubscription=false});

  @override
  Widget build(BuildContext context) {
     return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('courses sections')
            .where('coursID', isEqualTo: courseModel.id)

            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Center(child: Text('Loading'));
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
            var res = snapshot.data!.docs;
            try{
              res.sort((a, b) => a["order"].compareTo(b["order"]));
            }catch(e){
              print("Sorting Error");
            }
              return Column(children:res.map((e) {
                return Column(
           
          //subtitle: Text('Trailing expansion arrow icon'),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(e["name"]??"",style: TextStyle(fontSize: 18,color: Colors.black),),
            ),
            type == SectionType.video? VideoWidget(sectionID: e.id,haveSubscription: haveSubscription,courseModel: courseModel,):PdfWidget(sectionID: e.id,haveSubscription: haveSubscription,courseModel: courseModel,),
            Divider(color: Colors.grey,)
          ],
        );
              },).toList());
              
          }
        });

  }
}
enum SectionType{video,pdf}