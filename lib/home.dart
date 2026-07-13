import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myapp/features/dashboard/models/dashboard_model.dart';
import 'package:myapp/features/dashboard/services/dashboard_service.dart';
import 'app_colors.dart';
import 'hydration_tracker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DashboardService _dashboardService = DashboardService();
  final PageController _pageController = PageController();

  DashboardModel? dashboard;

  bool isLoading = true;

  int currentBanner = 0;

  Timer? _timer;

  Future<void> loadDashboard() async {
    try {
      final data = await _dashboardService.getDashboard();

      if (!mounted) return;
      setState(() {
        dashboard = data;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  final List<BannerItem> banners = [
    BannerItem(
      image: 'assets/images/banner1.png',
      title: 'Track Your Pregnancy',
      subtitle:
          "Track your baby’s growth week by week with trusted pregnancy insights.",
    ),

    BannerItem(
      image: 'assets/images/banner2.png',
      title: 'Book Expert Doctors',
      subtitle:
          'Get professional care and monitor your pregnancy with confidence.',
    ),

    BannerItem(
      image: 'assets/images/banner3.png',
      title: 'Healthy Pregnancy Tips',
      subtitle:
          'Talk to certified doctors and book home visits anytime you need support.',
    ),
  ];

  @override
  void initState() {
    super.initState();

    loadDashboard();
    print(dashboard);

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        currentBanner++;

        if (currentBanner >= banners.length) {
          currentBanner = 0;
        }

        _pageController.animateToPage(
          currentBanner,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: dashboard?.user.profileImage != null
                  ? NetworkImage(dashboard!.user.profileImage!)
                  : null,
              child: dashboard?.user.profileImage == null
                  ? const Icon(Icons.person)
                  : null,
            ),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  dashboard?.user.fullName ?? "User",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
          ),
        ],
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // =====================================
                  // IMAGE CAROUSEL
                  // =====================================
                  SizedBox(
                    height: 180,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: banners.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentBanner = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final banner = banners[index];

                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              // Background Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  banner.image,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // Dark Overlay
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(89, 0, 0, 0),
                                ),
                              ),

                              // Text Content
                              Positioned(
                                left: 20,
                                bottom: 20,
                                right: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      banner.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      banner.subtitle,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Carousel Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      banners.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentBanner == index ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentBanner == index
                              ? AppColors.primary
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // =====================================
                  // PREGNANCY PROGRESS
                  // =====================================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F2FA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pregnancy Progress",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "Week ${dashboard?.pregnancy?.currentWeek ?? 0}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: LinearProgressIndicator(
                                  value:
                                      ((dashboard?.pregnancy?.progress ?? 0) /
                                      100),
                                  minHeight: 8,
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Text(
                              "${dashboard?.pregnancy?.progress ?? 0}%",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // =====================================
                  // QUICK ACTIONS
                  // =====================================
                  const Text(
                    "Quick Actions",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.75,
                    children: [
                      _actionCard(
                        imagePath: "assets/images/doctor.png",
                        title: "Doctors",
                        subtitle: "Consult top specialists",
                        onTap: () {
                          Navigator.pushNamed(context, '/doctors');
                        },
                      ),

                      _actionCard(
                        imagePath: "assets/images/midwives.png",
                        title: "Midwives",
                        subtitle: "Book certified midwives",
                        onTap: () {
                          Navigator.pushNamed(context, '/midwives');
                        },
                      ),

                      _actionCard(
                        imagePath: "assets/images/exercises.png",
                        title: "Exercises",
                        subtitle: "Stay active safely",
                        onTap: () {
                          Navigator.pushNamed(context, '/exercise');
                        },
                      ),

                      _actionCard(
                        imagePath: "assets/images/marketplace.png",
                        title: "Marketplace",
                        subtitle: "Shop maternity essentials",
                        onTap: () {
                          Navigator.pushNamed(context, '/marketplace');
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // =====================================
                  // APPOINTMENT
                  // =====================================
                  const Text(
                    "Upcoming Appointment",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: Text(
                        dashboard?.appointment?.name ?? "No Appointment",
                      ),
                      subtitle: Text(
                        dashboard?.appointment == null
                            ? ""
                            : "${dashboard!.appointment!.date} at ${dashboard!.appointment!.time}",
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        child: const Text("View"),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // =====================================
                  // HEALTH TIPS
                  // =====================================
                  const SizedBox(height: 25),

                  const Text(
                    "Hydration Tracker",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const HydrationTracker(),
                ],
              ),
            ),
    );
  }

  Widget _actionCard({
    required String imagePath,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(64, 0, 0, 0),
              blurRadius: 1,
              offset: const Offset(0, 0.5),
            ),
          ],
        ),

        clipBehavior: Clip.antiAlias,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Center(
                    child: Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerItem {
  final String image;
  final String title;
  final String subtitle;

  BannerItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
