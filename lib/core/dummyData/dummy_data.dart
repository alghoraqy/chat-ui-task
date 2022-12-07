import 'package:chat_ui/core/utils/app_constances.dart';
import 'package:chat_ui/models/chat_category_model.dart';

import '../../models/user_model.dart';
// PINNED CHATS
List<UserModel> pinnedChats = [
  UserModel(
      name: 'Mike Mazowski',
      image: AppConstances.testImg,
      lastMessage: 'that is awesome',
      state: UserState.idle,
      isRead: false,
      lastTime: '12:00'),
  UserModel(
      name: 'Darlen Steward',
      image: AppConstances.testImg,
      lastMessage: 'Please take alook  at the images',
      state: UserState.offline,
      isRead: false,
      lastTime: '12:00',),
  UserModel(
      name: 'Gregory Rebertson',
      image: AppConstances.testImg,
      lastMessage: 'Prepare for next vacancy',
      state: UserState.online,
      isRead: true,
      lastTime: '12:00'),
  UserModel(
      name: 'Mike Mazowski',
      image: AppConstances.testImg,
      lastMessage: 'i\'d like to watch animals',
      state: UserState.idle,
      isRead: true,
      lastTime: '12:00'),
    UserModel(
      name: 'Mike Mazowski',
      image: AppConstances.testImg,
      lastMessage: 'i\'d like to watch animals',
      state: UserState.idle,
      isRead: true,
      lastTime: '12:00'),    
];

// RECENT CHATS
List<UserModel> recentChats = [
  UserModel(
      name: 'Mike Mazowski',
      image: AppConstances.testImg,
      lastMessage: 'that is awesome',
      state: UserState.idle,
      isRead: true,
      lastTime: '12:00'),
  UserModel(
      name: 'Darlen Steward',
      image: AppConstances.testImg,
      lastMessage: 'Please take alook  at the images',
      state: UserState.offline,
      isRead: false,
      lastTime: '12:00',),
  UserModel(
      name: 'Gregory Rebertson',
      image: AppConstances.testImg,
      lastMessage: 'Prepare for next vacancy',
      state: UserState.online,
      isRead: true,
      lastTime: '12 Day'),
  UserModel(
      name: 'Mike Mazowski',
      image: AppConstances.testImg,
      lastMessage: 'i\'d like to watch animals',
      state: UserState.idle,
      isRead: true,
      lastTime: 'Yesterday'),
];
 // List OF Chats Category
  List<ChatCategoryModel> chatCategory= [
    ChatCategoryModel(text: 'All Chats', isSelected: true),
    ChatCategoryModel(text: 'Personal', isSelected: false),
    ChatCategoryModel(text: 'Work', isSelected: false),
    ChatCategoryModel(text: 'Group', isSelected: false),
  ];