class MessageModel {
  final String messageText;
  final String messageTime;
  final String senderName;

  MessageModel({
    required this.messageText,
    required this.messageTime,
    required this.senderName,
  });
  factory MessageModel.fromJson(json) {
    return MessageModel(
        messageText: json['message_text'],
        messageTime: json['message_time'],
        senderName: json['user_id']);
  }
}

