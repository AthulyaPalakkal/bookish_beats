import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/USER/AddReview.dart';
import 'package:bookish_beats/USER/viewReview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../PROVIDER/mainProvider.dart';

class ReviewPage extends StatelessWidget {
  ReviewPage({super.key});
  List<String> bookimg = [
    'assets/book3.jpg',
    'assets/book1.jpg',
    'assets/book2.jpg',
    'assets/book3.jpg',
    'assets/book1.jpg',
    'assets/book2.jpg',
  ];
  List<String> wrtngs = [
    "The Kite Runner is the first novel by Afghan-American author Khaled Hosseini. Published in 2003 by Riverhead Books,it tells the story of Amir, a young boy from the Wazir Akbar Khan district of Kabul, whose closest ..",
    "ചെന്നൈ നഗരം പശ്ചാത്തലമാക്കി എഴുതിയ ഫീൽ ഗുഡ് സിനിമ പോലൊരു നോവൽ. പ്രണയം, സൗഹൃദം, യാത്ര, പ്രതികാരം, രാഷ്ട്രീയം തുടങ്ങി വായനയെ രസമുള്ളതാക്കുന്ന എല്ലാ ചേരുവകളും ചേർത്തെഴുതിയ ...",
    "ഇന്ത്യയുടെ ജീവനാഡിയായ റെയില്‍വേയുടെ അന്തര്‍നാടകങ്ങളെ വെളിവാക്കുന്ന നോവല്‍. അധികാരവും സാധാരണമനുഷ്യരും തമ്മിലുള്ള സംഘര്‍ഷങ്ങളിലൂടെ മൂന്നാംലോകപൗരന്മാര്‍ എങ്ങനെ മള്‍ട്ടിനാഷണലുകളുടെ ..",
    'The Kite Runner is the first novel by Afghan-American author Khaled Hosseini. Published in 2003 by Riverhead Books,it tells the story of Amir, a young boy from the Wazir Akbar Khan district of Kabul, whose closest ...',
    "ചെന്നൈ നഗരം പശ്ചാത്തലമാക്കി എഴുതിയ ഫീൽ ഗുഡ് സിനിമ പോലൊരു നോവൽ. പ്രണയം, സൗഹൃദം, യാത്ര,  പ്രതികാരം, രാഷ്ട്രീയം തുടങ്ങി വായനയെ രസമുള്ളതാക്കുന്ന എല്ലാ ചേരുവകളും ചേർത്തെഴുതിയ ...",
    "ഇന്ത്യയുടെ ജീവനാഡിയായ റെയില്‍വേയുടെ അന്തര്‍നാടകങ്ങളെ വെളിവാക്കുന്ന നോവല്‍. അധികാരവും സാധാരണമനുഷ്യരും തമ്മിലുള്ള സംഘര്‍ഷങ്ങളിലൂടെ മൂന്നാംലോകപൗരന്മാര്‍ എങ്ങനെ മള്‍ട്ടിനാഷണലുകളുടെ ...."
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mainProvider provider = Provider.of<mainProvider>(context, listen: false);

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: cl3E2501,
          onPressed: () {
            provider.clearReview();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddReview()));
          },
          child: const Icon(Icons.edit, color: clWhite),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 60,
        flexibleSpace: Image.asset(
          'assets/pic3.png',
          fit: BoxFit.fill,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(3),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
        ),
        automaticallyImplyLeading: false,
//         leading: InkWell(
//           onTap: (){
// },
//             child: Icon(Icons.arrow_back,color: Colors.white)),
        title: const Center(
            child: Text('Reviews',
                style: TextStyle(
                    fontFamily: 'gravitas',
                    fontSize: 20,
                    color: clWhite))),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<mainProvider>(builder: (context, value, child) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: value.reviewlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: const [
                            BoxShadow(
                                color: cl3E2501,
                                blurRadius: 5,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: NetworkImage(
                                      value.reviewlist[index].reviewimage),
                                  height: 110,
                                  width: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: width / 1.9,
                                    child: Text(
                                      value.reviewlist[index].review,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: clBlack,
                                          fontSize: 10,
                                          fontFamily: 'cantata'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 200),
                              child: InkWell(
                                onTap: () {
                                  callNext(context, viewReview());
                                },
                                child: const Row(
                                  children: [
                                    Text(
                                      'View More',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontFamily: 'cantata',
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_circle_right_rounded,
                                      color: Colors.blue,
                                      size: 30,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
