import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/profile/bloc/profile_bloc.dart';
import 'package:transevilz/profile/screens/syarat_dan_ketentuan.dart';
import 'package:transevilz/profile/widget/reuse_app_bar_profile.dart';
import 'package:transevilz/profile/widget/switch_button.dart';

class ProfilePrep extends StatelessWidget {
  const ProfilePrep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(ButtonEvent()),
      child: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullname = '';

  Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('pin');
    prefs.remove('fullname');
    prefs.remove('email');
  }

  @override
  void initState() {
    Helpers.getUserData('fullname').then((value) {
      setState(() {
        fullname = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                const ReuseAppBar(title: 'Akun Saya'),
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 13),
                        Card(
                          color: const Color(0xFFF1F7FF),
                          shadowColor:
                              const Color.fromRGBO(131, 180, 254, 0.15),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 139,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      fullname,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 45),
                        FutureBuilder<bool>(
                          future: context.read<ProfileBloc>().getLanguage(
                              context.read<ProfileBloc>().isLanguageID),
                          builder: (context, snap) {
                            print('Language: ${snap.data}');
                            if (snap.connectionState == ConnectionState.done) {
                              if (snap.hasData) {
                                return LanguageSwitch(
                                  nilai: (snap.data) ??
                                      context.read<ProfileBloc>().isLanguageID,
                                  onchanged: (v) {
                                    context.read<ProfileBloc>().setLanguage(
                                        context
                                            .read<ProfileBloc>()
                                            .isLanguageID = v);
                                  },
                                );
                              }
                            }
                            return Container();
                          },
                        ),
                        FutureBuilder<bool>(
                          future: context.read<ProfileBloc>().getPermission(
                              context.read<ProfileBloc>().isAllowed),
                          builder: (context, snap) {
                            print('Permission: ${snap.data}');
                            if (snap.connectionState == ConnectionState.done) {
                              if (snap.hasData) {
                                return PermissionSwitch(
                                  nilai: (snap.data) ??
                                      context.read<ProfileBloc>().isAllowed,
                                  onchanged: (v) {
                                    context.read<ProfileBloc>().setPermission(
                                        context.read<ProfileBloc>().isAllowed =
                                            v);
                                  },
                                );
                              }
                            }
                            return Container();
                          },
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const Syarat();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Syarat & Ketentuan',
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xFF2075F3),
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 18),
                                  const Divider(
                                    thickness: 1,
                                  )
                                ],
                              ),
                            )),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            _onBackPressed(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                FeatherIcons.power,
                                color: Colors.red,
                                size: 24,
                              ),
                              SizedBox(width: 11),
                              Text(
                                'Keluar',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Logout',
          style: TextStyle(color: Colors.red),
          // textAlign: TextAlign.center,
        ),
        content: const Text(
          'Apakah anda yakin untuk logout?',
          // textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Tidak"),
              ),
              TextButton(
                onPressed: () {
                  logout().then(
                    (value) => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const AppScreen(),
                      ),
                      (route) => false,
                    ),
                  );
                },
                child: const Text(
                  "Ya",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
