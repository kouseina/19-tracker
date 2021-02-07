import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nineteen_trackers/my_icons.dart';
import 'package:nineteen_trackers/theme.dart';

class AlertStay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffF17C85),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Text(
                'Tenang saja, tinggal di rumah jika sedang sakit',
                style: titleStyle.copyWith(
                  color: whiteColor,
                  fontSize: 15,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SvgPicture.asset(iconAlert),
            ),
          ],
        ),
      ),
    );
  }
}
