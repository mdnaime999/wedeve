import 'package:flutter/material.dart';

import '../widgets/account.view.dart';
import '../widgets/notification.view.dart';
import '../widgets/password.view.dart';
import '../widgets/wishlist.view.dart';

class ProfileExpansion {
  final int id;
  final String name;
  final String icon;
  final Widget page;

  ProfileExpansion({required this.id, required this.name, required this.icon, required this.page});
}

List<ProfileExpansion> profileExpansions = [
  ProfileExpansion(id: 1, name: 'Account', icon: 'assets/user-icon.svg', page: AccountView()),
  ProfileExpansion(id: 2, name: 'Passwords', icon: 'assets/lock-icon.svg', page: PasswordView()),
  ProfileExpansion(id: 3, name: 'Notification', icon: 'assets/bell-icon.svg', page: NotificationView()),
  ProfileExpansion(id: 4, name: 'Wishlist', icon: 'assets/heart-icon.svg', page: WishlistView()),
];
