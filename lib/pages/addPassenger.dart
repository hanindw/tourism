 
 import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/widget/customscaffold.dart';
 
 
 class AddPassengersScreen extends StatefulWidget {
    static String id = "add";
  final int? passengersCount;
  final Function(PassengerData) onPassengerAdded;

  AddPassengersScreen({this.passengersCount, required this.onPassengerAdded});

  @override
  _AddPassengersScreenState createState() => _AddPassengersScreenState();
}

class _AddPassengersScreenState extends State<AddPassengersScreen> {
  final _formKey = GlobalKey<FormState>();
 

  
  String? _GivenName;
  String? _LastName;
  String? _Country;
  DateTime? Date;

  bool _isPassengerChecked = false;


  void _addPassenger() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      PassengerData passengerData = PassengerData(
        name: _GivenName,
        lastname:_LastName,
        country: _Country,
        date: Date,
        isChecked: _isPassengerChecked,
      );
      
      widget.onPassengerAdded(passengerData);
      
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",

    child:SingleChildScrollView(
      child: SafeArea(
        child:Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 35),
      child : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
      
      SizedBox(height: 60,),
        Padding(
           padding:EdgeInsets.only(right: 150),
           child: Text("Add Passengre..",
                  style: TextStyle(
                    color: Color(0XFF1B4158),
                       fontWeight:FontWeight.bold,
                       fontSize: 28,
           ),
          ),
        ),
        SizedBox(height: 20,),
           Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(60)),
                     child: Padding(
                     padding: const EdgeInsets.all(8),
                                 child: TextFormField(
                                
                     
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _GivenName = value;
                      },
                      decoration: const InputDecoration(
                                  
                     enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(color:Color(0XFF1B4158) ,width: 0.9999),
                                  ),
                                    hintText: "Given Name",
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color(0XFF1B4158),
                                    )),
                    ),
                     ),
                     ),
                    Container(
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(60)),
                     child: Padding(
                     padding: const EdgeInsets.all(8),
                                 child: TextFormField(
                               
                     
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your last name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _LastName = value;
                      },
                      decoration: const InputDecoration(
                                  
                     enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(color:Color(0XFF1B4158) ,width: 0.9999),
                                  ),
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color(0XFF1B4158),
                                    )),
                    ),
                     ),
                     ),
           
                     Container(
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(60)),
                     child: Padding(
                     padding: const EdgeInsets.all(8),
                                 child: TextFormField(
                                
                     
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your Country';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _Country = value;
                      },
                      decoration: const InputDecoration(
                                  
                     enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(color:Color(0XFF1B4158) ,width: 0.9999),
                                  ),
                                    hintText: "Country",
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                                    prefixIcon: Icon(
                                      Icons.place,
                                      color: Color(0XFF1B4158),
                                    )),
                    ),
                     ),
                     ),
                     Row(
                    children: [
                      Expanded(
                      child:   Container(
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(60)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            
                          
                            readOnly: true,
                             controller: TextEditingController(text:  Date?.toIso8601String()),
                             decoration: const InputDecoration(
                                    
                             enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(color:Color(0XFF1B4158) ,width: 0.9999),
                                    ),
                                      hintText: "Date of Birth",
                                      hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                        color: Color(0XFF1B4158),
                                      )),
                                       onTap: ()async{
                  DateTime? result = await showDatePicker(
                    context: context,
                     initialDate: DateTime.now(),
                   firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    
             ) ;
                   if(result != null){
                   setState(() {
                    Date=result;
                     });}}
                          ),
                        ),
                         ),
                      ),
                     
                      
                    ],
                  ),
           
           
           
           
           
           
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 51, 86, 116) ,
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                      onPressed: _addPassenger,
                      child: Text('Add  Passenger',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
                 ),
        ]
         ),
    ), 
      ),
     ) );
  }
}
class PassengerData {
    String? name;
    String? idNumber;
    String? lastname;
  String? country;
  DateTime? date;

    bool isChecked = false;

    PassengerData({this.name, this.idNumber, this.country,this.date,this.lastname,required this.isChecked });
  }
