// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:syncspace/resource/jitsi_meet_methods.dart';
// import '../widgets/home_meeting_button.dart';
//
// class MeetingScreen extends StatelessWidget {
//   MeetingScreen({super.key});
//   final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
//
//   createNewMeeting() async {
//     var random = Random();
//     String roomName = (random.nextInt(10000000)+1000000).toString();
//     _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
//   }
//   joinMeeting(BuildContext context){
//     Navigator.pushNamed(context, '/video-call');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             HomeMeetingButton(
//               onPressed:createNewMeeting,
//               text: 'New Meeting',
//               icon: Icons.videocam,
//             ),
//             HomeMeetingButton(
//               onPressed: () => joinMeeting(context),
//               text: 'Join Meeting',
//               icon: Icons.add_box_rounded,
//             ),
//             HomeMeetingButton(
//               onPressed: (){},
//               text: 'Schedule',
//               icon: Icons.calendar_today,
//             ),
//             HomeMeetingButton(
//               onPressed: (){},
//               text: 'Share Screen',
//               icon: Icons.arrow_upward_rounded,
//             )
//           ],
//         ),
//         const Expanded(
//           child: Center(
//             child: Text(
//               'Create/Join Meetings with just a click',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }



import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncspace/resource/jitsi_meet_methods.dart';
import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  // Asynchronous method to create a new meeting
  Future<void> createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 1000009).toString();
    try {
      // print('Trying to join the meeting with room name: $roomName');

      await _jitsiMeetMethods.createMeeting(
        roomName: roomName,
        isAudioMuted: true,
        isVideoMuted: true,
      );
    } catch (e) {
      print('Error creating meeting: $e');
    }
  }

  // Method to navigate to the Join Meeting screen
  void joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeMeetingButton(
                  onPressed: () => createNewMeeting(),
                  text: 'New Meeting',
                  icon: Icons.videocam,
                ),
                HomeMeetingButton(
                  onPressed: () => joinMeeting(context),
                  text: 'Join Meeting',
                  icon: Icons.add_box_rounded,
                ),
                HomeMeetingButton(
                  onPressed: () {},
                  text: 'Schedule',
                  icon: Icons.calendar_today,
                ),
                HomeMeetingButton(
                  onPressed: () {},
                  text: 'Share Screen',
                  icon: Icons.arrow_upward_rounded,
                ),
              ],
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Create/Join Meetings with just a click',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
