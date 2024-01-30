import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiController apiController = Get.put(ApiController());

  @override
  void initState() {
    super.initState();
    apiController.fetchDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Data'),
      ),
      body: Center(
        child: Obx(
              () => apiController.modelData.isEmpty
              ? CircularProgressIndicator()
              : Expanded(
            child:
            ListView.builder(
              itemCount: apiController.modelData.length,
              itemBuilder: (context, index) {
                final data = apiController.modelData[index];
                _launchURL() async {
                  Uri _url = Uri.parse("https://www.google.com/");
                  if (await launchUrl(_url)) {
                    await launchUrl(_url);
                  } else {
                    throw 'Could not launch $_url';
                  }
                }
                return Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("University Name - ${data.name!}"),
                        Text("Alpha Two Code - ${data.alphaTwoCode!}"),
                        Text("Domains - ${data.domains![0]}"),
                        // Text("Webpage - ${data.webPages![0]}"),
                        Text("Country - ${data.country!}"),
                        InkWell(
                          onTap: _launchURL,
                          child:  Text(
                            " ${data.webPages![0]}",
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
