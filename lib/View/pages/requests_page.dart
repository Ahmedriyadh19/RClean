import 'package:flutter/material.dart';
import 'package:r_clean_admin/Model/service_request.dart';
import 'package:r_clean_admin/Model/unique_id.dart';
import 'package:r_clean_admin/View/Components/request_services_box.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  List<RequestServicesBox> r = [];
  @override
  void initState() {
    super.initState();
    ss();
  }

  ss() {
    for (var i = 0; i < 500; i++) {
      r.add(RequestServicesBox(
        service: ServiceRequest(
            bookedDateTime: DateTime.now(),
            id: UniqueID().getID(),
            address: 'KL',
            state: 'KL',
            dateTime: DateTime.now(),
            userID: UniqueID().getID(),
            rate: i % 6,
            price: 54.2,
            typeHome: 2,
            prefer: 0,
            pic: i % 6 > 2
                ? [
                    'https://health.clevelandclinic.org/wp-content/uploads/sites/3/2018/11/cleanSick-628306310_770x533-650x428.jpg',
                    'https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png',
                    'https://uploads-ssl.webflow.com/60eece3229f951ea48ce43b4/6180d9e968f4e7f30251c641_Daily%20Home%20Cleaning%20Schedule.jpg',
                    'https://cdn.pixabay.com/photo/2017/02/09/21/08/wings-2053515_960_720.png'
                  ]
                : [],
            description:
                'ore3h oih 24hugh3 n n35gn3n uhn  35injun g3kn3 5ogn 35nn 3h n35tach 53tg n erv f dd s   hb gri bg ri g nu34g ore3h oih 24hugh3 n n35gn3n uhn  35injun g3kn3 5ogn 35nn 3h n35tach 53tg n erv f dd s   hb gri bg ri g nu34g ',
            status: i % 6,
            videoURL: 'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return r.isNotEmpty
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 600,
                    color: Colors.greenAccent,
                  )
                ],
              ),
              Expanded(
                child: GridView(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 200, maxCrossAxisExtent: 600, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
                  children: r,
                ),
              ),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
