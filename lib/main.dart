import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_cubit.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_details_cubit.dart';
import 'package:tourism/Features/cubit/Auth/check_code_cubit.dart';
import 'package:tourism/Features/cubit/Auth/email_verification_cubit.dart';
import 'package:tourism/Features/cubit/Auth/login_cubit.dart';
import 'package:tourism/Features/cubit/Auth/logout_cubit.dart';
import 'package:tourism/Features/cubit/Auth/register_cubit.dart';
import 'package:tourism/Features/cubit/Auth/reset_passwrd_cubit.dart';
import 'package:tourism/helper/constante.dart';

import 'package:tourism/model/flight_details_model.dart';
import 'package:tourism/model/flight_result_model.dart';
import 'package:tourism/model/payment_flight_model.dart';
import 'package:tourism/pages/addPassenger.dart';
import 'package:tourism/pages/attrac_details.dart';
import 'package:tourism/pages/attractions.dart';
import 'package:tourism/pages/boarding_pages.dart';
import 'package:tourism/pages/create_wallet.dart';
import 'package:tourism/pages/creatwallet_success.dart';
import 'package:tourism/pages/detailsflight.dart';
import 'package:tourism/pages/edit_Profile.dart';
import 'package:tourism/pages/favorite.dart';
import 'package:tourism/pages/first.dart';
import 'package:tourism/pages/flights.dart';
import 'package:tourism/pages/forgotpass.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/hotel_search.dart';
import 'package:tourism/pages/hotels.dart';
import 'package:tourism/pages/hotels_filter.dart';
import 'package:tourism/pages/login.dart';
import 'package:tourism/pages/mybooking.dart';
import 'package:tourism/pages/payment_flight.dart';
import 'package:tourism/pages/personal_Info.dart';
import 'package:tourism/pages/profile.dart';
import 'package:tourism/pages/resetpass.dart';
import 'package:tourism/pages/resultflight.dart';
import 'package:tourism/pages/roombooking.dart';
import 'package:tourism/pages/roomdetails.dart';
import 'package:tourism/pages/signup.dart';
import 'package:tourism/pages/splash.dart';
import 'package:tourism/pages/success.dart';
import 'package:tourism/pages/tripBooking.dart';
import 'package:tourism/pages/trip_details.dart';
import 'package:tourism/pages/tripaddPassenger.dart';
import 'package:tourism/pages/trips.dart';
import 'package:tourism/pages/verification.dart';
import 'package:tourism/pages/wallet_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => RegisterCubit(),
      ),
      BlocProvider(
        create: (context) => LoginCubit(),
      ),
      BlocProvider(
        create: (context) => ResetPasswrdCubit(),
      ),
      BlocProvider(
        create: (context) => CheckCodeCubit(),
      ),
      BlocProvider(
        create: (context) => EmailVerificationCubit(),
      ),
      BlocProvider(
        create: (context) => LogoutCubit(),
      ),
      BlocProvider(
        create: (context) => AttractionCubit(),
      ),
      BlocProvider(
        create: (context) => AttractionDetailsCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homepage.id: (context) => Homepage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        ForgotPassword.id: (context) => ForgotPassword(),
        // Verifictication.id: (context) => Verifictication(),
        ResetPassword.id: (context) => ResetPassword(),
        FlightPage.id: (context) => FlightPage(),
        attracPage.id: (context) => attracPage(),
        // AttractonDetails.id: (context) => AttractonDetails(
        //     imagePath: '', name: '', location: '', description: '', review: []),
        hotelSearch.id: (context) => hotelSearch(),
        hotelPage.id: (context) => hotelPage(),
        FilterOptionsDialog.id: (context) => FilterOptionsDialog(),
        RoomBooking.id: (context) => RoomBooking(),
        RoomDetails.id: (context) => RoomBooking(),
        tripPage.id: (context) => tripPage(),
        editProfile.id: (context) => editProfile(),
        profilePage.id: (context) => profilePage(),
        creatWallet.id: (context) => creatWallet(),
        walletPage.id: (context) => walletPage(),
        createwalletSuccess.id: (context) => createwalletSuccess(),
        ResultFlight.id: (context) => ResultFlight(
            flightinfores: flightInfoRes(
                nyc: '',
                time: '',
                ldn: '',
                date: '',
                depature: '',
                number: '',
                allDate: DateTime(2024),
                imagePath: '',
                departureTime: '',
                arrivalTime: '')),
        DetailsFlight.id: (context) => DetailsFlight(
              flightinfodet: flightInfoDet(
                  ldn: '', nyc: '', time: '', price: '', number: ''),
            ),
        FirstPage.id: (context) => FirstPage(),
        Onbording.id: (context) => Onbording(),
        tripBooking.id: (context) => tripBooking(),
        tripaddPassenger.id: (context) => tripaddPassenger(
              onPassengerAdded: (PassengerData) {},
            ),
        AddPassengersScreen.id: (context) => AddPassengersScreen(
              onPassengerAdded: (PassengerData) {},
            ),
        Personal_Info.id: (context) => Personal_Info(),
        Payment_Flight.id: (context) => Payment_Flight(
            paymentflight: PaymentFlight(
                nyc: '', time: '', ldn: '', date: '', price: '', number: '')),
        // Success.id: (context) => Success(),
        MyBooking.id: (context) => MyBooking(
              flight: flightInfoRes(
                nyc: '',
                time: '',
                ldn: '',
                date: '',
                depature: '',
                number: '',
                allDate: DateTime(2024),
                imagePath: '',
                departureTime: '',
                arrivalTime: '',
              ),
            ),
        favouritPage.id: (context) => favouritPage(),
      },
      home: LoginPage(),
    );
  }
}
