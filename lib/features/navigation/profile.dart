import 'package:flutter/material.dart';
import 'package:myapp/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),

      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// USER CARD
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300),
                  ),

                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          'assets/images/profile.jpg',
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sarah",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            SizedBox(height: 4),

                            Text(
                              "sarahjohnson@gmail.com",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/edit-profile');
                        },
                        icon: const Icon(Icons.edit_outlined),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Divider(color: Colors.grey.shade400),

                const SizedBox(height: 20),

                const Text(
                  "Settings & Preference",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),

                const SizedBox(height: 20),

                _settingsTile(
                  icon: Icons.notifications_none,
                  title: "Notifications",
                  onTap: () {},
                ),

                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300),
                  ),

                  child: Row(
                    children: [
                      const Icon(Icons.dark_mode_outlined),

                      const SizedBox(width: 12),

                      const Expanded(child: Text("Dark Mode")),

                      Switch(
                        activeThumbColor: AppColors.primary,
                        value: darkMode,
                        onChanged: (value) {
                          setState(() {
                            darkMode = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Divider(color: Colors.grey.shade400),

                const SizedBox(height: 20),

                const Text(
                  "Support",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),

                const SizedBox(height: 20),

                _settingsTile(
                  icon: Icons.help_outline,
                  title: "Help Center",
                  onTap: () {},
                ),

                const SizedBox(height: 15),

                _settingsTile(
                  icon: Icons.info_outline,
                  title: "About",
                  onTap: () {},
                ),

                const SizedBox(height: 20),

                _settingsTile(
                  icon: Icons.logout,
                  title: "Logout",
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
        ),

        child: Row(
          children: [
            Icon(icon),

            const SizedBox(width: 12),

            Expanded(child: Text(title)),

            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
