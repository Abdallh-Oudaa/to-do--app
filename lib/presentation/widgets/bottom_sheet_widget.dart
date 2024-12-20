import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomSheetWidget extends StatefulWidget {


   const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  var formKey=GlobalKey<FormState>();
  DateTime? backDateTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
        child: Form(
          key:formKey ,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  "Add New Task",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              TextFormField(
                validator: (text) {
                  if(text==null||text.isEmpty){
                    return "Please Enter a title";
                  }else{ return null;}
                },
                decoration: const InputDecoration(
                  hintText: "Enter your task",
                  hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color(0xff848486)),)
                ),
              TextFormField(
                validator: (text) {
                  if(text==null||text.isEmpty){
                    return "Please Enter a description";
                  }else{ return null;}
                },
                  decoration: const InputDecoration(
                    hintText: "Enter your Description",
                    hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color(0xff848486)),
      
                  ),
                maxLines: 3,
              ),
      
               Text("Select item",style: Theme.of(context).textTheme.bodyMedium,),
              InkWell(
                onTap: (){
                  calenderShow();
                  setState(() {
                    
                  });
                },
                child:  Center(child: Text(DateFormat.MEd().format(backDateTime??DateTime.now()),style:const TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w400,color: Color(0xff848486)),)),
              ),
               MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                minWidth: 300,
                  onPressed: (){
                  addTask();
                  setState(() {
      
                  });
                  },
                  child: Text("Add",style: Theme.of(context).textTheme.titleLarge,)
                  ),
      
            ],
          ),
        ),
      ),
    );
  }

  void addTask(){
    if(formKey.currentState!.validate()){
      /// here we store the task in fire store later
    }
  }

  void calenderShow() async{
   var dateTime=await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
   backDateTime=dateTime;
  }
}
