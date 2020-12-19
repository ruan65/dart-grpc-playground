import 'package:grpc/grpc.dart';
import 'package:grpc_tutorial/src/generated/todo.pbgrpc.dart';

class Client {
  ClientChannel channel;
  TodoClient stub;

  Future start() async {
    channel = ClientChannel('localhost',
        port: 8888,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ));

    stub = TodoClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));

    try {
      final item = TodoItem();
      item.text = 'Todo test item 1';
      final response = await stub.createTodo(item);
      print('create item response: $response');

      final todos = await stub.readTodos(VoidNoParam());
      print('todos response: $todos}');

      stub.readTodosStream(VoidNoParam()).listen((data) {
        print('got data in the stream: $data');
      });
    } catch (e) {
      print('this is an error: $e');
    }
    await channel.shutdown();
  }
}

main() {
  Client().start();
}
