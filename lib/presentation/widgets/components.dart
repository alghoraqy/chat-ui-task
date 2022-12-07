import 'package:chat_ui/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_textstyle.dart';
import '../../core/utils/assets_manager.dart';
import '../../core/utils/responsive.dart';

class PinnedChatsComp extends StatelessWidget {
  final UserModel model;
  final  VoidCallback onPressed;
  const PinnedChatsComp({super.key, required this.model, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.grey.withOpacity(.15),
            child: InkWell(
              onTap: onPressed,
              child: Ink(
                height: rhight(context) / 6.8,
                width: rwidth(context) / 2.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: model.isRead
                        ? Colors.grey.withOpacity(.15)
                        : AppColors.backgroundPinned),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: rwidth(context) / 50,
                          vertical: rhight(context) / 70),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                height: rhight(context) / 18,
                                width: rwidth(context) / 8,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image(
                                  image: NetworkImage(model.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: rwidth(context) / 80,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor: model.state ==
                                            UserState.idle
                                        ? AppColors.yellow
                                        : model.state == UserState.online
                                            ? AppColors.green
                                            : model.state == UserState.offline
                                                ? AppColors.brown
                                                : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: rwidth(context) / 50,
                          ),
                          Expanded(
                            child: Text(
                              model.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.userName,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: rhight(context) / 90,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: rwidth(context) / 20),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.reply,
                            color: AppColors.secondaryText,
                            size: 12,
                          ),
                          SizedBox(
                            width: rwidth(context) / 100,
                          ),
                          Expanded(
                            child: Text(
                              model.lastMessage,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.messageBody,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        if (!model.isRead)
          Positioned(
            top: rhight(context) / 80,
            right: rwidth(context) / 50,
            child: CircleAvatar(
              backgroundColor: AppColors.main,
              radius: 7,
            ),
          )
      ],
    );
  }
}

class FrameItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  bool isSelected = false;
  FrameItem({super.key, 
    required this.text,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Material(
        child: InkWell(
          onTap: onPressed,
          child: Ink(
            padding: EdgeInsets.symmetric(
                horizontal: rwidth(context) / 45,
                vertical: rhight(context) / 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: isSelected == true ? AppColors.main : Colors.white),
            child: Text(
              text,
              style: AppTextStyle.messageBody.copyWith(
                  color: isSelected == true
                      ? Colors.white
                      : AppColors.primaryText.withOpacity(.3)),
            ),
          ),
        ),
      ),
    );
  }
}

class MessageComponent extends StatelessWidget {
  final UserModel userModel;
  final VoidCallback onPressed;
  const MessageComponent({super.key, required this.userModel, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        child: InkWell(
          onTap: onPressed,
          child: Ink(
            padding: EdgeInsets.symmetric(
                horizontal: rwidth(context) / 100,
                vertical: rhight(context) / 150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: !userModel.isRead
                  ? AppColors.main.withOpacity(.1)
                  : Colors.transparent,
            ),
            child: Row(
              children: [
                CircleImage(userModel: userModel),
                SizedBox(
                  width: rwidth(context) / 40,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: rwidth(context) / 2,
                            child: Text(
                              userModel.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.userName,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            userModel.lastTime,
                            style: AppTextStyle.messageBody,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: rhight(context) / 100,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: rwidth(context) / 1.6,
                            child: Text(
                              userModel.lastMessage,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.messageBody,
                            ),
                          ),
                          const Spacer(),
                          !userModel.isRead
                              ? CircleAvatar(
                                  radius: 12,
                                  backgroundColor: AppColors.main,
                                  child: const Text(
                                    '5',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  final UserModel userModel;
  double?  height;
  double?  width;
  CircleImage({super.key, required this.userModel, this.height,this.width});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height:height ?? rhight(context) / 13,
          width:width?? rwidth(context) / 5.1,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.antiAlias,
          child: FadeInImage(
            placeholder: const AssetImage(AssetsImg.loading),
            image: NetworkImage(userModel.image),
            fit: BoxFit.cover,
            placeholderFit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: rwidth(context) / 50,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 6,
              backgroundColor: userModel.state == UserState.idle
                  ? AppColors.yellow
                  : userModel.state == UserState.online
                      ? AppColors.green
                      : userModel.state == UserState.offline
                          ? AppColors.brown
                          : null,
            ),
          ),
        )
      ],
    );
  }
}
