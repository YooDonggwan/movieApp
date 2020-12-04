import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:movieApp/main.dart';
import 'package:movieApp/extra_screen/main_screen.dart';
import 'package:movieApp/style/theme.dart' as Style;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final users = {
    'dbehdrhks@naver.com' : '1234',
    'ehdrhks@naver.com' : '12345',
  };

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return '아이디가 존재하지 않습니다';
      }
      if (users[data.name] != data.password) {
        return '비밀번호가 일치하지 않습니다';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return '아이디가 존재하지 않습니다';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Moviary',
      onLogin: _authUser,
      onSignup: _authUser,
      theme: LoginTheme(
        primaryColor: Style.Colors.mainColor,
        titleStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      messages: LoginMessages(
        usernameHint: '아이디',
        passwordHint: '비밀번호',
        confirmPasswordHint: '비밀번호 재확인',
        loginButton: '로그인',
        signupButton: '회원가입',
        forgotPasswordButton: '비밀번호를 잊으셨나요?',
        goBackButton: '돌아가기',
        confirmPasswordError: '비밀번호가 다릅니다!',
        recoverPasswordButton: '비밀번호 변경하기',
        recoverPasswordDescription: '이메일로 임시 비밀번호를 전송하겠습니다',
        recoverPasswordIntro: '비밀번호를 재설정해주세요',
        recoverPasswordSuccess: '이메일로 비밀번호를 전송했습니다.'
      ),
      // emailValidator: (value) {
      //   if (value.isEmpty || !Regex.email.hasMatch(value)) {
      //     return '유효하지않은 이메일입니다!';
      //   }
      //   return null;
      // },
      // passwordValidator: (value) {
      //   if (value.isEmpty || value.length <= 2) {
      //     return '비밀번호가 너무 짧습니다!';
      //   }
      //   return null;
      // },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MainScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}