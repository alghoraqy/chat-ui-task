class UserModel {
  final String name;
  final String image;
  final String lastMessage;
  final UserState state;
  final bool isRead;
  final String lastTime;

  UserModel({
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.state,
    required this.isRead,
    required this.lastTime,
  });
}


enum UserState {
 idle,
 online,
 offline, 
}