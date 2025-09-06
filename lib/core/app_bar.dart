import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orbit_misr/pages/about_screen.dart';
import 'package:orbit_misr/pages/services_screen.dart';

import '../pages/contactus_screen.dart';
import '../pages/home_screen.dart';
import '../pages/projects_screen.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {



  const CustomAppBar({
    super.key,

  });
  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem('الرئيسية', context,),
              SizedBox(width: screenWidth > 600 ? 33 : 12),
              _buildNavItem('خدماتنا', context,),
              SizedBox(width: screenWidth > 600 ? 33 : 12),
              _buildNavItem('مشاريعنا', context, ),
              SizedBox(width: screenWidth > 600 ? 33 : 12),
              _buildNavItem('من نحن', context,),
              SizedBox(width: screenWidth > 600 ? 33 : 12),
              _buildNavItem('تواصل معنا', context,),
            ],
          ),
          const Spacer(),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>HomeScreen()),
              );
            },
            child: const Image(
              image: AssetImage('assets/images/logo.png'),
              width: 66,
              height: 88,
            ),
          ),

          SizedBox(
            width: 22,
          )
        ],
      ),
    );
  }

  Widget _buildNavItem(String text, BuildContext context,) {
    return InkWell(
      onTap: () {
        if (text == 'من نحن') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutScreen()),
          );
        } else if (text == 'الرئيسية') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>HomeScreen()),
          );
        }
        else if (text == 'تواصل معنا')
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactusScreen( )),
          );
        }else if (text == 'مشاريعنا')
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProjectsScreen( )),
          );
        }
        else if (text == 'خدماتنا')
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ServicesScreen( )),
          );
        }
      },
      child: Text(
        text,
        style:  GoogleFonts.cairo(
        //  fontFamily: 'arb',
          fontWeight: FontWeight.bold,
          color: const Color(0xFFCC5800),
          fontSize: 20,
        ),
      ),
    );
  }
}