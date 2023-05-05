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
  List<RequestServicesBox> requestsClean = [];
  @override
  void initState() {
    super.initState();
    fetchRequestClean();
  }

// From Firebase ;
  fetchRequestClean() {
    for (int i = 0; i < 500; i++) {
      requestsClean.add(RequestServicesBox(
        service: ServiceRequest(
            bookedDateTime: DateTime.now(),
            id: UniqueID().getID(),
            address: 'KL',
            state: 'KL',
            dateTime: DateTime.now(),
            userID: UniqueID().getID(),
            price: 50 + 6 + i.toDouble(),
            typeHome: 2,
            prefer: i % 2 == 0 ? 0 : 1,
            pic: i % 6 > 2
                ? [
                    'https://health.clevelandclinic.org/wp-content/uploads/sites/3/2018/11/cleanSick-628306310_770x533-650x428.jpg',
                    'https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png',
                    'https://uploads-ssl.webflow.com/60eece3229f951ea48ce43b4/6180d9e968f4e7f30251c641_Daily%20Home%20Cleaning%20Schedule.jpg',
                    'https://cdn.pixabay.com/photo/2017/02/09/21/08/wings-2053515_960_720.png'
                  ]
                : [],
            rate: i % 6,
            description: i % 6 > 2
                ? 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'
                : null,
            status: i % 6,
            feedback: i % 2 < 3
                ? 'using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many'
                : null,
            videoURL: i % 2 < 2 ? 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4' : ''),
      ));
    }
  }

  sorting() {
    return Container(
      height: 50,
      width: 150,
      color: Colors.greenAccent,
      child: Row(children: const []),
    );
  }

  @override
  Widget build(BuildContext context) {
    return requestsClean.isNotEmpty
        ? Column(
            children: [
              //  sorting(),
              Expanded(
                child: GridView(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 200, maxCrossAxisExtent: 600, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
                  children: requestsClean,
                ),
              ),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
