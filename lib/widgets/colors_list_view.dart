import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotit_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:jotit_app/helper/constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 20,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  List<Color> colors = const [
    Color(0xFF5B3758),
    Color(0xFFC65B7C),
    Color(0xFFF9627D),
    Color(0xFFF9ADA0),
    Color(0xFF83B692),
    Color(0xFF5E503F),
    Color(0xFFA9927D),
    Color(0xFFF2F4F3),
    Color(0xFF22333B),
    Color(0xFFBADEFC),
  ];
  int colorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                colorIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isActive: colorIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
