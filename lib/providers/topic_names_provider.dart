import 'package:flutter/material.dart';

class TopicNamesProvider extends ChangeNotifier {
  List<String> topicNames = [];

  void addTopicNames({required String topicName}) {
    topicNames.add(topicName.toLowerCase());
    print('LIST OF TOPICS: ...$topicNames');
    notifyListeners();
  }

  void deleteTopicName({required String topicName}) {
    topicNames.remove(topicName.toLowerCase());
    print('LIST OF TOPICS: ...$topicNames');
    notifyListeners();
  }

  void clearAllTopics() {
    topicNames.clear();
    notifyListeners();
  }
}
