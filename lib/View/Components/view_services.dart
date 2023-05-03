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

  Widget right() {
    if (serviceRequest.videoURL != null && serviceRequest.videoURL!.isNotEmpty) {
      return Expanded(
          child: VideoScreenDisplay(
        path: serviceRequest.videoURL!,
      ));
    } else {
      return Container();
    }
  }

  Container box({required Widget w}) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey.withOpacity(0.5), border: Border.all(width: 2)),
        child: Padding(padding: const EdgeInsets.all(8.0), child: w));
  }

  SingleChildScrollView dates() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          children: [
            Text('Date & Time'.toUpperCase()),
            box(
              w: Text('${DateFormat.yMMMEd().format(serviceRequest.dateTime).split(',').join()}\n${DateFormat.jm().format(serviceRequest.dateTime)}',
                  textAlign: TextAlign.center),
            )
          ],
        ),
        const SizedBox(width: 15),
        Column(
          children: [
            Text('Cleaning Time'.toUpperCase()),
            box(
              w: Text(
                  '${DateFormat.yMMMEd().format(serviceRequest.bookedDateTime).split(',').join()}\n${DateFormat.jm().format(serviceRequest.bookedDateTime)}',
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ]),
    );
  }

  Widget id() {
    return Column(children: [
      Text('ID'.toUpperCase()),
      box(
        w: Text(serviceRequest.id, textAlign: TextAlign.center),
      ),
    ]);
  }

  Widget description() {
    return Column(
      children: [Text('description'.toUpperCase()), box(w: SelectableText('${serviceRequest.description}', textAlign: TextAlign.center))],
    );
  }

  Padding left({required double w}) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
            width: w / 2,
            child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              id(),
              dates(),
              users(),
              if (serviceRequest.description != null && serviceRequest.description!.isNotEmpty) description(),
              rateFeedback(w: w)
            ]))));
  }

  SingleChildScrollView users() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(children: [
            Text('Customer'.toUpperCase()),
            box(
                w: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const CircleAvatar(),
              const SizedBox(width: 10),
              SizedBox(
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
              ]))
            ]))
          ]),
          const SizedBox(width: 15),
          Column(children: [
            Text('Cleaner'.toUpperCase()),
            box(
                w: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const CircleAvatar(),
              const SizedBox(width: 10),
              cleaner != null
                  ? SizedBox(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                    ]))
                  : Text('Unassigned'.toUpperCase())
            ]))
          ])
        ]));
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

  rateFeedback({required double w}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        box(
            w: (serviceRequest.feedback != null && serviceRequest.feedback!.isNotEmpty)
                ? Container(
                    width: w / 2.5,
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                        child: SelectableText(
                      serviceRequest.feedback!,
                      textAlign: TextAlign.start,
                    )),
                  )
                : Text('feedback N/A'.toUpperCase())),
        const SizedBox(width: 15),
        box(w: drawStars())
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [left(w: w), if (serviceRequest.videoURL != null && serviceRequest.videoURL!.isNotEmpty) right()],
      ),
    );
  }
}
