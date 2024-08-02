

import 'package:flutter/material.dart';
import 'package:tourism/model/flight_custom_model.dart';
import 'package:tourism/model/flight_details_model.dart';
import 'package:tourism/pages/personal_Info.dart';
import 'package:tourism/pages/resultflight.dart';
import 'package:tourism/widget/customflightDetails.dart';
import 'package:tourism/widget/customscaffold.dart';
   
   


class DetailsFlight extends StatefulWidget {
    static String id = "detailsflight";
   flightInfoDet flightinfodet;
   
    
    
  DetailsFlight( {super.key,required this.flightinfodet}) ;

  @override
  State<DetailsFlight> createState() => _DetailsFlightState();
}

class _DetailsFlightState extends State<DetailsFlight> {


  TimeOfDay? _selectedTime;

  
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }




  DateTime? startDate; 


  @override
  Widget build(BuildContext context){
    flightInfoDet flightinfodet= ModalRoute.of(context)!.settings.arguments as flightInfoDet;
  if (flightinfodet == null){
    return Scaffold(appBar: AppBar(title: Text('No result'),),);
  }

  
  
 return CustomScaffold(
     imagePath: "lib/images/Android Small - 1.png",
    child: SafeArea(child:Padding(
    padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 0.01),
    child : Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
    // Padding(
    //   padding: const EdgeInsets.only(right: 500),
    //   child: Container(
    //     height: 0.1,
    //    child:IconButton(onPressed: (){}, icon: Icon(Icons.navigate_before,size:45,color:Color(0XFF1B4158),))
    //     ),
    // ),
    const SizedBox(height: 60,),

 const Padding(
    padding: const EdgeInsets.only(right: 200),
    child: Text(" Flight Details.. ",
           style: TextStyle(
             color: Color(0XFF1B4158),
                fontWeight:FontWeight.bold,
               
                fontSize: 30)),

  ),
    const SizedBox(height: 25,),
    Padding(
      padding: const EdgeInsets.all(13),
      
      
      child: Material(
        
      borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 400,
          width: double.infinity,
           decoration: BoxDecoration(
          color:Color(0XFF2C516C)  ,
          borderRadius: BorderRadius.circular(35)),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    
                    const   Text(
                    "NYC",
                      style: TextStyle(color:Colors.white,fontSize: 23,fontWeight:FontWeight.bold, ),
                      ),
                    
                  Transform.rotate(
                       angle: -30,
                      child:const Icon(
                              Icons.flight,
                               color:Colors.grey ,size: 34,
                             ),
                       ),
                       
                   Text("LDN", style: TextStyle(color: Colors.white,fontSize: 23,fontWeight:FontWeight.bold, ))
                    ],
                 ),
           const  SizedBox( height: 0.1,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
            
               Text(
                  flightinfodet.nyc,
                   style: TextStyle(color: Color.fromARGB(255, 237, 236, 236),fontSize: 16,fontWeight:FontWeight.normal,),
               ),
            SizedBox(width: 5,),
         
            Text(
             flightinfodet.ldn,
              style: TextStyle(color: Color.fromARGB(255, 237, 236, 236),fontSize: 16,fontWeight:FontWeight.normal,),
           ),
            ],
           ),

          const SizedBox(height: 8),
          Divider(color: Colors.grey,indent:15,endIndent: 15,),
            const     Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     
                   Text( "Number", style: TextStyle(color:Colors.white,fontSize: 19,fontWeight:FontWeight.bold, ),),   
                

                   Text("Time", style: TextStyle(color:Colors.white,fontSize: 19,fontWeight:FontWeight.bold, )),

                   Text("Price", style: TextStyle(color:Colors.white,fontSize: 19,fontWeight:FontWeight.bold, )),


                    ],
                 ),
          
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              SizedBox(width: 40,),
                Text(
                flightinfodet.number,
                   style: TextStyle(color: Color.fromARGB(255, 237, 236, 236),fontSize: 16,fontWeight:FontWeight.normal,),
          
                 ),
             
              SizedBox(width: 110,),
               Text(
               flightinfodet.time,
                  style: TextStyle(color: Color.fromARGB(255, 237, 236, 236),fontSize: 16,fontWeight:FontWeight.normal,),
             ),
              
            SizedBox(width: 95,),

              Row(
                children: [
                  
                  Text(
                   flightinfodet.price ,
                      style: TextStyle(color: Color.fromARGB(255, 237, 236, 236),fontSize: 16,fontWeight:FontWeight.normal,),
                               ),
                    SizedBox(width: 1,),
                     Icon(Icons.price_check_rounded,size:20,color:Colors.white)
                              

                ],
              ),





            ],
            ),
        const SizedBox(height: 8),
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
                 controller: TextEditingController(text:  startDate?.toIso8601String()),
                    decoration:const InputDecoration(
                      fillColor: Color.fromARGB(255, 237, 236, 236),
                      labelText: 'Depart',
                      labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
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
              height: 75,
               width:double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    // controller: 
                    decoration:const InputDecoration(
                      fillColor: Color.fromARGB(255, 237, 236, 236),
                      labelText: 'Time',
                      labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
                      //  hintText: "Return",
                      // hintStyle: TextStyle(color:  Color(0XFF1B4158),fontSize: 15),
                      filled: true,
                      prefixIcon: Icon(Icons.av_timer_outlined,size: 35,color:Color(0XFF1B4158),),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color:Color(0XFF1B4158),width: 0.9999),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF1B4158),)
                      ),
                    ),
                //      initialValue: _selectedTime != null ?
                //  DateFormat('hh:mm a').format(_selectedTime!.replacing(
                //     hour: _selectedTime!.hourOfPeriod,
                //     minute: _selectedTime!.minute,
                //   ))
                //   : null,

                    readOnly: true,
                 onTap: (){
                    //  _selectTime(context); 
                 }
                  ),
                ),
              ),
               ),  
           ],) ,
        
          ],),
        ),
      ),
    ),
     SizedBox(
                  height: 75,
                        width: 240,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                       style:ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                            
                          ),
                          backgroundColor:Color(0XFF1B4158),
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical:20 )
                          
                        ),
                        
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Personal_Info.id);
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(color:Colors.white,fontSize: 18,height: 0.1),
                      ),
                    ),
                  )),
              SizedBox(height: 5,),
                SizedBox(
                  height: 75,
                        width: 240,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                       style:ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                            
                          ),
                          backgroundColor:Color.fromARGB(255, 237, 236, 236),
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical:20 )
                          
                        ),
                        
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, ResultFlight.id);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color:Color(0XFF1B4158),fontSize: 18,height: 0.1),
                      ),
                    ),
                  )),    

   
    ]
    )
    )
    )
    ); 
    
  }
}
