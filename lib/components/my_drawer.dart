import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/auth/login_or_register.dart';
import 'package:flutter_food_delivery_app/components/my_drawer_tile.dart';
import 'package:flutter_food_delivery_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MyDrawerTile(
            text: "HOME",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: "SETTINGS",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const Spacer(),
          MyDrawerTile(
            text: "LOGOUT",
            icon: Icons.logout,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginOrRegister(),
                ),
              );
            },
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
