import 'package:animate_do/animate_do.dart';
import 'package:chat_ui/core/dummyData/dummy_data.dart';
import 'package:chat_ui/core/utils/app_colors.dart';
import 'package:chat_ui/core/utils/app_constances.dart';
import 'package:chat_ui/core/utils/app_textstyle.dart';
import 'package:chat_ui/core/utils/assets_manager.dart';
import 'package:chat_ui/core/utils/responsive.dart';
import 'package:chat_ui/presentation/cubit/app_cubit.dart';
import 'package:chat_ui/presentation/cubit/app_states.dart';
import 'package:chat_ui/presentation/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/group_chat_widgets.dart';

class GroupChatView extends StatefulWidget {
  const GroupChatView({super.key});

  @override
  State<GroupChatView> createState() => _GroupChatViewState();
}

class _GroupChatViewState extends State<GroupChatView> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leadingWidth: rwidth(context) / 12,
            backgroundColor: Colors.white,
            leading: IconButton(
              iconSize: 30,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: AppColors.secondaryText,
              ),
            ),
            title: Row(
              children: [
                CircleAvatar(
                  radius: rhight(context) / 30,
                  backgroundImage: const NetworkImage(AppConstances.testImg),
                ),
                SizedBox(
                  width: rwidth(context) / 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: rwidth(context) / 2.2,
                      child: Text(
                        'FullSNack Designers',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.title.copyWith(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: rhight(context) / 150,
                    ),
                    SizedBox(
                      width: rwidth(context) / 2.2,
                      child: Text(
                        '7 Online, From 12 People',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.messageBody.copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
            actions: [
              InkWell(
                  onTap: () {},
                  child: Ink(
                    child: Icon(
                      Icons.videocam,
                      color: AppColors.secondaryText,
                      size: 28,
                    ),
                  )),
              SizedBox(
                width: rwidth(context) / 100,
              ),
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.ellipsisVertical,
                    color: AppColors.secondaryText,
                  )),
            ],
          ),
          body: FadeInUp(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics:const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: rhight(context) / 50),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CircleImage(
                                    userModel: recentChats.first,
                                    height: rhight(context) / 16,
                                    width: rwidth(context) / 6.5,
                                  ),
                                  buildMessage(context)
                                ],
                              )),
                        ),
                        SizedBox(
                          height: rhight(context) / 50,
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CircleImage(
                                  userModel: recentChats[2],
                                  height: rhight(context) / 16,
                                  width: rwidth(context) / 6.5,
                                ),
                                buildMyMessage(context)
                              ],
                            )),
                        SizedBox(
                          height: rhight(context) / 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(AssetsImg.typing),
                              height: rhight(context) / 10,
                              width: rwidth(context) / 4,
                            ),
                            SizedBox(
                              width: rwidth(context) / 7,
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Row(
                                    children: const[
                                       CircleAvatar(
                                        radius: 11,
                                        backgroundImage:
                                            NetworkImage(AppConstances.testImg),
                                      ),
                                    ],
                                  ),
                                   Positioned(
                                    right: rwidth(context)/25,
                                     child: const CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.white,
                                       child: CircleAvatar(
                                            radius: 11,
                                            backgroundImage:
                                                NetworkImage(AppConstances.testImg2),
                                          ),
                                     ),
                                   ),
                                   Positioned(
                                    right: rwidth(context)/200,
                                     child: const CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.white,
                                       child: CircleAvatar(
                                            radius: 11,
                                            backgroundImage:
                                                NetworkImage(AppConstances.testImg3),
                                          ),
                                     ),
                                   ),
                                ],
                              ),
                            ),
                            Text(
                              '+2 other are typing',
                              style: AppTextStyle.groupMessage
                                  .copyWith(color: AppColors.secondaryText),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: rwidth(context),
                      height: rhight(context) / 20,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15)),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: rwidth(context) / 30),
                        child: Row(
                          children: [
                            Text(
                              '#General',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.main),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_up_sharp,
                                  color: AppColors.main,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: FaIcon(
                                  FontAwesomeIcons.ellipsisVertical,
                                  color: AppColors.main,
                                  size: 20,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: rwidth(context),
                      height: .3,
                      color: AppColors.secondaryText,
                    ),
                    TextFormField(
                      minLines: 1,
                      maxLines: 6,
                      controller: cubit.sendMessageController,
                      onChanged: (value) {
                        if (cubit.sendMessageController.text == '') {
                          setState(() {
                            isEmpty = true;
                          });
                        } else {
                          setState(() {
                            isEmpty = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: rhight(context) / 35),
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.faceSmile)),
                          suffixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Ink(
                                    child: Icon(
                                      Icons.attach_file_rounded,
                                      size: 28,
                                      color: AppColors.secondaryText,
                                    ),
                                  )),
                              MaterialButton(
                                onPressed: () {},
                                color: AppColors.main,
                                height: rhight(context) / 15,
                                shape: const CircleBorder(),
                                padding: EdgeInsets.zero,
                                child: FaIcon(
                                  isEmpty == false
                                      ? FontAwesomeIcons.solidPaperPlane
                                      : FontAwesomeIcons.microphone,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          hintText: 'Write a message ...',
                          hintStyle: AppTextStyle.hintStyle,
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



