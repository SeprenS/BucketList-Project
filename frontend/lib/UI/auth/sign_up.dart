import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ppk/UI/auth/login.dart';
import 'package:http/http.dart' as http;
import 'package:reactive_forms/reactive_forms.dart';

class SignUp extends StatefulWidget {
   SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final form = FormGroup({
    'password': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
  });

  String get email => form.control('email').value;

  String get password => form.control('password').value;

   @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/sign_up_back.png'
                  )
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(height: size.height/15),
              Row(
                children: [
                  Container(width: size.width/20),
                  IconButton(onPressed: () => Navigator.pop(context), icon: ImageIcon(
                    AssetImage('assets/button back.png'), size: size.height/15,
                  )),
                ],
              ),
              Container(height: size.height/50),
              Container(
                height: size.height/1.2,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      topLeft: Radius.circular(100),
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(height: size.height/40),
                    Center(
                      child: Text('Регистрация',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
        Container(height: size.height/50),
        ReactiveForm(
          formGroup: this.form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: size.height/8,
                width: size.width/1.2,
                child: ReactiveTextField(
                    validationMessages: {
                      ValidationMessage.required: (error) => 'Обязательное поле',
                      ValidationMessage.email:(error) => 'Почта должна быть почтой',
                    },
                  cursorColor: Theme.of(context).primaryColor,
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintStyle: theme.textTheme.bodySmall,
                    hintText: 'Введите свою почту',
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          width: 4, color: theme.errorColor.withOpacity(0.75)), //<-- SEE HERE
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          width: 4, color: theme.errorColor.withOpacity(0.75)), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          width: 4, color: theme.primaryColor.withOpacity(0.75)), //<-- SEE HERE
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          width: 4, color: theme.primaryColor.withOpacity(0.75)), //<-- SEE HERE
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          width: 4, color: theme.primaryColor.withOpacity(0.75)), //<-- SEE HERE
                    ),
                  ),
                  formControlName: 'email',
                ),
              ),
              Container(height: size.height/30),
              Container(
                height: size.height/8,
                width: size.width/1.2,
                child: ReactiveTextField(
                  validationMessages: {
                    ValidationMessage.required: (error) => 'Обязательное поле',
                    ValidationMessage.email:(error) => 'Почта должна быть почтой',
                  },
                  cursorColor: Theme.of(context).primaryColor,
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintStyle: theme.textTheme.bodySmall,
                    hintText: 'Придумайте пароль',
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          width: 4, color: theme.errorColor.withOpacity(0.75)), //<-- SEE HERE
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          width: 4, color: theme.errorColor.withOpacity(0.75)), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          width: 4, color: theme.primaryColor.withOpacity(0.75)), //<-- SEE HERE
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          width: 4, color: theme.primaryColor.withOpacity(0.75)), //<-- SEE HERE
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          width: 4, color: theme.primaryColor.withOpacity(0.75)), //<-- SEE HERE
                    ),
                  ),
                  formControlName: 'password',
                ),
              ),
              Container(height: size.height/20),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return InkWell(
                    onTap: () async {
                      if(!form.valid){
                        if(!form.control('email').valid)form.control('email').markAsTouched();
                        if(!form.control('password').valid)form.control('password').markAsTouched();
                      } else{
                        var response = await http.post(Uri.parse('http://193.163.205.120:8000/auth/register'),
                            body:
                            jsonEncode(({'email':email,'password':password, "nickname": "nickname"})
                        ));
                        print(response.statusCode);
                        print(response.body);
                      }
                    },
                    child: Container(
                        height: size.height / 9,
                        width: size.width / 1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            gradient: LinearGradient(
                                colors: [Color(0xff988B8D), Color(0xff453643)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                        child: Center(
                          child: Text(
                            'Зарегистрироваться',
                            style:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).backgroundColor,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),
              Container(height: size.height/50),
              TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn())),
                child: Center(
                  child: Text(
                    'Уже есть аккаунт?', style: theme.textTheme.bodySmall,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: AssetImage('assets/sign_up_cat.png'),height: size.height/6,
                    ),
                    Container(width: size.width/20)
                  ],
                ),
              )
            ],
          ))
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
