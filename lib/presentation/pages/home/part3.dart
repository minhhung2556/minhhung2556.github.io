import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../index.dart';

class Part3 extends StatefulWidget {
  final ScrollController scrollController;
  final Profile data;

  const Part3({
    Key? key,
    required this.scrollController,
    required this.data,
  }) : super(key: key);

  @override
  State<Part3> createState() => _Part3State();
}

class _Part3State extends State<Part3> {
  final _workingDateFormat = DateFormat('MMM yyyy');
  @override
  void initState() {
    widget.scrollController.addListener(() {
      if (!mounted || !widget.scrollController.hasClients) return;

      // setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final parentScrollOffset = widget.scrollController.offset;
    return Padding(
      padding: MyDimensions.screenPadding * 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MY WORKS',
            style: MyStyles.heading1TextStyle,
          ),
          ...widget.data.works!.map(
            (e) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.jobTitle!.toUpperCase(),
                  style: MyStyles.jobTitleTextStyle,
                ),
                Text(
                  e.companyName!.toUpperCase(),
                  style: MyStyles.headlineTextStyle,
                ),
                Text(
                  '${_workingDateFormat.format(e.startDate.toDate())} - ${e.endDate != null ? _workingDateFormat.format(e.endDate!.toDate()) : 'now'}',
                  style: MyStyles.headlineTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
