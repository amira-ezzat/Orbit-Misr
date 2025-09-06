import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orbit_misr/core/app_bar.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../core/flooter.dart';

class ProjectsScreen extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: "مشروع سعادة – القاهرة الجديدة",
      description:
      "المقاول العام لبشركه العالمية للمقاولات - تنفيذ اعمال الخرسانة المسلحة والكهرباء ",
      image: "assets/images/project1.jpg",
    ),
    Project(
      title: "مستشفي الشرطة – مدينة نصر",
      description:
      "المقاول العام جرين مولدينج للمقاولات - تنفيذ اعمال سيراميك وكهرباء ",
      image: "assets/images/project1.jpg",
    ),
    Project(
      title: "كومباوند ريفالي– القاهرة الجديدة",
      description: "المطور العقاري سامكو هولدينج - اعمال MEP",
      image: "assets/images/project1.jpg",
    ),
    Project(
      title: "محطة تنقية ابو عويقل – المعادي",
      description: "المقاول العام حسن علام -اعمال تشطيبات داخلية وخارجيه - رفع كفاءه",
      image: "assets/images/project1.jpg",
    ),
    Project(
      title: "شركة الرحاب للمقاولات – العاصمة الادارية",
      description:
      "كيان عسكري حي الجوهرة - الممشي الجنوبي محور بن زايد - فيلات مرابط الخيول - اعمال كهرباء ",
      image: "assets/images/project1.jpg",
    ),
    Project(
      title: "شركة الرحاب للمقاولات – القاهرة الجديدة",
      description:
      "كمبوند درة الكرز - كمبوند ذا فيلا - مساهمة في اعمال التشطيبات الداخلية",
      image: "assets/images/project1.jpg",
    ),
    Project(
      title: "شركة الرحاب للمقاولات – 15 مايو والعالمين الجديدة",
      description:
      "سور مركز اصلاح وتأهيل سجن 15 مايو - مزارين بالعالمين الجديدة - مساهمة في اعمال التشطيبات الداخلية",
      image: "assets/images/project1.jpg",
    ),
    Project(
      title:
      "شركة الهندسية للإنشاء والتعمير – كمبوند ميفيدا باالتجمع - بادية-أكتوبر",
      description: "الاعمال الاعتيادية",
      image: "assets/images/project1.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                height: 450,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/m.jpg"),
                    fit: BoxFit.cover,
                    opacity: 0.2,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3), // غامق تحت
                            Color(0xFFCC5800),            // يختفي فوق
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            "مشروعاتنا",
                            style: GoogleFonts.cairo(
                              color: Colors.white, // خلي النص أبيض عشان يبان
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 4,
                            width: 70,
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            color: const Color(0xFFCC5800),
                          ),
                          Text(
                            "تسعى شركتنا دائمًا إلى تنفيذ مشروعات هندسية متميزة تجمع بين الجودة العالية والالتزام بالمواعيد. "
                                "من خلال فريق متخصص من المهندسين والفنيين، قدمنا حلولاً متكاملة في مجالات المقاولات العامة، "
                                "التشطيبات، الكهرباء، وأعمال البنية التحتية. إن مشروعاتنا المنتشرة في مختلف أنحاء مصر "
                                "تُجسّد التزامنا بالاحترافية وتلبية تطلعات عملائنا.",
                            style: GoogleFonts.cairo(
                              fontSize: 20,
                              height: 1.8,
                              color: Colors.white.withOpacity(0.9), // نص فاتح شوية
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...projects.asMap().entries.map((entry) {
              int index = entry.key;
              Project project = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: ProjectBlock(project: project, isImageRight: index.isEven),
              );
            }).toList(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class ProjectBlock extends StatefulWidget {
  final Project project;
  final bool isImageRight;
  const ProjectBlock({super.key, required this.project, required this.isImageRight});

  @override
  State<ProjectBlock> createState() => _ProjectBlockState();
}

class _ProjectBlockState extends State<ProjectBlock> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final imageWidget = Expanded(
      child: widget.isImageRight
          ? FadeInRight( // ✅ لو الصورة يمين تدخل من اليمين
        duration: const Duration(milliseconds: 1000),
        animate: _isVisible,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(widget.project.image, fit: BoxFit.cover),
        ),
      )
          : FadeInLeft( // ✅ لو الصورة شمال تدخل من الشمال
        duration: const Duration(milliseconds: 1000),
        animate: _isVisible,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(widget.project.image, fit: BoxFit.cover),
        ),
      ),
    );

    final textWidget = Expanded(
      child: widget.isImageRight
          ? FadeInLeft( // ✅ النص عكس الصورة
        duration: const Duration(milliseconds: 1000),
        animate: _isVisible,
        child: _buildText(),
      )
          : FadeInRight(
        duration: const Duration(milliseconds: 1000),
        animate: _isVisible,
        child: _buildText(),
      ),
    );

    return VisibilityDetector(
      key: Key(widget.project.title),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.isImageRight
            ? [imageWidget, const SizedBox(width: 40), textWidget]
            : [textWidget, const SizedBox(width: 40), imageWidget],
      ),
    );
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.project.title,
            style: GoogleFonts.cairo(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 3,
            width: 70,
            color: const Color(0xFFCC5800),
          ),
          Text(
            widget.project.description,
            style: GoogleFonts.cairo(
              fontSize: 18,
              height: 1.6,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String image;

  Project({
    required this.title,
    required this.description,
    required this.image,
  });
}
