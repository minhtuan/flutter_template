import 'package:flutter/material.dart';

import '../../blocs/login_bloc.dart';
import '../../data/constants/ui_helpers.dart';
import '../../pages/home/home_page.dart';
import '../../widgets/common/busy_button.dart';
import '../../widgets/common/text_link.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      loginBloc.emailSink.add(emailController.text);
    });

    passwordController.addListener(() {
      loginBloc.passSink.add(passwordController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();

    loginBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset('assets/images/title.png'),
              ),
              StreamBuilder<String>(
                  stream: loginBloc.emailStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                        //InputField
                        // placeholder: 'Email',
                        controller: emailController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.email), labelText: 'Email', errorText: snapshot.data));
                  }),
              verticalSpaceSmall,
              StreamBuilder<String>(
                stream: loginBloc.passStream,
                builder: (context, snapshot) {
                  return TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock), labelText: 'Password *', errorText: snapshot.data),
                  );
                },
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StreamBuilder<bool>(
                    stream: loginBloc.btnStream,
                    builder: (context, snapshot) {
                      return BusyButton(
                        title: 'Login',
                        busy: false,// snapshot.data == true /*model.busy*/,
                        onPressed: snapshot.data == true ? () {
                          //print('BusyButton click');
                          // model.login(
                          //   email: emailController.text,
                          //   password: passwordController.text,
                          // );
                          Navigator.of(context).pushReplacement(
                                      MaterialPageRoute<dynamic>(
                                          builder: (context) => HomePage()));
                        } : null,
                      );
                    }
                  )
                ],
              ),
              verticalSpaceMedium,
              TextLink(
                'Create an Account if you\'re new.',
                onPressed: () {
                  //model.navigateToSignUp();
                },
              )
            ],
          ),
        ));
  }
}
