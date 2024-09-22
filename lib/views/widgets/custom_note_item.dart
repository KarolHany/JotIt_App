import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              'Flutter Tips',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Build Your Carrer With Tharwat Samy',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24,
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16, top: 16),
            child: Text(
              'May 21,2022',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
