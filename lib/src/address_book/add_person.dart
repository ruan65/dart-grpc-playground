import 'dart:io';

import 'package:grpc_tutorial/src/contacts_gen/contacts.pb.dart';

Person promptForAddress() {
  final person = Person();
  print('Enter person id: ');
  String input = stdin.readLineSync();
  person.id = int.parse(input);

  print('Enter name: ');
  person.name = stdin.readLineSync();

  print('Enter email address (blank for none): ');
  final email = stdin.readLineSync();

  if (email.isNotEmpty) {
    person.email = email;
  }

  while (true) {
    print('Enter a phone number (or leave blank to finish): ');
    final number = stdin.readLineSync();
    if (number.isEmpty) break;

    final phone = Person_PhoneNumber()..number = number;

    print('Is this a mobile, home, or work phone? ');

    String type = stdin.readLineSync();

    switch (type) {
      case 'mobile':
        phone.type = Person_PhoneType.MOBILE;
        break;
      case 'home':
        phone.type = Person_PhoneType.HOME;
        break;
      case 'work':
        phone.type = Person_PhoneType.WORK;
        break;
      default:
        print('Unknown phone type. Using default.');
    }

    person.phones.add(phone);
  }
  return person;
}

main(List<String> args) {
  if (args.length != 1) {
    print('Usage: add_person ADDRESS_BOOK_FILE');
    exit(-1);
  }

  File file = File(args.first);

  AddressBook addressBook;

  if (!file.existsSync()) {
    print('File not found. Creating new file.');

    addressBook = AddressBook();
  } else {
    addressBook = AddressBook.fromBuffer(file.readAsBytesSync());
  }

  addressBook.people.add(promptForAddress());
  file.writeAsBytes(addressBook.writeToBuffer());
}
