import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

class CardUsersWidget extends StatelessWidget {
  final ChatMessageDto chatMessage;
  const CardUsersWidget({Key? key, required this.chatMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: chatMessage.author is ChatUserLocalDto
              ? Colors.blue[300]
              : Colors.green[300],
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
              color: chatMessage.author is ChatUserLocalDto
                  ? Colors.blue[500]!
                  : Colors.green[500]!,
              offset: chatMessage.author is ChatUserLocalDto
                  ? const Offset(-4, -4)
                  : const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: chatMessage.author is ChatUserLocalDto
                  ? const Offset(4, 4)
                  : const Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 12,
            right: 13,
            left: 13,
            bottom: 12.0,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        chatMessage.author.name[0],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        chatMessage.author.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SvgPicture.asset(
                  //       AppResources.geopointIcon,
                  //       color: AppColors.primaryColor,
                  //       fit: BoxFit.cover,
                  //     ),
                  //     SizedBox(
                  //       width: 4.w,
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(bottom: 5.0.h),
                  //       child: Text(
                  //         ' City',
                  //         style: AppStyles.profileCardUserLocationStyle,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              // Positioned(
              //   right: 0,
              //   child: SvgPicture.asset(
              //     AppResources.verifiedIcon,
              //     width: 27.0.w,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
