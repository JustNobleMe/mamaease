import 'package:flutter/material.dart';
import 'package:myapp/app_colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController(text: "Sarah Johnson");

  final phoneController = TextEditingController(text: "+234 8082348756");

  final emailController = TextEditingController(
    text: "Sarah Johnson@gmail.com",
  );

  final locationController = TextEditingController(text: "Lagos");

  final bloodController = TextEditingController(text: "O+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),

      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),

              const SizedBox(height: 30),

              _inputField(
                label: "Full Name",
                controller: nameController,
                icon: Icons.person,
              ),

              _inputField(
                label: "Phone Number",
                controller: phoneController,
                icon: Icons.phone,
              ),

              _inputField(
                label: "Email",
                controller: emailController,
                icon: Icons.email,
              ),

              _inputField(
                label: "Location",
                controller: locationController,
                icon: Icons.location_on,
              ),

              _inputField(
                label: "Blood Group",
                controller: bloodController,
                icon: Icons.bloodtype,
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),

                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile Updated")),
                    );
                  },

                  child: const Text(
                    "SAVE CHANGES",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: controller,

            decoration: InputDecoration(
              suffixIcon: Icon(icon),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
