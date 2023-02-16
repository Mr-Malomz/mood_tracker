import 'package:appwrite/appwrite.dart';
import 'package:mood_tracker/utils.dart';

class MoodService {
  Client _client = Client();
  Databases? _db;

  MoodService() {
    _init();
  }

  //initialize the application
  _init() async {
    _client
        .setEndpoint(AppConstant().endpoint)
        .setProject(AppConstant().projectId);

    _db = Databases(_client);

    //get current session
    Account account = Account(_client);

    try {
      await account.get();
    } on AppwriteException catch (e) {
      if (e.code == 401) {
        account
            .createAnonymousSession()
            .then((value) => value)
            .catchError((e) => e);
      }
    }
  }

  Future createMood(int rate, String description) async {
    try {
      Mood newMood = Mood(
        rate: rate,
        description: description,
        createdAt: DateTime.now(),
      );
      var data = await _db?.createDocument(
        databaseId: AppConstant().databaseId,
        collectionId: AppConstant().collectionId,
        documentId: ID.unique(),
        data: newMood.toJson(),
      );
      return data;
    } catch (e) {
      throw Exception('Error creating mood!');
    }
  }

  Future<List<Mood>> getMoodList() async {
    try {
      var data = await _db?.listDocuments(
        databaseId: AppConstant().databaseId,
        collectionId: AppConstant().collectionId,
      );

      var moodList =
          data?.documents.map((mood) => Mood.fromJson(mood.data)).toList();
      return moodList!;
    } catch (e) {
      throw Exception('Error getting list of moods!');
    }
  }
}
