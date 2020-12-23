import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_image_flutter/bloc/show_image/show_image_bloc.dart';
import 'package:mars_rover_image_flutter/ui/rover_selection/select_rover.dart';
import 'bloc/rover_selection/rover_selection_bloc.dart';
import 'file:///D:/Projects/Flutter/mars_rover_image_flutter/lib/data/repositories/rover_repository_impl.dart';
import 'utills/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RoverSelectionBloc>(
          create: (context) => RoverSelectionBloc(RoverRepositoryImpl()),
        ),
        BlocProvider<ShowImageBloc>(
          create: (context) => ShowImageBloc(RoverRepositoryImpl()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rover ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: RoverSelectionRoute,
      ),
    );
  }
}
