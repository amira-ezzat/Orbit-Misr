import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 600;
              return isMobile
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  _Logo(),
                  SizedBox(height: 24),
                  _ContactSection(),
                  SizedBox(height: 24),
                  _SocialSection(),
                ],
              )
                  : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _Logo(),
                  _ContactSection(),
                  _SocialSection(),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          const Divider(color: Colors.white54),
          const SizedBox(height: 12),
          const Text(
            'جميع الحقوق محفوظة © Orbit Misr 2025',
            style: TextStyle(color: Colors.white70, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: 120,
      height: 120,
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تواصل معنا',
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: kIsWeb ? 20 : 16,
            fontWeight: FontWeight.bold,
          ),
          textDirection: TextDirection.rtl,
        ),
        Container(
          margin: const EdgeInsets.only(top: 4, bottom: 12),
          height: 2,
          width: 60,
          color: Colors.white,
        ),
        Row(
          children: const [
            Icon(Icons.phone, color: Colors.white70, size: 18),
            SizedBox(width: 8),
            Text('01007356351',
                style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(Icons.phone, color: Colors.white70, size: 18),
            SizedBox(width: 8),
            Text('01031942073',
                style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(Icons.email_outlined, color: Colors.white70, size: 18),
            SizedBox(width: 8),
            Text('mr909373@gmail.com',
                style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
      ],
    );
  }
}

class _SocialSection extends StatelessWidget {
  const _SocialSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مواقع التواصل الاجتماعي',
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: kIsWeb ? 20 : 16,
            fontWeight: FontWeight.bold,
          ),
          textDirection: TextDirection.rtl,
        ),
        Container(
          margin: const EdgeInsets.only(top: 4, bottom: 12),
          height: 2,
          width: 130,
          color: Colors.white,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                launchUrl(Uri.parse(
                  'https://www.instagram.com/orbitconstruction2025?igsh=MW5sbTk2bjNxbXAwYQ%3D%3D&utm_source=qr'
                ));
              },
              icon: const FaIcon(
                FontAwesomeIcons.instagram,
                size: 22,
                color: Colors.pinkAccent,
              ),
            ),
            IconButton(
              onPressed: () {
                launchUrl(Uri.parse(
                  'https://www.facebook.com/share/19Z8utaPtV/?mibextid=wwXIfr'
                ));
              },
              icon: const FaIcon(
                FontAwesomeIcons.facebook,
                size: 22,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                launchUrl(Uri.parse('https://wa.me/01031942073'));
              },
              icon: const FaIcon(
                FontAwesomeIcons.whatsapp,
                size: 22,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
