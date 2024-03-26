import 'package:flutter/material.dart';
import 'package:ppk/UI/auth/login.dart';
import 'package:ppk/UI/auth/sign_up.dart';

class SlideScreen extends StatelessWidget {
  int index = 0;
  List titles = ['Добивайся!', 'Общайся!', 'Зарабатывай!'];
  List descriptions = [
    'Поставленных целей',
    'С другими пользователями',
    'Котокоины за выполнение задач'
  ];

  SlideScreen();

  SlideScreen.next(this.index);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/slide${index + 1}.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: size.height / 1.6),
            Text(titles[index],
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center),
            Text(descriptions[index],
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center),

               Center(
                child: index == 2
                    ? InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        builder: (context) {
                          return Container(
                              height: size.height / 1.7,
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xff988B8D),
                                        Color(0xff453643)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: size.height / 40,
                                  ),
                                  Center(
                                    child: Text(
                                        'если у Вас нет аккаунта',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                            color: Theme.of(context).primaryColor
                                        )
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => SignUp())),
                                    child: Center(
                                      child: Container(
                                          height: size.height / 11,
                                          width: size.width / 1.2,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:
                                              Theme.of(context).backgroundColor),
                                          child: Center(
                                            child: Text(
                                              'Зарегестрироваться',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                        'если уже были с нами',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                            color: Theme.of(context).primaryColor
                                        )
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => LogIn())),
                                    child: Center(
                                      child: Container(
                                          height: size.height / 11,
                                          width: size.width / 1.2,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:
                                              Theme.of(context).backgroundColor),
                                          child: Center(
                                            child: Text(
                                              'Войти',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                        'Или',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                            color: Theme.of(context).primaryColor

                                        )
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                        height: size.height / 14,
                                        width: size.width / 1.2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Theme.of(context).backgroundColor, width: 2
                                            )
                                        ),
                                        child: Center(
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            'Продолжить без регистрации',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .backgroundColor),
                                          ),
                                        )),
                                  ),
                                  Container(
                                    height: size.height / 20,
                                  ),
                                ],
                              ));
                        });
                  },
                      child: Container(
                          height: size.height / 11,
                          width: size.width / 1.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [Color(0xff988B8D), Color(0xff453643)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          child: Center(
                            child: Text(
                              'Поехали!',
                              style:
                                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: Theme.of(context).backgroundColor,
                                      ),
                            ),
                          )),
                    )
                    : InkWell(
                        onTap: () => Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  // Navigate to the SecondScreen
                                  return SlideScreen.next(index + 1);
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.easeInOut;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);

                                  return SlideTransition(
                                    // Apply slide transition
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                              ),
                            ),
                        child: Icon(
                          size: size.height / 15,
                          Icons.arrow_forward,
                          color: Theme.of(context).primaryColor,
                        )),
              ),
            Container(height: size.height / 20),
          ],
        ),
      ),
    );
  }
}
