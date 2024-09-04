import 'package:flutter/material.dart';
import 'package:ticketpadi/constant/clickbutton.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset('assets/launcher/Layer_1.png')),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset(
                    'assets/images/onboarding/time_management.png')),
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stress-Free Reservations',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Text(
                    'Combining convenience and innovation, ensuring that every tap leads to a smoother booking process.',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: const Clickbutton(title: 'Continue'),
            )
          ],
        ),
      ),
    );
  }
}
