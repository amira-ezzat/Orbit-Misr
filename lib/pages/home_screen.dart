import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orbit_misr/pages/services_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/animation_card.dart';
import '../core/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/flooter.dart';
import 'contactus_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late ScrollController _projectsScrollController;
  late ScrollController _clientsScrollController;
  final List<String> logos = [
    "assets/images/c1.jpg",
    "assets/images/c2.jpg",
    "assets/images/c3.jpg",
    "assets/images/c4.jpg",
    "assets/images/c5.jpg",
    "assets/images/c6.jpg",
    "assets/images/c7.jpg",
    "assets/images/c8.jpg",

  ];
  final List<Map<String, String>> services = [
    {"image": "assets/images/s1.jpg", "title": "أعمال البناء والخرسانة"},
    {"image": "assets/images/s22.jpg", "title": "التشطيبات الداخلية"},
    {"image": "assets/images/s44.jpg", "title": "أعمال السباكة"},
    {"image": "assets/images/s3.jpg", "title": "اعمال الكهرباء"},
    {"image": "assets/images/s5.jpg", "title": "اعمال السباكة"},
  ];


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    // 🟢 Scroll Controllers
    _projectsScrollController = ScrollController();
    _clientsScrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll(_projectsScrollController);
      _startAutoScroll(_clientsScrollController);
    });
  }

  void _startAutoScroll(ScrollController controller) async {
    while (mounted) {
      await Future.delayed(const Duration(milliseconds: 5)); // خليها أسرع/أبطأ حسب رغبتك
      if (controller.hasClients) {
        final maxScroll = controller.position.maxScrollExtent;
        final current = controller.offset;
        final next = current + 1;

        if (next >= maxScroll) {
          controller.jumpTo(0);
        } else {
          controller.jumpTo(next);
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _projectsScrollController.dispose();
    _clientsScrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // أنيميشن الهيدر
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: child,
                  ),
                );
              },
              child: Image.asset('assets/images/background.jpg'),
            ),

            const SizedBox(height: 80),
// 🟠 من نحن
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "شركة المقاولات Orbit Misr",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.tajawal(
                        fontSize: 28, // حجم مناسب وراقي
                        fontWeight: FontWeight.w700, // غامق لكن مش تقيل زيادة
                        color: Colors.black87,
                        height: 1.4,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 80,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFCC5800),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 12), // مسافة صغيرة بين العنوان والوصف
                    Text(
                      "شركة Orbit Misr تقدم أفضل خدمات المقاولات العامة والتشطيبات "
                          "بأعلى معايير الجودة والدقة. خبرة طويلة في تنفيذ المشاريع "
                          "الكبرى والفلل والوحدات السكنية. "
                          "نتميز بالالتزام بالمواعيد، استخدام أحدث مواد البناء، "
                          "وتنفيذ التصاميم العصرية بما يتناسب مع احتياجات عملائنا. "
                          "فريقنا من المهندسين والفنيين يعمل على تحقيق أعلى مستوى من الكفاءة "
                          "وتحويل أفكارك إلى واقع ملموس يليق بذوقك.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                        fontSize: 18, // مريح للقراءة
                        fontWeight: FontWeight.w500, // وزن متوسط
                        color: Colors.black87,
                        height: 1.8, // تباعد جميل بين الأسطر
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 60),

            // 🟠 خدماتنا
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "مشروعاتنا",
                    style: GoogleFonts.tajawal(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: 80,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCC5800),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    height: 420,
                    child: ListView.builder(
                      controller: _projectsScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const ServicesScreen()),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 16),
                            width: 280, // عرض الكارد
                            child: _buildServiceImageCard(service['image']!, service['title']!),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            const SizedBox(height: 60),

            // 🟠 CTA - اطلب عرض سعر
            Container(
              color: const Color(0xFFCC5800),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Column(
                children: [
                  Text(
                    "هل لديك مشروع تريد تنفيذه؟",
                    style: GoogleFonts.tajawal(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFFCC5800),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactusScreen()),
                      );
                    },
                    child: const Text("ابدأ مشروعك معنا"),
                  ),
                ],
              ),
            ),
            // 🟢 قسم العملاء (اللوجوهات)
            Container(
              color:Colors.grey.shade50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "عملاؤنا",
                    style: GoogleFonts.tajawal(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.3,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: 80,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCC5800),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 30),

                  SizedBox(
                    height: 100,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        return true;
                      },
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _clientsScrollController,
                        itemCount: logos.length,
                        clipBehavior: Clip.none,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: AnimatedLogoCard(imagePath: logos[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🟢 الفوتر
           Footer(),
          ],
        ),
      ),
    );
  }
}


Widget _buildServiceImageCard(String imagePath, String title) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Stack(
      children: [
        // صورة خلفية
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Overlay شفاف
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        // النص
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: Text(
            title,
            style: GoogleFonts.tajawal(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
