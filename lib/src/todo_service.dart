import 'package:grpc/grpc.dart';
import 'package:grpc/src/server/call.dart';
import 'package:grpc_tutorial/src/generated/todo.pbgrpc.dart';

class TodoService extends TodoServiceBase {
  TodoItems todos = TodoItems();

  @override
  Future<TodoItem> createTodo(ServiceCall call, TodoItem request) async {
    final item = TodoItem();
    item.text = request.text;
    item.id = todos.items.length + 1;
    todos.items.add(item);
    return item;
  }

  @override
  Future<TodoItems> readTodos(ServiceCall call, VoidNoParam request) async =>
      todos;

  @override
  Stream<TodoItem> readTodosStream(
      ServiceCall call, VoidNoParam request) async* {
    for (var it in todos.items) {
      yield it;
    }
  }
}

class TodoServer {
  Future serve() async {
    final server = Server([TodoService()]);
    await server.serve(port: 8888);
    print('Server is listening on the port ${server.port}');
  }
}

main() {
  final server = TodoServer();
  server.serve();
}
