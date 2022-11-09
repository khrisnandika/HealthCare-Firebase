import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/ChatRoom.dart/room_chat.dart';
import 'package:final_project/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PesanChat extends StatefulWidget {
  const PesanChat({super.key});

  @override
  State<PesanChat> createState() => _PesanChatState();
}

class _PesanChatState extends State<PesanChat> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  bool isLoading = false;

  final TextEditingController _searchController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async {
    await _firestore.collection('user_details').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }



  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('user_details')
        .where("email", isEqualTo: _searchController.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        automaticallyImplyLeading: false,
        backgroundColor: kHealthCareColor,
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 14,
                    width: size.width / 1.15,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "cari"),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                new SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: onSearch,
                    child: Text("cari"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kHealthCareColor,
                    )
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                userMap != null
                    ? ListTile(
                        onTap: () {
                          String roomId = chatRoomId(
                            _auth.currentUser!.displayName!,
                            userMap!['nama'],
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatRoom(
                                chatRoomId: roomId,
                                userMap: userMap!,
                              ),
                            ),
                          );
                        },
                        title: Text(
                          userMap!['nama'],
                        ),
                        subtitle: Text(
                          userMap!['email'],
                        ),
                      )
                    : Container(),
              ],
            ),
    );
  }
}
