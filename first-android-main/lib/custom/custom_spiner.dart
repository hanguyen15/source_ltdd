import 'package:flutter/material.dart';

class Spiner extends StatelessWidget {
  const Spiner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(0.7),
      child: const Center(
        child: Image(
          width: 50,
          image: AssetImage('lib/assets/spiner.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
