
import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../utils/validators.dart';
import 'base_bloc.dart';

//extends Object with Validators
class LoginBloc implements BaseBloc{
  LoginBloc() {
    CombineLatestStream.combine2(_emailSubject, _passSubject, (email, pass){
      return Validation.validateEmail(email) == null && Validation.validatePass(pass) == null;
    }).listen((enable){
      btnSink.add(enable);
    });
  }
  
  final _emailSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

  StreamTransformer<String, String> emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      sink.add(Validation.validateEmail(email));
    }
  );

  StreamTransformer<String, String> passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink){
      sink.add(Validation.validatePass(pass));
    }
  );

  Stream<String> get emailStream => _emailSubject.stream.transform(emailValidator);
  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get passStream => _passSubject.stream.transform(passwordValidator);
  Sink<String> get passSink => _passSubject.sink;

  Stream<bool> get btnStream => _btnSubject.stream;
  Sink<bool> get btnSink => _btnSubject.sink;

  @override
  void dispose(){
    _emailSubject?.close();
    _passSubject?.close();
    _btnSubject?.close();
  }
}