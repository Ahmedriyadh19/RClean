import 'package:faker/faker.dart';
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
  void fetchRequestClean() {
    final random = RandomGenerator(seed: 63833423);
    final faker = Faker.withGenerator(random);
    for (int i = 0; i < 500; i++) {
      requestsClean.add(RequestServicesBox(
        service: ServiceRequest(
            bookedDateTime: faker.date.dateTime(minYear: 2020, maxYear: 2023),
            id: UniqueID().getID(),
            address: faker.address.city(),
            state: faker.address.country(),
            dateTime: faker.date.dateTime(minYear: 2020, maxYear: 2023),
            userID: UniqueID().getID(),
            price: faker.randomGenerator.decimal(),
            typeHome: 1,
            prefer: i % 2 == 0 ? 0 : 1,
            pic: i % 6 > 2
                ? [
                    faker.image.image(),
                    faker.image.image(),
                    faker.image.image(),
                    faker.image.image(),
                    faker.image.image(),
                    faker.image.image(),
                    faker.image.image(),
                  ]
                : [],
            rate: faker.randomGenerator.integer(
              5,
              min: 1,
            ),
            description: i % 6 > 2 ? faker.lorem.sentences(faker.randomGenerator.integer(25, min: 10)).toString() : null,
            status: faker.randomGenerator.integer(6, min: 1),
            feedback: i % 2 < 3 ? faker.lorem.sentences(faker.randomGenerator.integer(25, min: 10)).toString() : null,
            videoURL: i % 2 < 2 ? 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4' : ''),
      ));
    }
  }

  Container sorting() {
    return Container(
      height: 50,
      width: 150,
      color: Colors.greenAccent,
      child: Row(children: const []),
    );
  }

  Center loading() {
    return Center(
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(15),
            child: CircularProgressIndicator(),
          ),
          Text('Loading ...')
        ],
      ),
    );
  }

  Expanded gotData() {
    return Expanded(
      child: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 200, maxCrossAxisExtent: 600, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        children: requestsClean,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [requestsClean.isNotEmpty ? gotData() : loading()],
    );
  }
}
