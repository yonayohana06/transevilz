import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transevilz/register/register.dart';

class RegisterProfileReq extends StatelessWidget {
  const RegisterProfileReq({Key? key, required this.numberPhone})
      : super(key: key);
  final String numberPhone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: RegisterProfileForm(phoneNum: numberPhone),
    );
  }
}

class RegisterProfileForm extends StatefulWidget {
  const RegisterProfileForm({Key? key, required this.phoneNum})
      : super(key: key);
  final String phoneNum;

  @override
  State<RegisterProfileForm> createState() => _RegisterProfileFormState();
}

class _RegisterProfileFormState extends State<RegisterProfileForm> {
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 54.0, vertical: 11.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: const Color.fromRGBO(255, 211, 208, 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Periksa kembali data diri anda",
            style: TextStyle(
              color: Color(0xFFDC3328),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 95,
            child: child,
          );
        });
  }

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
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterFailed) {
                _showToast();
              }
              if (state is RegisterSuccess) {
                showDialog(
                    context: context,
                    builder: (context) => DialogWidget(
                          image: Image.asset('assets/images/success.png'),
                          status: const Text(
                            'Cek email anda untuk melakukan aktivasi akun',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DM Sans',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          buttonlabel: 'Cek Email Sekarang',
                          onpress: () {},
                        ));
              }
            },
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  if (context.read<RegisterBloc>().isActive) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 45),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (context
                            .read<RegisterBloc>()
                            .formkey
                            .currentState!
                            .validate()) {
                          context.read<RegisterBloc>().phoneNumber.text =
                              widget.phoneNum;
                          context.read<RegisterBloc>().add(PostData());
                          // if(state is RegisterSuccess) {
                          //   showDialog(
                          //       context: context,
                          //       builder: (context) => DialogWidget(
                          //         image: Image.asset('assets/images/success.png'),
                          //         status: Text(
                          //           'Cek email anda untuk melakukan aktivasi akun',
                          //           style: TextStyle(
                          //             fontSize: 18,
                          //             fontWeight: FontWeight.w700,
                          //             fontFamily: 'DM Sans',
                          //           ),
                          //           textAlign: TextAlign.center,
                          //         ),
                          //         buttonlabel: 'Cek Email Sekarang',
                          //         onpress: () {},
                          //       )
                          //   );
                          // }
                          // if(state is RegisterFailed) {
                          //   print('test');
                          //   Fluttertoast.showToast(
                          //     msg: 'Periksa kembali data diri anda',
                          //     backgroundColor: Color.fromRGBO(255, 211, 208, 0.5),
                          //   );
                          // }
                        }
                      },
                      child: const Text("Selanjutnya"),
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
                    child: const Text("Selanjutnya"),
                  );
                },
              ),
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
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(top: 55),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BlocBuilder<RegisterBloc, RegisterState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<RegisterBloc>()
                                          .add(ImageDisplayEvent());
                                    },
                                    borderRadius: BorderRadius.circular(12),
                                    child: BlocBuilder<RegisterBloc,
                                        RegisterState>(
                                      builder: (context, state) {
                                        if (state is RegisterFormButton ||
                                            state is RegisterFailed ||
                                            state is RegisterSuccess) {
                                          return context
                                                      .read<RegisterBloc>()
                                                      .imageContain ==
                                                  null
                                              ? Column(
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: Color(
                                                                  0xFFF1F7FF),
                                                              shape: BoxShape
                                                                  .circle),
                                                      height: 60,
                                                      width: 60,
                                                      child: Center(
                                                        child: Image.asset(
                                                          'assets/images/user-plus.png',
                                                          height: 28.8,
                                                          width: 28.8,
                                                        ),
                                                      ),
                                                    ),
                                                    const Text(
                                                      'Tambah gambar',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            Color(0xFF7A7A7A),
                                                        letterSpacing: 0.096,
                                                        height: 1.315,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                )
                                              : Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                      child: Image.file(
                                                        context
                                                            .read<
                                                                RegisterBloc>()
                                                            .imageContain!,
                                                        height: 60,
                                                        width: 60,
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                    ),
                                                    const Text(
                                                      'Tambah gambar',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            Color(0xFF7A7A7A),
                                                        letterSpacing: 0.096,
                                                        height: 1.315,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                );
                                        }
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          height: 80,
                                          width: 100,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFFF1F7FF),
                                                    shape: BoxShape.circle),
                                                height: 60,
                                                width: 60,
                                                child: Center(
                                                  child: Image.asset(
                                                    'assets/images/user-plus.png',
                                                    height: 28.8,
                                                    width: 28.8,
                                                  ),
                                                ),
                                              ),
                                              const Text(
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
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const TitleForm(title: 'Email'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(context
                                          .read<RegisterBloc>()
                                          .emailFormat)
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller:
                                        context.read<RegisterBloc>().email,
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
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: context
                                        .read<RegisterBloc>()
                                        .validateEmail,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Tipe Dokumen'),
                                  DropdownButtonFormField2(
                                    icon: const Icon(FeatherIcons.chevronDown),
                                    iconOnClick:
                                        const Icon(FeatherIcons.chevronUp),
                                    dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xFFF1F7FF)),
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    buttonHeight: 40,
                                    hint: const Text(
                                      'Pilih Tipe Dokumen',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    buttonDecoration: const BoxDecoration(
                                        color: Color(0xFFE5F2FF)),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                        bottom: 10,
                                        left: 5,
                                        right: 10,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none),
                                      filled: true,
                                      fillColor: const Color(0xFFE5F2FF),
                                    ),
                                    value: context.read<RegisterBloc>().type,
                                    items: context
                                        .read<RegisterBloc>()
                                        .docType
                                        .map((e) => DropdownMenuItem(
                                              value: e.toString(),
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF7A7A7A)),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (v) {
                                      setState(() {
                                        context.read<RegisterBloc>().type = v;
                                        context
                                            .read<RegisterBloc>()
                                            .noDokumen
                                            .clear();
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 14),
                                  if (context.read<RegisterBloc>().type ==
                                      null) ...{
                                    TextFormField(
                                      readOnly: true,
                                      controller: context
                                          .read<RegisterBloc>()
                                          .noDokumen,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                        fillColor: const Color(0xFFEFEFEF),
                                        filled: true,
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hintText: 'Masukan no dokumen',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      validator: context
                                          .read<RegisterBloc>()
                                          .validateNoDok,
                                    ),
                                  } else if (context
                                          .read<RegisterBloc>()
                                          .type ==
                                      'KTP') ...{
                                    TextFormField(
                                      controller: context
                                          .read<RegisterBloc>()
                                          .noDokumen,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(16)
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(10),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      validator: context
                                          .read<RegisterBloc>()
                                          .validateNoDok,
                                    ),
                                  } else if (context
                                          .read<RegisterBloc>()
                                          .type ==
                                      'SIM') ...{
                                    TextFormField(
                                      controller: context
                                          .read<RegisterBloc>()
                                          .noDokumen,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(12)
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(10),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      validator: context
                                          .read<RegisterBloc>()
                                          .validateNoDok,
                                    ),
                                  } else if (context
                                          .read<RegisterBloc>()
                                          .type ==
                                      'Passport') ...{
                                    TextFormField(
                                      controller: context
                                          .read<RegisterBloc>()
                                          .noDokumen,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(16)
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(10),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      validator: context
                                          .read<RegisterBloc>()
                                          .validateNoDok,
                                    ),
                                  },
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Nama Depan'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(15)
                                    ],
                                    controller:
                                        context.read<RegisterBloc>().namaDepan,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
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
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: context
                                        .read<RegisterBloc>()
                                        .validateNamaDepan,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Nama Belakang'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: context
                                        .read<RegisterBloc>()
                                        .namaBelakang,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(15)
                                    ],
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
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: context
                                        .read<RegisterBloc>()
                                        .validateNamaBelakang,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Tempat Lahir'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(30)
                                    ],
                                    controller: context
                                        .read<RegisterBloc>()
                                        .tempatLahir,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
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
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: context
                                        .read<RegisterBloc>()
                                        .validateTempatLahir,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Tanggal Lahir'),
                                  TextFormField(
                                    onTap: () {
                                      context
                                          .read<RegisterBloc>()
                                          .tanggalLahir
                                          .clear();
                                      context
                                          .read<RegisterBloc>()
                                          .datePicker(context);
                                    },
                                    readOnly: true,
                                    textInputAction: TextInputAction.next,
                                    controller: context
                                        .read<RegisterBloc>()
                                        .tanggalLahir,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: const Color(0xFFE5F2FF),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'dd/mm/yyyy',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: const Icon(
                                          Icons.calendar_today_outlined),
                                    ),
                                    validator: context
                                        .read<RegisterBloc>()
                                        .validateTanggalLahir,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Alamat'),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        context.read<RegisterBloc>().alamat,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(60)
                                    ],
                                    maxLines: 4,
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
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: context
                                        .read<RegisterBloc>()
                                        .validateAlamat,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(title: 'Jenis Kelamin'),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RadioListTile(
                                          value: 'male',
                                          groupValue: context
                                              .read<RegisterBloc>()
                                              .chosen,
                                          onChanged: (index) {
                                            setState(() {
                                              context
                                                  .read<RegisterBloc>()
                                                  .chosen = index.toString();
                                            });
                                          },
                                          title: const Text(
                                            'Laki-laki',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFF3A3A3A)),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          value: 'female',
                                          groupValue: context
                                              .read<RegisterBloc>()
                                              .chosen,
                                          onChanged: (index) {
                                            setState(() {
                                              context
                                                  .read<RegisterBloc>()
                                                  .chosen = index.toString();
                                            });
                                          },
                                          title: const Text(
                                            'Perempuan',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFF3A3A3A)),
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
                                      FilteringTextInputFormatter.allow(context
                                          .read<RegisterBloc>()
                                          .passFormat)
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller:
                                        context.read<RegisterBloc>().kataSandi,
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
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<RegisterBloc>()
                                              .add(ShowPassEvent());
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
                                    obscureText:
                                        context.read<RegisterBloc>().showPass,
                                    validator: context
                                        .read<RegisterBloc>()
                                        .validatePassword,
                                  ),
                                  const SizedBox(height: 24),
                                  const TitleForm(
                                      title: 'Konfirmasi Kata Sandi'),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: context
                                        .read<RegisterBloc>()
                                        .confirmKataSandi,
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
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: GestureDetector(
                                        child: Icon(
                                          context
                                                  .read<RegisterBloc>()
                                                  .showConfirmPass
                                              ? FeatherIcons.eyeOff
                                              : FeatherIcons.eye,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        onTap: () {
                                          context
                                              .read<RegisterBloc>()
                                              .add(ShowPassConfirmEvent());
                                        },
                                      ),
                                    ),
                                    obscureText: context
                                        .read<RegisterBloc>()
                                        .showConfirmPass,
                                    validator: context
                                        .read<RegisterBloc>()
                                        .validateConfirmPassword,
                                  ),
                                  const SizedBox(height: 24),
                                  FormField<bool>(
                                    builder: (state) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            value: context
                                                .read<RegisterBloc>()
                                                .checkBox,
                                            onChanged: (value) {
                                              setState(() {
                                                context
                                                    .read<RegisterBloc>()
                                                    .checkBox = value!;
                                                state.didChange(value);
                                              });
                                            },
                                          ),
                                          const SizedBox(width: 5),
                                          const Text(
                                            'Saya setuju dengan ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'DM Sans',
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                    return const SyaratPrep();
                                                  }),
                                                );
                                              },
                                              child: const Text(
                                                'Syarat & Ketentuan yang berlaku',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'DM Sans',
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                    validator: (value) {
                                      if (!context
                                          .read<RegisterBloc>()
                                          .checkBox) {
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
                              ? const Text('')
                              : const Text(
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
                onpress: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
