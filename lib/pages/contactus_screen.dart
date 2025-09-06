import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/app_bar.dart';
import '../core/flooter.dart';

class ContactusScreen extends StatelessWidget {
  const ContactusScreen({super.key});

  // 🟠 دوال فتح الروابط
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // 🟠 الخلفية
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 🟠 Layer شفاف فوق الخلفية
          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          // 🟠 المحتوى
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // العنوان
                      Text(
                        "تواصل معنا",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 80,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Color(0xFFCC5800),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),

                      const SizedBox(height: 40),

                      _buildContactCard(
                        icon: Icons.phone,
                        title: "الهاتف",
                        subtitle: "01031942073",
                        onTap: () => _launchURL("tel:01031942073"),
                      ),
                      const SizedBox(height: 16),
                      _buildContactCard(
                        icon: Icons.email,
                        title: "البريد الإلكتروني",
                        subtitle: "mr909373@gmail.com",
                        onTap: () => _launchURL("mailto:mr909373@gmail.com"),
                      ),
                      const SizedBox(height: 16),
                      _buildContactCard(
                        icon: Icons.location_on,
                        title: "العنوان",
                        subtitle: "القاهرة - مدينة بدر ",
                        onTap: () async {
                          const url = "https://maps.app.goo.gl/AE24y9Grq1NVP18k8?g_st=ipc";
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                      _buildContactCard(
                        icon: Icons.location_on,
                        title: "العنوان",
                        subtitle: "القاهرة - شيرتون",
                        onTap: () {

                        },
                      ),


                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.facebook,
                                color: Colors.blue),
                            onPressed: () => _launchURL(
                              "https://www.facebook.com/share/19Z8utaPtV/?mibextid=wwXIfr"
                            ),
                          ),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.instagram,
                                color: Colors.pink),
                            onPressed: () => _launchURL(
                              "https://www.instagram.com/orbitconstruction2025?igsh=MW5sbTk2bjNxbXAwYQ%3D%3D&utm_source=qr"
                            ),
                          ),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.whatsapp,
                                color: Colors.green),
                            onPressed: () => _launchURL("https://wa.me/01031942073"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // 🟠 زر CTA
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Color(0xFFCC5800),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => _launchURL("tel:01007356351"),
                        child: const Text(
                          "اتصل بنا الآن",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 200,),

                    ],
                  ),
                ),
Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🟠 Widget للكروت
  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Color(0xFFCC5800), size: 28),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 14, color: Colors.black54)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
