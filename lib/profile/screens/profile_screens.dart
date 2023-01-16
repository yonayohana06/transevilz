import 'package:flutter/material.dart';
import 'package:transevilz/profile/widget/reuse_app_bar_profile.dart';
import 'package:transevilz/profile/widget/switch_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ReuseAppBar(title: 'Akun Saya'),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: 13),
                    Card(
                      color: Color(0xFFF1F7FF),
                      shadowColor: Color.fromRGBO(131, 180, 254, 0.15),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: 139,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dinda Salsabila',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                Icon(
                                  Icons.edit,
                                  size: 15,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 45),
                    LanguageSwitch(
                      nilai: true,
                      onchanged: (v) {

                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
