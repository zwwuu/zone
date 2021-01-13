import 'package:flutter_test/flutter_test.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements HnpwaClient {}

void main() {
  // ItemRepository repository;
  // MockClient client;

  setUp(() {
    // repository = ItemRepository();
    // client = MockClient();
  });

  group('ItemRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<ItemRepository>());
    //  });

    test('returns a Post if the http call completes successfully', () async {
      //    when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      //        .thenAnswer((_) async =>
      //            Response(data: {'title': 'Test'}, statusCode: 200));
      //    Map<String, dynamic> data = await repository.fetchPost(client);
      //    expect(data['title'], 'Test');
    });
  });
}
