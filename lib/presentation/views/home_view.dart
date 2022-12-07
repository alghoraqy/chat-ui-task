import 'package:chat_ui/core/utils/app_colors.dart';
import 'package:chat_ui/core/utils/app_constances.dart';
import 'package:chat_ui/core/utils/app_strings.dart';
import 'package:chat_ui/core/utils/app_textstyle.dart';
import 'package:chat_ui/core/utils/responsive.dart';
import 'package:chat_ui/core/utils/shared_methods.dart';
import 'package:chat_ui/presentation/cubit/app_cubit.dart';
import 'package:chat_ui/presentation/cubit/app_states.dart';
import 'package:chat_ui/presentation/views/group_chat_view.dart';
import 'package:chat_ui/presentation/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../core/dummyData/dummy_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: cubit.isExpand
              ? null
              : AppBar(
                  title: Text(
                    AppStrings.pinned,
                    style: AppTextStyle.title,
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: rwidth(context) / 25),
                      child: CircleAvatar(
                        radius: rhight(context) / 35,
                        backgroundImage: const NetworkImage(
                          AppConstances.testImg,
                        ),
                      ),
                    ),
                  ],
                ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: rwidth(context) / 50,
                vertical: rhight(context) / 80),
            child: Column(
              children: [
                SizedBox(
                  width: rwidth(context) / 1.06,
                  height: rhight(context) / 3,
                  child: AnimationLimiter(
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 1.45,
                      children: List.generate(
                        pinnedChats.length,
                        (int index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            columnCount: 2,
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: PinnedChatsComp(
                                    model: pinnedChats[index],
                                    onPressed: () {
                                      navigateTo(
                                          context,
                                          BlocProvider.value(
                                              value: AppCubit.get(context),
                                              child: const GroupChatView()));
                                    }),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: InkWell(
            onLongPress: () {
              cubit.onLongPressBottomSheet();
            },
            child: Container(
              height: cubit.isExpand ? rhight(context) : rhight(context) / 2.2,
              width: rwidth(context),
              decoration: BoxDecoration(
                color: Colors.grey.shade100.withOpacity(.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (cubit.isExpand)
                      SizedBox(
                        height: rhight(context) / 30,
                      ),
                    if (!cubit.isExpand)
                      Container(
                        height: 2.5,
                        margin: EdgeInsets.only(top: rhight(context) / 90),
                        width: rwidth(context) / 9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: rhight(context) / 150,
                          left: rwidth(context) / 35,
                          right: rwidth(context) / 35),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.recent,
                                style: AppTextStyle.title,
                              ),
                              IconButton(
                                iconSize: 28,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: rhight(context) / 80,
                          ),
                          SizedBox(
                            height: rhight(context) / 24.5,
                            child: ListView.separated(
                                padding: EdgeInsets.symmetric(
                                  horizontal: rwidth(context) / 50,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return FrameItem(
                                    text: chatCategory[index].text,
                                    onPressed: () {
                                      setState(() {
                                        chatCategory.forEach((element) {
                                          setState(() {
                                            element.isSelected = false;
                                          });
                                        });
                                        chatCategory[index].isSelected = true;
                                      });
                                    },
                                    isSelected: chatCategory[index].isSelected,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: rwidth(context) / 20,
                                  );
                                },
                                itemCount: chatCategory.length),
                          ),
                          SizedBox(
                            height: rhight(context) / 50,
                          ),
                          SizedBox(
                            height: cubit.isExpand
                                ? rhight(context) / 1.35
                                : rhight(context) / 3.3,
                            child: AnimationLimiter(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: recentChats.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 500),
                                    child: SlideAnimation(
                                      child: FadeInAnimation(
                                        curve: Curves.easeInCubic,
                                        child: MessageComponent(
                                          userModel: recentChats[index],
                                          onPressed: () {
                                            navigateTo(
                                                context,
                                                BlocProvider.value(
                                                    value: AppCubit.get(context),
                                                    child: const GroupChatView()));
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
