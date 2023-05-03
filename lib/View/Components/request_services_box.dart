// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_stories/flutter_stories.dart';
import 'package:intl/intl.dart';
import 'package:r_clean_admin/Model/service_request.dart';
import 'package:r_clean_admin/Model/user.dart';
import 'package:r_clean_admin/View/Components/view_services.dart';

class RequestServicesBox extends StatelessWidget {
  final ServiceRequest service;
  String? _state;
  RequestServicesBox({super.key, required this.service});

  Color stateChanger() {
    switch (service.status) {
      case 0:
        {
          _state = 'Pending';
          return Colors.yellow;
        }
      case 1:
        {
          _state = 'Negotiation';
          return Colors.blue;
        }
      case 2:
        {
          _state = 'Accepted';
          return Colors.green;
        }
      case 3:
        {
          _state = 'Finished';
          return Colors.grey;
        }
      case 4:
        {
          _state = 'Cancelled';
          return Colors.red;
        }
      default:
        {
          _state = 'Unknown';
          return Colors.brown;
        }
    }
  }

  Container story(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        border: Border.all(
          color: stateChanger(),
          width: 2.0,
          style: BorderStyle.solid,
        ),
      ),
      width: 65.0,
      height: 65.0,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return Scaffold(
                body: Story(
                  onFlashForward: Navigator.of(context).pop,
                  onFlashBack: Navigator.of(context).pop,
                  momentCount: service.pic!.length,
                  momentDurationGetter: (idx) => const Duration(seconds: 20),
                  momentBuilder: (context, idx) => Image.network(
                    service.pic![idx]!,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) => const Center(child: Text('Some errors occurred!')),
                  ),
                ),
              );
            },
          );
        },
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            service.pic![0]!,
          ),
          radius: 30,
        ),
      ),
    );
  }

  Container lift(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(15)),
        color: stateChanger().withOpacity(0.65),
      ),
      width: 130,
      height: double.maxFinite,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          _state!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        if (service.pic!.isNotEmpty) story(context),
        Text('${DateFormat.yMMMEd().format(service.dateTime).split(',').join()}\n${DateFormat.jm().format(service.dateTime)}',
            textAlign: TextAlign.center),
        Text(
          'RM${service.price}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }

  Container right() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
          stateChanger().withOpacity(0.3),
          stateChanger().withOpacity(0.4),
          stateChanger().withOpacity(0.5),
          stateChanger().withOpacity(0.6),
          stateChanger().withOpacity(0.7),
          stateChanger().withOpacity(0.8),
          stateChanger().withOpacity(0.9),
        ]),
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(15),
        ),
      ),
      height: double.maxFinite,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(service.state),
        (service.description != null && service.description!.isNotEmpty)
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(child: SelectableText(service.description!)),
                ),
              )
            : Text('description N/A'.toUpperCase()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [drawStars(), service.prefer == 0 ? const Icon(Icons.man_2_rounded) : const Icon(Icons.woman_2_rounded)],
        ),
      ]),
    );
  }

  Future view({required BuildContext context, required List<MyUser> x}) async {
    return showModalBottomSheet(
      enableDrag: true,
      context: context,
      elevation: 50,
      isDismissible: true,
      barrierColor: stateChanger().withOpacity(0.8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      builder: (_) {
        return ViewServices(
          serviceRequest: service,
         // cleaner: x[0],
          customer: x[1],
        );
      },
    );
  }

  Row drawStars() {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (service.rate != null && service.rate != 0) {
        if (i < service.rate!) {
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

  List<MyUser> fetchUsers() {
    List<MyUser> x = [];
    for (var i = 0; i < 2; i++) {
      x.add(MyUser(address: 'ss', email: 'hfh', id: '', name: 'jsonc', password: 'raja', phone: '+57441f', rate: 5, type: 1));
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        return view(context: context, x: fetchUsers());
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [lift(context), Expanded(child: right())],
        ),
      ),
    );
  }
}
