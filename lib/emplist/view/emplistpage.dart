import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:leleabtask/emplist/provider/emplistprovider.dart';
import 'package:leleabtask/emplist/view/empdetails.dart';
import 'package:provider/provider.dart';
class EmpListPage extends StatefulWidget {
  @override
  _EmpListPageState createState() => _EmpListPageState();
}

class _EmpListPageState extends State<EmpListPage> {
  EmpListProvider? empListProvider;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    empListProvider=Provider.of<EmpListProvider>(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    empListProvider?.getData();
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
    body: Column(
      children: [
        Expanded(
          child: Selector<EmpListProvider,bool>(
          selector: (context,_)=>_.listListener,
          builder: (context,_,__)=>empListProvider!.isLoading?Center(child: CircularProgressIndicator()):
          empListProvider!.empList.length>0?
          ListView.builder(itemBuilder: (context,position){
            return InkWell(
              onTap: ()async{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EmpDetails( empListProvider!.empList[position])));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(empListProvider!.empList[position].name??'',style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    Text(empListProvider!.empList[position].phone??'')
                  ],
                ),
              ),
            );
          },itemCount: empListProvider!.empList.length,shrinkWrap: true,):Container(height: 0,width: 0,),),
        ),
      ],
    )
    ));
  }
}
