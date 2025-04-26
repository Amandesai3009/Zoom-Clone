// import 'package:flutter/material.dart';
// import 'package:syncspace/resource/firestore_methods.dart';
//
// class HistoryMeetingScreen extends StatelessWidget {
//   const HistoryMeetingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: FirestoreMethods().meetingsHistory,
//         builder: (context, snapshot){
//           if(snapshot.connectionState == ConnectionState.waiting){
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           return ListView.builder(
//               itemCount: (snapshot.data! as dynamic).docs.length,
//               itemBuilder: (context, index) => ListTile(
//                 title: Text('Room name: ${(snapshot.data! as dynamic).docs[index]['meetingName']},'),
//                 subtitle: Text('Joined on ${(snapshot.data! as dynamic).docs[index]['createdAt']}'),
//               ),
//           );
//         }
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:syncspace/resource/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting History'),
      ),
      body: StreamBuilder(
        stream: FirestoreMethods().meetingsHistory,
        builder: (context, snapshot) {
          // 1. Check if the stream has data and handle null cases
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // 2. Handle the case where snapshot has no data or the data is null
          if (!snapshot.hasData || snapshot.data == null || (snapshot.data! as dynamic).docs.isEmpty) {
            return const Center(
              child: Text('No meeting history available'),
            );
          }

          // 3. Safely access the data and build the ListView
          var meetings = (snapshot.data! as dynamic).docs;

          return ListView.builder(
            itemCount: meetings.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Room name: ${meetings[index]['meetingName']}'),
                subtitle: Text('Joined on ${meetings[index]['createdAt'].toDate().toString()}'),
              );
            },
          );
        },
      ),
    );
  }
}
