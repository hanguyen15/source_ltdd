import 'package:flutter/material.dart';
import 'package:flutter_login/models/profile.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeMenu extends StatelessWidget {
  const QrCodeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.80,
        width: MediaQuery.of(context).size.width * 0.50,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: 'userId:${Profile().user.id.toString()}'
                  '(${Profile().user.firstName})',
              version: QrVersions.auto,
              gapless: false,
            ),
            const Text(
              'Mã QR của tôi',
              style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
