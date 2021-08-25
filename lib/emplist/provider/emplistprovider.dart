import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:leleabtask/emplist/model/empresmodel.dart';
import 'package:leleabtask/emplist/repository/repository.dart';

class EmpListProvider extends ChangeNotifier{
  bool isLoading=false;
  List<EmpResModel> empList=[];
  bool listListener=false;


  getData()async{
    empList.clear();
    var box = await Hive.openBox<EmpResModel>("emplist");
    if(box.isEmpty){
      isLoading=true;
      refreshList();
      Repository.getEmpList().then((value)async {
        isLoading=false;
        if(value!=null&&value.isNotEmpty){
          await box.clear();
          value.forEach((element) {
            try {
              var cname = (element.company!.name??"")+"\n";
              var cphrase = (element.company!.catchPhrase??"")+"\n";
              var bs = (element.company!.bs??"")+"\n";
              var suite = (element.address!.suite??"")+"\n";
              var street = (element.address!.street??"")+"\n";
              var city = (element.address!.city??"")+"\n";
              var zip = (element.address!.zipcode??"")+"\n";
              element.companyString=cname+cphrase+bs;
              element.addressString=suite+street+city+zip;
            } catch (e) {
              print(e);
            }
          });
          await box.addAll(value);
          empList.addAll(value);
        }
        refreshList();
      }).catchError((onError){
        isLoading=false;
        refreshList();
      });
    }
    else{
     empList.addAll(List<EmpResModel>.from(box.toMap().values.toList()));
     isLoading=false;
     refreshList();
    }

  }
  refreshList(){
    listListener=!listListener;
    notifyListeners();
  }
}