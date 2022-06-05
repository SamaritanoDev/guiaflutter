import 'package:flutter/material.dart';
import 'package:tutoapp/utils/kitcolors.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../utils/kitcolors.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Image(
            image: AssetImage('assets/images/banner.jpg'),
          ),
          Title(),
          SizedBox(height: 15),
          ButtonSection(),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '@samaritano.dev',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: colormorado,
                ),
              ),
              Text(
                'Desarrollador Flutter',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: celestebebe,
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          const Image(image: AssetImage('assets/icons/card_hearts.png')),
          const Text(
            '922',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colormorado,
            ),
          )
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        CustomButton('assets/icons/mail.png', 'Messages'),
        CustomButton('assets/icons/education.png', 'Education'),
        CustomButton('assets/icons/dog.png', 'Favorite mascot'),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String url;
  final String text;
  const CustomButton(this.url, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(url)),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: colormorado,
          ),
        ),
      ],
    );
  }
}
