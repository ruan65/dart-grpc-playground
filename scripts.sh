protoc -I protos/ protos/todo.proto --dart_out=grpc:lib/src/generated


protoc -I=$SRC_DIR --dart_out=$DST_DIR $SRC_DIR/contacts.proto

protoc -I=protos/ --dart_out=lib/src/contacts_gen protos/contacts.proto

protoc -I=/usr/local/include/google/protobuf --dart_out=/Users/arudenko/dev/grpc/grpc_todo_tutorial/lib/src/contacts_gen/google/protobuf/ /usr/local/include/google/protobuf/timestamp.proto