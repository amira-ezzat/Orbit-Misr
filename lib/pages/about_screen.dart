import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_bar.dart';
import '../core/flooter.dart';
import 'contactus_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
         // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
              opacity: 0.2,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "من نحن",
                      style: GoogleFonts.cairo(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 3,
                      width: 60,
                      color: Color(0xFFCC5800),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "شركة أوربت مصر للمقاولات العامة والتشطيبات والتوريدات",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "هي شركة مصرية في قطاع المقاولات، تأسست لتقديم خدمات متكاملة تشمل: "
                          "• التصميم المعماري والداخلي "
                          "• أعمال الخرسانة المسلحة "
                          "• التشطيبات الداخلية والخارجية "
                          "• التوريدات الإنشائية "
                          "• خدمات الفرش الكامل "
                          "نتميز بفريق هندسي وإداري ذو خبرة، يحرص على تسليم المشاريع وفق أعلى معايير الجودة، وضمن الجداول الزمنية المتفق عليها.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        height: 1.8,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      "رسالتنا",
                      style: GoogleFonts.cairo(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 2,
                      width: 40,
                      color: Color(0xFFCC5800),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "نسعى لتقديم حلول مبتكرة في مجال البناء والتشطيبات "
                          "تواكب التطور العمراني وتلبي احتياجات عملائنا "
                          "مع الحفاظ على الجودة والالتزام بالمواعيد.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "رؤيتنا",
                      style: GoogleFonts.cairo(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 2,
                      width: 40,
                      color:Color(0xFFCC5800),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "أن نكون الخيار الأول لعملائنا في مصر والشرق الأوسط "
                          "في مجال المقاولات والتشطيبات من خلال تقديم مشاريع متميزة "
                          "ترتكز على الجودة، الثقة، والإبداع.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFCC5800),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContactusScreen()),
                        );                },
                      child: Text(
                        "تواصل معنا",
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200,),
             Footer()

            ],
          ),
        ),
      ),
    );
  }
}

