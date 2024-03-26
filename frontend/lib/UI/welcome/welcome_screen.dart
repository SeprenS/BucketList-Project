import 'package:flutter/material.dart';
import 'package:ppk/UI/welcome/slide_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/welcome_screen_back.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: size.height / 3),
            Text('Добро\nПожаловать!',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge,
                children: <TextSpan>[
                  TextSpan(text: 'В приложение\n'),
                  TextSpan(
                      text: 'CatGoal',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Center(
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => SlideScreen(),
                    transitionDuration: Duration(milliseconds: 400),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                ),
                child: Container(
                  height: size.height / 10.4,
                  width: size.width / 1.17,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffF69575), Color(0xffF7BF5F)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text('Привет!',
                          style: Theme.of(context).textTheme.bodyMedium)),
                ),
              ),
            ),
            Container(height: size.height / 20),
          ],
        ),
      ),
    );
  }
}
