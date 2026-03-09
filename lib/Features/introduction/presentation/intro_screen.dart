import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gyms/core/utils/assets.dart';
import 'package:gyms/core/utils/gaps.dart';

import '../../../core/locale/app_localizations.dart';
import '../../../core/utils/constants.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kPrimaryColor,
              kPrimaryColor,
              kPrimaryColor,
            ],
            begin: const Alignment(-0.0, -0.68),
            end: const Alignment(0.0, 0.68),
          ),
        ),
        child: ZoomIn(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top section with logo and title
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Image.asset(
                      AssetsData.logo,
                      height: screenSize.height * .3,
                      width: screenSize.width * .6,
                    ),
                    Gaps.vGap20,
                    Text(
                      'UFC Revolution gym',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.vGap30,
                    SizedBox(
                      width: screenSize.width - 40,
                      child: Text(
                        'تطبيق جيم النعماني يرحب بكم ويقدم لكم اسهل الخدمات والاطلاع على الاشتراكات الاخري',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Bottom section with skip button and dots
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  children: [
                    // Dots indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    Gaps.vGap40,
                    // Skip button
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          kLoginScreenRoute,
                        );
                      },
                      child: Text(
                        locale.translate('skip')!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
