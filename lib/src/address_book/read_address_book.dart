import 'dart:io';

import 'package:grpc_tutorial/src/contacts_gen/contacts.pb.dart';

void printAddressBook(AddressBook addressBook) {
  for (Person person in addressBook.people) {
    print('Person ID: ${person.id}');
    print('  Name: ${person.name}');
    if (person.hasEmail()) {
      print('  E-mail address:${person.email}');
    }

    for (Person_PhoneNumber phoneNumber in person.phones) {
      switch (phoneNumber.type) {
        case Person_PhoneType.MOBILE:
          print('   Mobile phone #: ');
          break;
        case Person_PhoneType.HOME:
          print('   Home phone #: ');
          break;
        case Person_PhoneType.WORK:
          print('   Work phone #: ');
          break;
        default:
          print('   Unknown phone #: ');
          break;
      }
      print(phoneNumber.number);
    }
  }
}

main(List arguments) {
  if (arguments.length != 1) {
    print('Usage: list_person ADDRESS_BOOK_FILE');
    exit(-1);
  }

  final file = File(arguments.first);

  // printAddressBook(AddressBook.fromBuffer(file.readAsBytesSync()));

  final book = AddressBook.fromBuffer(file.readAsBytesSync());

  book.people.forEach(print);
}
