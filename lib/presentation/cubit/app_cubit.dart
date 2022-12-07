import 'package:chat_ui/presentation/cubit/app_states.dart';
import 'package:chat_ui/presentation/views/calls.dart';
import 'package:chat_ui/presentation/views/home_view.dart';
import 'package:chat_ui/presentation/views/profile.dart';
import 'package:chat_ui/presentation/views/recent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  // BOTTOM NAV ICON
  List<BottomNavigationBarItem> navBarItems =const [
    BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.solidComment,  size: 25,) ,label: 'chat'),
    BottomNavigationBarItem(icon: Icon(Icons.access_time_filled_outlined, size: 28,) ,label: ''),
    BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.phoneVolume,  size: 23,) ,label: 'calls'),
    BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.solidCircleUser,size: 26,) ,label: 'profile'),
  ];
  int currentIndex = 0;
  void changeIndex(int index){
    emit(InitAppState());
    currentIndex = index;
    emit(ChangeBottomIndexState());
  }

  // VIEWS
  List<Widget> views =const [
   HomeView(),
    Recent(),
    Calls(),
    Profile()
  ];

bool isExpand =false;
  void onLongPressBottomSheet(){
    isExpand = !isExpand;
    emit(ChangeOnLongPressBottomSheetState());
  }



/// TEXT FORM CONTROLLERS
TextEditingController sendMessageController =TextEditingController(); 
 

}
