
import 'package:ecommerce_machine_test_jurysoft/common/widgets/space.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';

class SelectAddress extends StatelessWidget {
  const SelectAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Select delivery Address"),
          Space.y(10),
          Container(
            decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Radio(
                  value: true,
                  groupValue: true,
                  onChanged: (val) {},
                ),
                Space.x(10),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vineeth Chandran",
                        style: txt16Black,
                      ),
                      Space.y(10),
                      Text(
                          'Street:  Plot No 1, Hastsal Road, Vikas Nagar, Delhi, Zip code:  110018, India \nPhone number:  01125633078')
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
