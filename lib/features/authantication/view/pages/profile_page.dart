import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/authantication/view/pages/myProfile/edit_my_address_page.dart';
import 'package:aakrikada/features/authantication/view/pages/myProfile/edit_my_profile_page.dart';
import 'package:aakrikada/features/authantication/view/pages/myProfile/logout_confirm_alert_box.dart';
import 'package:aakrikada/features/authantication/view/pages/myProfile/select_language_page.dart';
import 'package:aakrikada/features/authantication/view/widgets/profile_card_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // language provider
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDCFFF1), Color(0xFFCEF0FC)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  lang.myAc,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colorpallets.primary,
                  ),
                ),
              ),

              //White Container
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colorpallets.grey50Color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 88,
                          height: 88,
                          child: Image.asset('assets/images/img_avathar.jpg'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'User',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colorpallets.blackColor,
                          ),
                        ),
                        ProfileCardWidget(
                          icBgColor: Color(0Xffe3d0fe),
                          icon: Icon(
                            Icons.person,
                            color: Colorpallets.blueColor,
                          ),
                          title: lang.myProfile,
                          onTap: () {
                            // Nvigate to my profile page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditMyProfilePage(),
                              ),
                            );
                          },
                        ),
                        ProfileCardWidget(
                          icBgColor: Color(0Xffcff6e0),
                          icon: Icon(
                            Icons.gps_not_fixed,
                            color: Colorpallets.greenColor,
                          ),
                          title: lang.myAdress,
                          onTap: () {
                            // Nvigate to my address page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditMyAddressPage(),
                              ),
                            );
                          },
                        ),
                        ProfileCardWidget(
                          icBgColor: Color(0Xffcaefff),
                          icon: Icon(
                            Icons.translate_sharp,
                            color: Colorpallets.lightBlueColor,
                          ),
                          title: lang.selectLang,
                          onTap: () {
                            // Nvigate to  laguage selection page

                            showLanguageDialog(
                              context: context,
                              title: lang.selectLang,
                            );
                          },
                        ),
                        ProfileCardWidget(
                          icBgColor: Color(0Xfffee1d1),
                          icon: Icon(
                            Icons.power_settings_new_sharp,
                            color: Color(0XFFdf8057),
                          ),
                          title: lang.logOut,
                          isLogout: true,
                          onTap: () {
                            // Nvigate to logout confirm page

                            showLogoutConfirmationDialog(
                              context: context,

                              onConfirm: () {
                                // Logout methosds
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
