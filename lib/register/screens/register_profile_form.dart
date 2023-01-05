import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transevilz/register/bloc/register_bloc.dart';
import 'package:transevilz/register/widget/checkbox.dart';
import 'package:transevilz/register/widget/dialog.dart';
import 'package:transevilz/register/widget/dropdownform.dart';
import 'package:transevilz/register/widget/reuse_app_bar.dart';

import '../widget/title_form.dart';

class RegisterProfileReq extends StatelessWidget {
  const RegisterProfileReq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: RegisterProfileForm(),
    );
  }
}


class RegisterProfileForm extends StatefulWidget {
  RegisterProfileForm({Key? key}) : super(key: key);

  @override
  State<RegisterProfileForm> createState() => _RegisterProfileFormState();
}

class _RegisterProfileFormState extends State<RegisterProfileForm> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final oldCheckboxTheme = theme.checkboxTheme;
    final newCheckBoxTheme = oldCheckboxTheme.copyWith(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );
    return Theme(
      data: theme.copyWith(checkboxTheme: newCheckBoxTheme),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if(context.read<RegisterBloc>().isActive) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize:
                      Size(MediaQuery.of(context).size.width, 45),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => SuccessDialog(
                            image: Image.asset('assets/images/success.png'),
                            status: 'Cek email anda untuk melakukan aktivasi akun',
                            buttonlabel: 'Cek Email Sekarang',
                          )
                      );
                    },
                    child: const Text("Kirim"),
                  );
                }
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 45),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: null,
                  child: const Text("Kirim"),
                );
              },
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Form(
                key: context.read<RegisterBloc>().formkey,
                onChanged: () {
                  context.read<RegisterBloc>().add(RegisterFormButtonEvent());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: 64),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BlocBuilder<RegisterBloc, RegisterState>(
                            builder: (context, state) {
                              print(state);
                              return Column(
                                children: [
                                  BlocBuilder<RegisterBloc, RegisterState>(
                                    builder: (context, state) {
                                      if (state is RegisterFormButton) {
                                        return Container(
                                          height: 60,
                                          width: 60,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(60),
                                            child: context.read<RegisterBloc>().imageContain == null
                                                ? Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFF1F7FF),
                                                  shape: BoxShape.circle
                                              ),
                                              height: 60,
                                              width: 60,
                                              child: Center(
                                                child: Image.asset(
                                                  'assets/images/user-plus.png',
                                                  height: 28.8,
                                                  width: 28.8,
                                                ),
                                              ),
                                            )
                                                : Image.file(context.read<RegisterBloc>().imageContain!, fit: BoxFit.fitWidth,),
                                          ),
                                        );
                                      }
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFF1F7FF),
                                            shape: BoxShape.circle
                                        ),
                                        height: 60,
                                        width: 60,
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/user-plus.png',
                                            height: 28.8,
                                            width: 28.8,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        context.read<RegisterBloc>().add(ImageDisplayEvent());
                                      });
                                    },
                                    child: Text(
                                      'Tambah gambar',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'DM Sans',
                                        color: Color(0xFF7A7A7A),
                                        letterSpacing: 0.096,
                                        height: 1.315,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TitleForm(title: 'Email'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(
                                          context.read<RegisterBloc>().emailFormat)
                                    ],
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    controller: context.read<RegisterBloc>().email,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: const Color(0xFFE5F2FF),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Email',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: context.read<RegisterBloc>().validateEmail,
                                  ),
                                  const SizedBox(height: 24),
                                  TitleForm(title: 'Tipe Dokumen'),
                                  DropdownButtonFormField2(
                                    icon: Icon(FeatherIcons.chevronDown),
                                    iconOnClick: Icon(FeatherIcons.chevronUp),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xFFF1F7FF)
                                    ),
                                    itemPadding: EdgeInsets.symmetric(horizontal: 10),
                                    buttonHeight: 40,
                                    hint: Text(
                                      'Pilih Tipe Dokumen',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    buttonDecoration: BoxDecoration(
                                        color: Color(0xFFE5F2FF)
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom: 10, left: 10, right: 10,),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFE5F2FF),

                                    ),
                                    value: context.read<RegisterBloc>().type,
                                    items: context.read<RegisterBloc>().docType
                                        .map((e) => DropdownMenuItem(
                                      value: e.toString(),
                                      child: Container(
                                        child: Text(e),
                                      ),
                                    )
                                    ).toList(),
                                    onChanged: (v) {
                                      setState(() {
                                        context.read<RegisterBloc>().type = v;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 14),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: const Color(0xFFE5F2FF),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Masukan no dokumen',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: context.read<RegisterBloc>().validateNoDok,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Nama Depan'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: context.read<RegisterBloc>().namaDepan,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: const Color(0xFFE5F2FF),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Nama Depan',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: context.read<RegisterBloc>().validateNamaDepan,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Nama Belakang'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: context.read<RegisterBloc>().namaBelakang,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: const Color(0xFFE5F2FF),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Nama Belakang',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: context.read<RegisterBloc>().validateNamaBelakang,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Tempat Lahir'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: context.read<RegisterBloc>().tempatLahir,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: const Color(0xFFE5F2FF),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Tempat Lahir',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: context.read<RegisterBloc>().validateTempatLahir,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Tanggal Lahir'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: context.read<RegisterBloc>().tanggalLahir,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(10),
                                        fillColor: const Color(0xFFE5F2FF),
                                        filled: true,
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hintText: 'mm/dd/yyyy',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        suffixIcon: GestureDetector(
                                          child: Icon(Icons.calendar_today_outlined),
                                          onTap: () async {
                                            context.read<RegisterBloc>().datePicker(context);
                                          },
                                        )
                                    ),
                                    validator: context.read<RegisterBloc>().validateTanggalLahir,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Alamat'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: context.read<RegisterBloc>().alamat,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    maxLines: 6,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: const Color(0xFFE5F2FF),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Alamat',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: context.read<RegisterBloc>().validateAlamat,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Jenis Kelamin'),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RadioListTile(
                                          value: 'pria',
                                          groupValue: context.read<RegisterBloc>().chosen,
                                          onChanged: (index) {
                                            setState(() {
                                              context.read<RegisterBloc>().chosen=index.toString();
                                            });
                                          },
                                          title: Text(
                                            'Laki-laki',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFF3A3A3A)
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          value: 'perempuan',
                                          groupValue: context.read<RegisterBloc>().chosen,
                                          onChanged: (index) {
                                            setState(() {
                                              context.read<RegisterBloc>().chosen=index.toString();
                                            });
                                            print(index);
                                          },
                                          title: Text(
                                            'Perempuan',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFF3A3A3A)
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Kata Sandi'),
                                  TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(16),
                                      FilteringTextInputFormatter.allow(
                                          context.read<RegisterBloc>().passFormat)
                                    ],
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    controller: context.read<RegisterBloc>().kataSandi,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: const Color(0xFFE5F2FF),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Kata Sandi',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          context.read<RegisterBloc>().add(ShowPassEvent());
                                        },
                                        child: Icon(
                                          context.read<RegisterBloc>().showPass
                                              ? FeatherIcons.eyeOff
                                              : FeatherIcons.eye,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    obscureText: context.read<RegisterBloc>().showPass,
                                    validator: context.read<RegisterBloc>().validatePassword,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Konfirmasi Kata Sandi'),
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    controller: context.read<RegisterBloc>().confirmKataSandi,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: const Color(0xFFE5F2FF),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Konfirmasi kata sandi',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: GestureDetector(
                                        child: Icon(
                                          context.read<RegisterBloc>().showConfirmPass
                                              ? FeatherIcons.eyeOff
                                              : FeatherIcons.eye,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        onTap: () {
                                          context.read<RegisterBloc>().add(ShowPassConfirmEvent());
                                        },
                                      ),
                                    ),
                                    obscureText: context.read<RegisterBloc>().showConfirmPass,
                                    validator: context.read<RegisterBloc>().validateConfirmPassword,
                                  ),
                                  SizedBox(height: 24),
                                  FormField<bool>(
                                    builder: (state) {
                                      return CheckboxListTile(
                                        controlAffinity: ListTileControlAffinity.leading,
                                        value: context.read<RegisterBloc>().checkBox,
                                        title: Transform.translate(
                                          offset: Offset(-10, 0),
                                          child: Text(
                                            'Saya setuju dengan Syarat & Ketentuan yang berlaku',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'DM Sans'
                                            ),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            context.read<RegisterBloc>().checkBox = value!;
                                            state.didChange(value);
                                          });
                                        },
                                      );
                                    },
                                    validator: (value) {
                                      if(!context.read<RegisterBloc>().checkBox) {
                                        return 'Setujui?';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                          context.read<RegisterBloc>().checkBox
                              ? Text('')
                              : Text(
                            'Mohon setujui bagian ini',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFDC3328),
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ReuseAppBar(
                title: 'Registrasi',
                onpress: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}