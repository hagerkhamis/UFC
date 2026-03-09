import 'package:flutter/material.dart';
import 'package:gyms/core/utils/gaps.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/media_query_sizes.dart';
import '../../../../register/presentation/views/widgets/register_form_decoration.dart';
import 'login_view_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // late AppLocalizations locale;
    // locale = AppLocalizations.of(context)!;
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 10.0),
          //   child: ClipPath(
          //     clipper: RoundedClipper(),
          //     child: Container(
          //       color: kPrimaryColor,
          //       height: SizeConfig.screenHeight! * 0.7,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 250, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // height: SizeConfig.screenHeight! * 0.79,
                  width: SizeConfig.screenWidth! * 0.85,
                  decoration: formDecoration(),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: LoginViewForm(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AssetsData.logo,
                        height: 100,
                        width: 150,
                        // no color tint so original logo colors show
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'UFC Revolution gym',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // title removed per design
                Gaps.vGap20,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
