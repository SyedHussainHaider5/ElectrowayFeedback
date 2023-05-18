import 'package:flutter/material.dart';

class IconButtonContainer extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const IconButtonContainer({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  _IconButtonContainerState createState() => _IconButtonContainerState();
}

class _IconButtonContainerState extends State<IconButtonContainer> {
  String text = 'Initial Text';

  void updateLikes() {
    setState(() {
      text = 'New Text';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
        updateLikes();
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: Colors.red,
              size: 15,
            ),
            SizedBox(width: 8.0),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
