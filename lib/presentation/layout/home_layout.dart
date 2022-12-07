import 'package:chat_ui/core/utils/app_colors.dart';
import 'package:chat_ui/presentation/cubit/app_cubit.dart';
import 'package:chat_ui/presentation/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.main,
                onPressed: () {},
                child:const FaIcon(
                  FontAwesomeIcons.commentMedical,
                  color: Colors.white,
                  size: 22,
                )),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.navBarItems,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.main,
              unselectedItemColor: AppColors.secondaryText,
              onTap: (value) {
                cubit.changeIndex(value);
              },
            ),
            body: cubit.views[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
