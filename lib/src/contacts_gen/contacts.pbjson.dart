///
//  Generated code. Do not modify.
//  source: contacts.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const Person$json = const {
  '1': 'Person',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'phones', '3': 4, '4': 3, '5': 11, '6': '.contacts.Person.PhoneNumber', '10': 'phones'},
    const {'1': 'last_updated', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdated'},
  ],
  '3': const [Person_PhoneNumber$json],
  '4': const [Person_PhoneType$json],
};

const Person_PhoneNumber$json = const {
  '1': 'PhoneNumber',
  '2': const [
    const {'1': 'number', '3': 1, '4': 1, '5': 9, '10': 'number'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.contacts.Person.PhoneType', '10': 'type'},
  ],
};

const Person_PhoneType$json = const {
  '1': 'PhoneType',
  '2': const [
    const {'1': 'MOBILE', '2': 0},
    const {'1': 'HOME', '2': 1},
    const {'1': 'WORK', '2': 2},
  ],
};

const AddressBook$json = const {
  '1': 'AddressBook',
  '2': const [
    const {'1': 'people', '3': 1, '4': 3, '5': 11, '6': '.contacts.Person', '10': 'people'},
  ],
};
