// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:r_clean_admin/Model/service_request.dart';
import 'package:r_clean_admin/View/Components/video.dart';

class ViewServices extends StatelessWidget {
  final ServiceRequest serviceRequest;
  const ViewServices({
    Key? key,
    required this.serviceRequest,
  }) : super(key: key);

  String getStatus() {
    switch (serviceRequest.status) {
      case 0:
        {
          return 'Pending';
        }
      case 1:
        {
          return 'Negotiation';
        }
      case 2:
        {
          return 'Accepted';
        }
      case 3:
        {
          return 'Finished';
        }
      case 4:
        {
          return 'Cancelled';
        }
      default:
        {
          return 'Unknown';
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Clean ID:\n${serviceRequest.id}',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Clean Status:\n${getStatus()}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('User: ${serviceRequest.userID}'),
                    Text('${serviceRequest.state}\n${serviceRequest.address}'),
                    Text('Cleaner: ${serviceRequest.id}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date & Time\n${DateFormat.yMMMEd().add_jm().format(serviceRequest.dateTime).split(',').join()}'),
                    Text('Cleaning Date\n${DateFormat.yMMMEd().add_jm().format(serviceRequest.bookedDateTime).split(',').join()}'),
                    Text('RM${serviceRequest.price}'),
                  ],
                ),
                Row(
                  children: [Expanded(child: SelectableText(serviceRequest.description!))],
                ),
                Expanded(
                    child: MyScreen(
                  path: serviceRequest.videoURL!,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text('FEEDBACK '), Text('RATING ')],
                )
              ],
            ),
          )),
    );
  }
}
