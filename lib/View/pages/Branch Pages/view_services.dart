import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:r_clean_admin/Model/service_request.dart';
import 'package:r_clean_admin/Model/user.dart';
import 'package:r_clean_admin/View/Components/video.dart';

class ViewServices extends StatelessWidget {
  final ServiceRequest serviceRequest;
  final MyUser customer;
  final MyUser? cleaner;
  const ViewServices({
    Key? key,
    required this.serviceRequest,
    required this.customer,
    this.cleaner,
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

  Expanded right() {
    return Expanded(
        child: VideoScreenDisplay(
      path: serviceRequest.videoURL!,
    ));
  }

  SingleChildScrollView line1() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                const CircleAvatar(),
                const SizedBox(height: 15),
                Icon(customer.isMale ? Icons.person : Icons.person_3_rounded),
              ],
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Text(
                      customer.name.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      customer.phone.toUpperCase(),
                    ),
                    Text(
                      customer.email.toLowerCase(),
                    )
                  ])),
            ),
            Row(
              children: [
                const Icon(Icons.bookmark_added_rounded),
                const SizedBox(width: 15),
                Text('${DateFormat.yMMMEd().format(serviceRequest.dateTime).split(',').join()}\n${DateFormat.jm().format(serviceRequest.dateTime)}',
                    textAlign: TextAlign.center),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView line2() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                const CircleAvatar(),
                const SizedBox(height: 15),
                Icon(serviceRequest.prefer == 0 ? Icons.man_2_rounded : Icons.woman_2_rounded),
              ],
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: cleaner != null
                      ? Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                          Text(
                            cleaner!.name.toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            cleaner!.phone.toUpperCase(),
                          ),
                          Text(
                            cleaner!.email.toLowerCase(),
                          )
                        ])
                      : Text('Unassigned'.toUpperCase())),
            ),
            Row(
              children: [
                const Icon(Icons.cleaning_services_rounded),
                const SizedBox(width: 15),
                Text(
                    '${DateFormat.yMMMEd().format(serviceRequest.bookedDateTime).split(',').join()}\n${DateFormat.jm().format(serviceRequest.bookedDateTime)}',
                    textAlign: TextAlign.center),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget line3() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (serviceRequest.description != null && serviceRequest.description!.isNotEmpty)
            ? SelectableText('${serviceRequest.description}', textAlign: TextAlign.start)
            : const Center(child: Text('Description N/A')),
      ),
    );
  }

  Row drawStars() {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (serviceRequest.rate != null && serviceRequest.rate != 0) {
        if (i < serviceRequest.rate!) {
          stars.add(Icon(
            Icons.star_rounded,
            color: Colors.yellow[800],
          ));
        } else {
          stars.add(const Icon(Icons.star_border_rounded));
        }
      } else {
        stars.add(const Text('Rate: N/A'));
        break;
      }
    }
    return Row(children: stars);
  }

  SingleChildScrollView line4() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: (serviceRequest.feedback != null && serviceRequest.feedback!.isNotEmpty)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SelectableText(
                          serviceRequest.feedback!,
                          textAlign: TextAlign.start,
                        ),
                      )
                    : Center(child: Text('feedback N/A'.toUpperCase()))),
            drawStars()
          ],
        ),
      ),
    );
  }

  SizedBox left({required double width}) {
    return SizedBox(
        width: width / 2,
        child: ListView(
          shrinkWrap: true,
          children: [
            const Text('Customer'),
            line1(),
            div(),
            const Text('Cleaner'),
            line2(),
            div(),
            const Text('Description'),
            line3(),
            div(),
            const Text('Rate & Feedback'),
            line4()
          ],
        ));
  }

  Divider div() {
    return Divider(color: Colors.amber[900], endIndent: 60, indent: 60);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [left(width: w), if (serviceRequest.videoURL != null && serviceRequest.videoURL!.isNotEmpty) right()],
      ),
    );
  }
}
