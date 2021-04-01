import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            color: Colors.green[400],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/img2.jpg'))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Christiana Arizona',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            'Sr. Dental Specialist',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.5,
            color: Colors.white,
            child: Column(
              children: [Text('data')],
            ),
          )
        ],
      ),
    );
  }
}
