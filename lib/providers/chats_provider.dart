import "package:flutter/material.dart";

class Chat {
  Chat({
    required this.userId,
    required this.chatId,
    required this.chatTitle,
    this.messages,
  });

  final String userId;
  final String chatId;
  final String chatTitle;
  final List<Map<String, dynamic>>? messages;
}

class ChatsProvider with ChangeNotifier {
  final List<Chat> _chatList = [
    Chat(
      userId: "user1",
      chatId: "chat1",
      chatTitle: "The Miracle of ShakesPeare",
      messages: [
        {"id": "0", "sender": "user1", "message": "Hey there!"},
        {"id": "1", "sender": "bot", "message": "Hi, what's up?"},
        {"id": "2", "sender": "user1", "message": "Hey there!"},
        {"id": "3", "sender": "bot", "message": "Hi, what's up?"},
        {"id": "4", "sender": "user1", "message": "Hey there!"},
        {"id": "5", "sender": "bot", "message": "??????"},
      ],
    ),
    Chat(
      userId: "user1",
      chatId: "chat2",
      chatTitle: "Jokes about Fishes and how they act",
      messages: [
        {"id": "0", "sender": "user1", "message": "Hey there!"},
        {"id": "1", "sender": "bot", "message": "Hi, what's up?"},
        {"id": "2", "sender": "user1", "message": "Hey there!"},
        {"id": "3", "sender": "bot", "message": "Hi, what's up?"},
        {"id": "4", "sender": "user1", "message": "Hey there!"},
        {"id": "5", "sender": "bot", "message": "?????? ?????? ??????"},
      ],
    ),
    Chat(
      userId: "user1",
      chatId: "chat3",
      chatTitle: "Jokes about Snails and how fast they are",
      messages: [
        {"id": "0", "sender": "user1", "message": "Hey there!"},
        {"id": "1", "sender": "bot", "message": "Hi, what's up?"},
        {"id": "2", "sender": "user1", "message": "Hey there!"},
        {"id": "3", "sender": "bot", "message": "Hi, what's up?"},
        {
          "id": "4",
          "sender": "user1",
          "message":
              "Hey there! Hey there! Hey there! Hey there! Hey there! Hey there! Hey there! Hey there! "
        },
      ],
    ),
  ];

  List<Chat> get allChats {
    return [..._chatList];
  }

  String createChat(String userId, [bool notify = true]) {
    String chatId = DateTime.now().millisecondsSinceEpoch.toString();
    _chatList.insert(
        0,
        Chat(
          userId: userId,
          chatId: chatId,
          chatTitle: "New Chat",
        ));
    if (notify == true) {
      notifyListeners();
    }

    return chatId;
  }

  Chat getChatbyId(String id) {
    List<Chat> chat = _chatList.where((chat) => chat.chatId == id).toList();

    return chat[0];
  }

  String getRecentChatId(userId) {
    if (_chatList.isEmpty) {
      String chatId = createChat(userId, false);
      return chatId;
    }
    return _chatList[0].chatId;
  }

  void sendMessage(Map<String, dynamic> message, String chatId) {
    Chat chat = _chatList.where((chat) => chat.chatId == chatId).toList()[0];
    chat.messages?.add(message);
    notifyListeners();
  }
}