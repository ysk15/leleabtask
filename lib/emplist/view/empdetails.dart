import 'package:flutter/material.dart';
import 'package:leleabtask/emplist/model/empresmodel.dart';

class EmpDetails extends StatefulWidget {
  EmpResModel model;
  @override
  _EmpDetailsState createState() => _EmpDetailsState(model);
  EmpDetails(this.model);
}

class _EmpDetailsState extends State<EmpDetails> {
  EmpResModel model;
  _EmpDetailsState(this.model);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(model.name??""),
                      SizedBox(height: 8,),
                      Text(model.phone??""),
                      SizedBox(height: 8,),
                      Text(model.website??""),
                      SizedBox(height: 8,),
                      Text(model.addressstring??""),
                      SizedBox(height: 8,),
                      Text(model.companystring??""),
                    ],

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
