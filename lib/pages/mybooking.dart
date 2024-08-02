import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism/model/flight_result_model.dart';
import 'package:tourism/model/flight_result_model.dart';
import 'package:tourism/pages/flights.dart';
import 'package:tourism/pages/home.dart';

class MyBooking extends StatefulWidget {
  static String id = "mybooking";
   MyBooking({super.key,required this.flight});
  flightInfoRes flight;

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> 
  with SingleTickerProviderStateMixin {
  late TabController _tabController;


   @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync:this);
  }




  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 51, 86, 116) ,
        title: Row(
          children: [
      
            Text('My Booking',style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal,color: Colors.white ),),
          ],
        ),
        bottom: TabBar(
          labelStyle:TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          labelColor:Colors.white,
          indicatorSize:TabBarIndicatorSize.label,
          indicatorColor:Color(0XFF1B4158),
          unselectedLabelColor:Color.fromARGB(255, 21, 43, 56),
          controller: _tabController,
          tabs: [
            Tab(text: 'Flight'),
            Tab(text: ' Hotels'),
            Tab(text: ' Trips'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          
          FlightBookingsList(FlightsRes: FlightsRes),
        
          Center(child: Text('book hotel')),
          
          Center(child: Text('book trip')),
        ],
      ),
    );
  }
  }


class FlightBookingsList extends StatelessWidget {
final List<flightInfoRes> FlightsRes ;

  FlightBookingsList({required this.FlightsRes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: FlightsRes.length,
      itemBuilder: (context, index) {
        final booking = FlightsRes[index];
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
          
              CircleAvatar(
                backgroundImage: AssetImage(booking.imagePath),
                
                maxRadius: 35,
              ),
              SizedBox(width: 16),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        booking.nyc,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                             '  ${booking.nyc}',
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Color(0XFF1B4158)),
                            ),
                            Icon(Icons.airplane_ticket_rounded,color: Color(0XFF1B4158),),
                        
                      
                    Text(
                      '${booking.ldn}',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0XFF1B4158)),
                    ),

                      ],
                        ),
                        SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${booking.departureTime}',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                    
                    Text(
                      ' ${booking.arrivalTime}',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),
                    ),
                      ],
                    ),
                   
                    ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                         Text(
                      ' ${booking.allDate.day}/${booking.allDate.month}/${booking.allDate.year}',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0XFF1B4158)),
                    ),
                     SizedBox(width: 75,),
                      
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, FlightPage.id);
                          },
                          icon: Icon(Icons.edit,size: 20,color: Colors.grey),
                        ),
                        
                        IconButton(
                          onPressed: () {
                                showDialog(
                                   context: context,
                                  builder: (BuildContext context) {
                               return AlertDialog(
                                 title: Text('Confirm deletion',style: TextStyle(fontSize:21, color:Color(0XFF1B4158) ,fontWeight: FontWeight.bold),),
                                content: Text('50% of the amount paid will be deducted when canceling the ticket reservation'),
                                actions: <Widget>[ TextButton(
                                    onPressed: () {
                                  Navigator.of(context).pop(); 
                                        },
                                     child: Text('Cancel',style: TextStyle(color: Color(0XFF1B4158),fontSize: 15),),
                                        ),
                                         TextButton(
                                       onPressed: () {
                                    
                                   Navigator.of(context).pop(); 
                                     },
                                    child: Text('ok',style: TextStyle(color: Color(0XFF1B4158),fontSize: 15),),
            ),
          ],
        );
      },
    );
  },
           
                          icon: Icon(Icons.delete,size: 20,color: Color(0XFF1B4158),),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
  
