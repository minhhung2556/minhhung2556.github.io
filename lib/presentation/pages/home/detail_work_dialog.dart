import 'package:flutter/material.dart';
import 'package:minhhung2556/index.dart';

class DetailWorkDialog extends StatelessWidget {
  static Future<dynamic> show(BuildContext context, Works data) => showModalBottomSheet(
        context: context,
        isDismissible: true,
        builder: (context) => DetailWorkDialog(data: data),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(48)),
        ),
      );
  final Works data;
  const DetailWorkDialog({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: kScreenPadding,
      child: SingleChildScrollView(
        padding: kScreenPadding,
        child: Column(
          children: [
            Text(
              data.description.replaceAll('\\n', '\n'),
              style: theme.textTheme.headline6,
            ),
            SizedBox(height: kScreenPadding.vertical),
            GridView.count(
              crossAxisCount: 3,
              children: [
                ...data.images.map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: InnerShadow(
                          shadowColor: Colors.white,
                          shadowBlur: 24,
                          child: Image.network(
                            e,
                            height: screenSize.height / 3,
                          )),
                    ))
              ],
              shrinkWrap: true,
              childAspectRatio: 9 / 16,
            ),
          ],
        ),
      ),
    );
  }
}
