

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism/pages/first.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/hotel_search.dart';
import 'package:tourism/pages/resultflight.dart';
import 'package:tourism/widget/customscaffold.dart';

class FlightPage extends StatefulWidget {
static String id = "flights";



  @override
  State<FlightPage> createState() => _FlightsState();
}

class _FlightsState extends State<FlightPage> {
DateTime? startDate; 
 DateTime? endDate;
 DateTime? startDate2;

 final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController startController = TextEditingController();
  final TextEditingController startDate2Controller = TextEditingController();





  @override
  Widget build(BuildContext context) =>
  CustomScaffold(
    imagePath: "lib/images/Android Small - 1.png",
    child: SafeArea(child:Padding(
    padding:const EdgeInsets.symmetric(vertical: 0.1,horizontal: 2),
    child : Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
    Padding(
      padding: const EdgeInsets.only(right: 500),
      child: Container(
        height: 0.1,
       child:IconButton(onPressed: (){ Navigator.pushReplacementNamed(context, Homepage.id);}, icon: Icon(Icons.navigate_before,size:45,color:Color(0XFF1B4158),))
        ),
    ),
    const SizedBox(height: 60,),
    const   Padding(
         padding: const EdgeInsets.only(right: 200),
         child: Text(" Book your \n       Flight..",
                style: TextStyle(
                  color: Color(0XFF1B4158),
                     fontWeight:FontWeight.bold,
                    
                     fontSize: 33)),
       ),
    SizedBox(height: 0.0001,),
      
     DefaultTabController(
       length: 2,
       child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(40),
             child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color:Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:  TabBar(
                  indicatorSize:TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color:Color(0XFF1B4158),
                     borderRadius: BorderRadius.circular(40),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs:const[
                      Tab(child: Text('Round Trip',style: TextStyle(
                  color:Colors.white,
                   fontWeight:FontWeight.bold, 
                   fontSize: 19),),),
                      Tab(child: Text('One Way',style: TextStyle(
                  color:Colors.white,
                   fontWeight:FontWeight.bold, 
                   fontSize: 19),),),
                    ]
                    )
                ),
           ),
         
     
      
        SizedBox(
    height: 390,
       
    child: TabBarView(
      children: [
       SingleChildScrollView(
         child: Center(
               child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                const   Padding(
                      padding: EdgeInsets.only(right: 270),
                      child: Text('From',
                      style: TextStyle(
                      color: Color(0XFF1B4158),
                     fontWeight:FontWeight.bold,
                     fontSize: 20
                     ),
                     ),
                     ),
              Container(
                height:80,
                width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration:const InputDecoration(
                     fillColor: Color.fromARGB(255, 237, 236, 236),
                      filled: true,
                      prefixIcon: Icon(Icons.location_pin,size: 30,color:Color(0XFF1B4158),),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
                  ),
                ),
              ),
               ],
              ),

           const    SizedBox(
                  height:2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 290),
                  child: Text('To',style: TextStyle(color: Color(0XFF1B4158),
                       fontWeight:FontWeight.bold,
                       fontSize: 20),),
                ),
                     SizedBox(height: 0.1,),
             Container(
              height: 80,
               width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration:const InputDecoration(
                      fillColor: Color.fromARGB(255, 237, 236, 236),
                      // labelText: 'To',
                      // labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
                      //  hintText: "To",
                      // hintStyle: TextStyle(color:  Color(0XFF1B4158),fontSize: 15),
                      filled: true,
                      prefixIcon: Icon(Icons.flight_land_rounded,size: 30,color:Color(0XFF1B4158),),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
                  ),
                ),
              ), 
            const   SizedBox(
                  height:0.01,
                ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 120),
                    child: Text('Depart',style: TextStyle(color: Color(0XFF1B4158),
                           fontWeight:FontWeight.bold,
                           fontSize: 20),),
                  ),
               
             SizedBox(height: 0.1,),
         Padding(
           padding: const EdgeInsets.only(right: 10),
           child: Text('Return',style: TextStyle(color: Color(0XFF1B4158),
                       fontWeight:FontWeight.bold,
                       fontSize: 20),),
         ),
             SizedBox(height: 0.1),
              ],
              ),

           Row(
            children: [
              
            Expanded(child:
          Container(
              height: 80,
               width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                 controller: TextEditingController(text:  startDate?.toIso8601String()),
                    decoration:const InputDecoration(
                      fillColor: Color.fromARGB(255, 237, 236, 236),
                      // labelText: 'Depart',
                      // labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
                      //  hintText: "Depart",
                      // hintStyle: TextStyle(color:  Color(0XFF1B4158),fontSize: 15),
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_month_outlined,size: 30,color:Color(0XFF1B4158),),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
                 onTap: ()async{
              DateTime? result = await showDatePicker(
                context: context,
                 initialDate: DateTime.now(),
               firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                
         ) ;
               if(result != null){
               setState(() {
                startDate=result;
                 });}}
                  ),
                ),
              ),
               ),
                SizedBox(width: 10,) ,
                
                
              Expanded(child: Container(
              height: 80,
               width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: TextEditingController(text: endDate?.toIso8601String()),
                    decoration:const InputDecoration(
                      fillColor: Color.fromARGB(255, 237, 236, 236),
                      // labelText: 'Return',
                      // labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
                      //  hintText: "Return",
                      // hintStyle: TextStyle(color:  Color(0XFF1B4158),fontSize: 15),
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_month_outlined,size: 30,color:Color(0XFF1B4158),),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
                    readOnly: true,
                 onTap: ()async{
              DateTime? result = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
               firstDate: DateTime(2000),
                lastDate: DateTime(2100)
)                  ;
               if(result != null){
               setState(() {
                endDate=result;
                 });}}
                  ),
                ),
              ),
               ),  
           ],) ,
           SizedBox(height: 0.1,),
            Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 90),
                    child: Text('passengers',style: TextStyle(color: Color(0XFF1B4158),
                           fontWeight:FontWeight.bold,
                           fontSize: 20),),
                  ),
               
             SizedBox(height: 0.1,),
         Padding(
           padding: const EdgeInsets.only(right: 10),
           child: Text('class',style: TextStyle(color: Color(0XFF1B4158),
                       fontWeight:FontWeight.bold,
                       fontSize: 20),),
         ),
             SizedBox(height: 0.1),
              ],
              ),

           Row(
            children: [
            Expanded(child: Container(
              height: 70,
               width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration:const InputDecoration(
                      fillColor: Color.fromARGB(255, 237, 236, 236),
                      // labelText: 'passengers',
                      // labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
                      //  hintText: "passengers",
                      // hintStyle: TextStyle(color:  Color(0XFF1B4158),fontSize: 15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ),
               ),
                SizedBox(width: 10,) ,
                
             SizedBox(height: 0.1,),
              Expanded(child: Container(
              height: 70,
               width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration:const InputDecoration(
                      fillColor: Color.fromARGB(255, 237, 236, 236),
                      // labelText: 'class',
                      // labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
                      //  hintText: "class",
                      // hintStyle: TextStyle(color:  Color(0XFF1B4158),fontSize: 15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
                    onTap: (){
                      showDialog(context: context, builder: (BuildContext){
                        return AlertDialog(
                           title: Text('Select Class'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Economy'),
                  onTap: () {
                    print("Economy");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Business'),
                  onTap: () {
                     print("Business");
                    // Set the class to Business
                    Navigator.pop(context);
                  },
                ),
              ],
               ),
                        );
                      }
                      );
                    },  
                  ),
                ),
              ),
               ),  
           ],) ,
           SizedBox(
                      height: 75,
                      width: 240,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                             Navigator.pushReplacementNamed(context, ResultFlight.id);
                            },
                            child: const Text(
                              "Search Flight",
                              style: TextStyle(color: Colors.white, fontSize:18,height: 0.1),
                            ),
                            style:
                            ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)
                                
                              ),
                              backgroundColor:Color(0XFF1B4158),
                              // padding: EdgeInsets.symmetric(horizontal: 5,vertical:2)
                            )
                            
                            
                            
                            ),
                      )
                    ),
              
           
            ],),
               )
         ),
       ),
    
       
      
        SingleChildScrollView(
         child: Center(
               child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                const   Padding(
                      padding: EdgeInsets.only(right: 270),
                      child: Text('From',
                      style: TextStyle(
                      color: Color(0XFF1B4158),
                     fontWeight:FontWeight.bold,
                     fontSize: 20
                     ),
                     ),
                     ),
              Container(
                height:80,
                width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration:const InputDecoration(
                     fillColor: Color.fromARGB(255, 237, 236, 236),
                      filled: true,
                      prefixIcon: Icon(Icons.location_pin,size: 30,color:Color(0XFF1B4158),),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
                  ),
                ),
              ),
               ],
              ),

           const    SizedBox(
                  height:2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 290),
                  child: Text('To',style: TextStyle(color: Color(0XFF1B4158),
                       fontWeight:FontWeight.bold,
                       fontSize: 20),),
                ),
                     SizedBox(height: 0.1,),
             Container(
              height: 80,
               width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration:const InputDecoration(
                      fillColor: Color.fromARGB(255, 237, 236, 236),
                      // labelText: 'To',
                      // labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
                      //  hintText: "To",
                      // hintStyle: TextStyle(color:  Color(0XFF1B4158),fontSize: 15),
                      filled: true,
                      prefixIcon: Icon(Icons.flight_land_rounded,size: 30,color:Color(0XFF1B4158),),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
                  ),
                ),
              ), 
            const   SizedBox(
                  height:0.01,
                ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 120),
                    child: Text('Depart',style: TextStyle(color: Color(0XFF1B4158),
                           fontWeight:FontWeight.bold,
                           fontSize: 20),),
                  ),
               
             SizedBox(height: 0.1,),
        
              ],
              ),

           Row(
            
            children: [
              
            Expanded(child:
          Container(
              height: 75,
               width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                 controller: TextEditingController(text:  startDate2?.toIso8601String()),
                    decoration:const InputDecoration(
                      fillColor: Color.fromARGB(255, 237, 236, 236),
                      // labelText: 'Depart',
                      // labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
                      //  hintText: "Depart",
                      // hintStyle: TextStyle(color:  Color(0XFF1B4158),fontSize: 15),
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_month_outlined,size: 30,color:Color(0XFF1B4158),),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
                 onTap: ()async{
              DateTime? result = await showDatePicker(
                context: context,
                 initialDate: DateTime.now(),
               firstDate: DateTime(2000),
                lastDate: DateTime(2100)
)                  ;
               if(result != null){
               setState(() {
                startDate2=result;
                 });}}
                  ),
                ),
              ),
               ),
                
                
                
               
           ],) ,
           SizedBox(height: 0.1,),
            Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 90),
                    child: Text('passengers',style: TextStyle(color: Color(0XFF1B4158),
                           fontWeight:FontWeight.bold,
                           fontSize: 20),),
                  ),
               
             SizedBox(height: 0.1,),
         Padding(
           padding: const EdgeInsets.only(right: 10),
           child: Text('class',style: TextStyle(color: Color(0XFF1B4158),
                       fontWeight:FontWeight.bold,
                       fontSize: 20),),
         ),
             SizedBox(height: 0.1),
              ],
              ),

           Row(
            children: [
            Expanded(child: Container(
              height: 70,
               width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration:const InputDecoration(
                      fillColor: Color.fromARGB(255, 237, 236, 236),
                      // labelText: 'passengers',
                      // labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
                      //  hintText: "passengers",
                      // hintStyle: TextStyle(color:  Color(0XFF1B4158),fontSize: 15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ),
               ),
                SizedBox(width: 10,) ,
                
             SizedBox(height: 0.1,),
              Expanded(child: Container(
              height: 70,
               width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration:const InputDecoration(
                      fillColor: Color.fromARGB(255, 237, 236, 236),
                      // labelText: 'class',
                      // labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
                      //  hintText: "class",
                      // hintStyle: TextStyle(color:  Color(0XFF1B4158),fontSize: 15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
                    onTap: (){
                      showDialog(context: context, builder: (BuildContext){
                        return AlertDialog(
                           title: Text('Select Class'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Economy'),
                  onTap: () {
                    print("Economy");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Business'),
                  onTap: () {
                     print("Business");
                    // Set the class to Business
                    Navigator.pop(context);
                  },
                ),
              ],
               ),
                        );
                      }
                      );
                    },  
                  ),
                ),
              ),
               ),  
           ],) ,
           SizedBox(
                      height: 75,
                      width: 240,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, ResultFlight.id);
                            },
                            child: const Text(
                              "Search Flight",
                              style: TextStyle(color: Colors.white, fontSize:18,height: 0.1),
                            ),
                            style:
                            ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)
                                
                              ),
                              backgroundColor:Color(0XFF1B4158),
                              // padding: EdgeInsets.symmetric(horizontal: 5,vertical:2)
                            )
                            
                            
                            
                            ),
                      )
                    ),
              
           
            ],),
               )
         ),
       ),
    
        
    
    
    
    
      ]
    ),
        ),
        ],
       ),     
     ), 
      
    ],)
     ) ,
     )
    );
}
  
    

