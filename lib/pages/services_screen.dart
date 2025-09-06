import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orbit_misr/core/app_bar.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../core/flooter.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

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
                    image: AssetImage("assets/images/s.jpg"),
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
                            Colors.black.withOpacity(0.2), // غامق تحت
                            Color(0xFFCC5800),            // يختفي فوق
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                      // color: Color(0xFFCC5800),
                      child: Column(
                        children: [
                          Text(
                            "خدماتنا",
                            style: GoogleFonts.cairo(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
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
                            "أوربت مصر للمقاولات العامة – شريكك في بناء المستقبل!"
                            "، نقدم حلولًا متكاملة في قطاع الإنشاءات تشمل:"
                             "  التصميم المعماري والداخلي (Design)"
                         " 🏗 أعمال الخرسانة المسلحة أرقى التشطيبات الداخلية والخارجية خدمات الفرش الكامل مع الالتزام بأعلي معاييرالجودة",
                            style: GoogleFonts.cairo(
                              color: Colors.white,
                              fontSize: 20,
                              height: 1.6,
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
            ServiceBlock(
              image: "assets/images/ss2.jpg",
              title: "التصميم المعماري والداخلي(Design)",
              description:
              "نقدم حلول متكاملة للتشطيبات الداخلية والخارجية باستخدام خامات عصرية وألوان مبتكرة، مما يضيف لمسات جمالية فريدة ويعكس ذوق عملائنا.",
              imageLeft: true,
            ),
            const SizedBox(height: 40),
            ServiceBlock(
              image: "assets/images/s1.jpg",
              title: "اعمال الخرسانة المسلحة",
              description:
              "نقوم بتنفيذ جميع أعمال البناء والخرسانة المسلحة بجودة عالية ودقة متناهية، باستخدام أحدث التقنيات لضمان متانة المباني واستمراريتها.",
              imageLeft: false,
            ),


            ServiceBlock(
              image: "assets/images/s3.jpg",
              title: "اعمال التشطيبات الداخليه والخارجيه",
              description:
              "نوفر جميع خدمات الكهرباء من التمديدات والتوصيلات إلى أعمال الصيانة واللوحات الكهربائية، مع الالتزام بمعايير الأمان والسلامة.",
              imageLeft: true,
            ),
            const SizedBox(height: 40),

            ServiceBlock(
              image: "assets/images/s44.jpg",
              title: "اعمال الفرش بالكامل (Furniture)",
              description:
              "ننفذ أعمال السباكة بدقة وكفاءة عالية سواء للمباني السكنية أو التجارية، باستخدام خامات عالية الجودة لضمان استدامة الخدمة.",
              imageLeft: false,
            ),
           // const SizedBox(height: 40),
            //
            // ServiceBlock(
            //   image: "assets/images/s5.jpg",
            //   title: "اعمال السيراميك",
            //   description:
            //   "نقدم خدمات تركيب السيراميك والرخام والبورسلين بأحدث التصاميم العصرية، مع ضمان جودة التشطيب والالتزام بالمقاييس الفنية.",
            //   imageLeft: true,
            // ),


            //const SizedBox(height: 60),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class ServiceBlock extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final bool imageLeft;

  const ServiceBlock({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.imageLeft,
  });

  @override
  State<ServiceBlock> createState() => _ServiceBlockState();
}

class _ServiceBlockState extends State<ServiceBlock> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final imageWidget = Expanded(
      child: FadeInRight(
        duration: const Duration(milliseconds: 1000),
        animate: _isVisible,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Image.asset(widget.image, fit: BoxFit.cover, height: 400),
        ),
      ),
    );

    final textWidget = Expanded(
      child: FadeInLeft(
        duration: const Duration(milliseconds: 1000),
        animate: _isVisible,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.cairo(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 3,
                width: 70,
                color: const Color(0xFFCC5800),
              ),
              Text(
                widget.description,
                style: GoogleFonts.cairo(
                  fontSize: 18,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return VisibilityDetector(
      key: Key(widget.title),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.imageLeft
            ? [
          // ✅ الصورة بدون أي padding عشان تلمس طرف الشاشة
          Expanded(child: imageWidget),

          const SizedBox(width: 30),

          // ✅ النص بس هو اللي معاه padding
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: textWidget,
            ),
          ),
        ]
            : [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: textWidget,
            ),
          ),
          const SizedBox(width: 30),
          Expanded(child: imageWidget),
        ],
      ),
    );
  }
}
