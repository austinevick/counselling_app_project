import 'package:counselling_app_project/screen/chat_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.2,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('images/img2.jpg'))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      topLeft: Radius.circular(18))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildIconButton('Voice Call', Icons.phone, () {}),
                        buildIconButton('Video Call', Icons.video_call, () {}),
                        buildIconButton('Message', Icons.message, () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => ChatScreen()));
                        })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Text('Medicine and dentist specialist',
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Good Health Clinic, MBBS',
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('About Doctor'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation'),
                  ),
                  Spacer(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        height: 50,
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {},
                            child: Text('Schedule Appointment')),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Alice Benson'),
              )),
        ],
      ),
    );
  }

  buildIconButton(String text, IconData icon, Function onPressed) => Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(18),
                topLeft: Radius.circular(18))),
        child: TextButton.icon(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            label: Text(
              text,
              style: TextStyle(color: Colors.white),
            )),
      );
}
