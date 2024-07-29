import 'package:flutter/material.dart';

class EnrollmentFormPage extends StatefulWidget {
  @override
  _EnrollmentFormPageState createState() => _EnrollmentFormPageState();
}

class _EnrollmentFormPageState extends State<EnrollmentFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Learner information
  String _lastName = '';
  String _firstName = '';
  String _middleName = '';
  String _extensionName = '';
  String _birthdate = '';
  String _birthPlace = '';
  String _gender = 'Male';
  String _age = '';
  bool _indigenousCommunity = false;
  bool _fourPsBeneficiary = false;
  String _fourPsID = '';

  // Address information
  String _currentHouseNumber = '';
  String _currentStreet = '';
  String _currentBarangay = '';
  String _currentCity = '';
  String _currentProvince = '';
  String _currentZipCode = '';

  String _permanentHouseNumber = '';
  String _permanentStreet = '';
  String _permanentBarangay = '';
  String _permanentCity = '';
  String _permanentProvince = '';
  String _permanentZipCode = '';
  bool _sameAsCurrentAddress = true;

  // Father information
  String _fatherLastName = '';
  String _fatherFirstName = '';
  String _fatherMiddleName = '';
  String _fatherAge = '';
  String _fatherOccupation = '';
  String _fatherContact = '';

  // Mother information
  String _motherLastName = '';
  String _motherFirstName = '';
  String _motherMiddleName = '';
  String _motherAge = '';
  String _motherOccupation = '';
  String _motherContact = '';

  // Guardian information
  String _guardianFullName = '';
  String _guardianContact = '';

  final List<String> _genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enrollment Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/dswd.png', // Make sure to add your logo image in the assets folder and update pubspec.yaml
                        width: 100.0,
                        height: 100.0,
                      ),
                      Text(
                        'Child Development Centers',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'I. CHILD INFORMATION',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  onChanged: (value) {
                    setState(() {
                      _lastName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
                  onChanged: (value) {
                    setState(() {
                      _firstName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Middle Name'),
                  onChanged: (value) {
                    setState(() {
                      _middleName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Extension Name (Jr., III)'),
                  onChanged: (value) {
                    setState(() {
                      _extensionName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Birthdate'),
                  onChanged: (value) {
                    setState(() {
                      _birthdate = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Birth Place'),
                  onChanged: (value) {
                    setState(() {
                      _birthPlace = value;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: InputDecoration(labelText: 'Gender'),
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                  items: _genders.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  onChanged: (value) {
                    setState(() {
                      _age = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(
                      'Belonging to Indigenous Cultural Community/Indigenous Peoples (ICC/IP)'),
                  value: _indigenousCommunity,
                  onChanged: (value) {
                    setState(() {
                      _indigenousCommunity = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('4Ps Beneficiary'),
                  value: _fourPsBeneficiary,
                  onChanged: (value) {
                    setState(() {
                      _fourPsBeneficiary = value!;
                    });
                  },
                ),
                if (_fourPsBeneficiary)
                  TextFormField(
                    decoration: InputDecoration(labelText: '4Ps ID Number'),
                    onChanged: (value) {
                      setState(() {
                        _fourPsID = value;
                      });
                    },
                  ),
                SizedBox(height: 16.0),
                Text(
                  'II. Address Information',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Current Address',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'House Number'),
                  onChanged: (value) {
                    setState(() {
                      _currentHouseNumber = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Street'),
                  onChanged: (value) {
                    setState(() {
                      _currentStreet = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Barangay'),
                  onChanged: (value) {
                    setState(() {
                      _currentBarangay = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'City/Municipality'),
                  onChanged: (value) {
                    setState(() {
                      _currentCity = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Province'),
                  onChanged: (value) {
                    setState(() {
                      _currentProvince = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Zip Code'),
                  onChanged: (value) {
                    setState(() {
                      _currentZipCode = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Same as Current Address'),
                  value: _sameAsCurrentAddress,
                  onChanged: (value) {
                    setState(() {
                      _sameAsCurrentAddress = value!;
                      if (value) {
                        _permanentHouseNumber = _currentHouseNumber;
                        _permanentStreet = _currentStreet;
                        _permanentBarangay = _currentBarangay;
                        _permanentCity = _currentCity;
                        _permanentProvince = _currentProvince;
                        _permanentZipCode = _currentZipCode;
                      }
                    });
                  },
                ),
                if (!_sameAsCurrentAddress) ...[
                  Text(
                    'Permanent Address',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'House Number'),
                    onChanged: (value) {
                      setState(() {
                        _permanentHouseNumber = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Street'),
                    onChanged: (value) {
                      setState(() {
                        _permanentStreet = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Barangay'),
                    onChanged: (value) {
                      setState(() {
                        _permanentBarangay = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'City/Municipality'),
                    onChanged: (value) {
                      setState(() {
                        _permanentCity = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Province'),
                    onChanged: (value) {
                      setState(() {
                        _permanentProvince = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Zip Code'),
                    onChanged: (value) {
                      setState(() {
                        _permanentZipCode = value;
                      });
                    },
                  ),
                ],
                SizedBox(height: 16.0),
                Text(
                  'III. Father\'s Information',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  onChanged: (value) {
                    setState(() {
                      _fatherLastName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
                  onChanged: (value) {
                    setState(() {
                      _fatherFirstName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Middle Name'),
                  onChanged: (value) {
                    setState(() {
                      _fatherMiddleName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  onChanged: (value) {
                    setState(() {
                      _fatherAge = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Occupation'),
                  onChanged: (value) {
                    setState(() {
                      _fatherOccupation = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contact Number'),
                  onChanged: (value) {
                    setState(() {
                      _fatherContact = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'IV. Mother\'s Information',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  onChanged: (value) {
                    setState(() {
                      _motherLastName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
                  onChanged: (value) {
                    setState(() {
                      _motherFirstName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Middle Name'),
                  onChanged: (value) {
                    setState(() {
                      _motherMiddleName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  onChanged: (value) {
                    setState(() {
                      _motherAge = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Occupation'),
                  onChanged: (value) {
                    setState(() {
                      _motherOccupation = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contact Number'),
                  onChanged: (value) {
                    setState(() {
                      _motherContact = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'V. Guardian\'s Information (if not the parent)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                  onChanged: (value) {
                    setState(() {
                      _guardianFullName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contact Number'),
                  onChanged: (value) {
                    setState(() {
                      _guardianContact = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process the form submission
                        // For now, we can just print the collected data
                        print('Form submitted:');
                        print('Learner\'s Information:');
                        print('Last Name: $_lastName');
                        print('First Name: $_firstName');
                        print('Middle Name: $_middleName');
                        print('Extension Name: $_extensionName');
                        print('Birthdate: $_birthdate');
                        print('Birth Place: $_birthPlace');
                        print('Gender: $_gender');
                        print('Age: $_age');
                        print('Indigenous Community: $_indigenousCommunity');
                        print('4Ps Beneficiary: $_fourPsBeneficiary');
                        if (_fourPsBeneficiary) {
                          print('4Ps ID: $_fourPsID');
                        }
                        print('Address Information:');
                        print('Current Address:');
                        print('House Number: $_currentHouseNumber');
                        print('Street: $_currentStreet');
                        print('Barangay: $_currentBarangay');
                        print('City/Municipality: $_currentCity');
                        print('Province: $_currentProvince');
                        print('Zip Code: $_currentZipCode');
                        if (!_sameAsCurrentAddress) {
                          print('Permanent Address:');
                          print('House Number: $_permanentHouseNumber');
                          print('Street: $_permanentStreet');
                          print('Barangay: $_permanentBarangay');
                          print('City/Municipality: $_permanentCity');
                          print('Province: $_permanentProvince');
                          print('Zip Code: $_permanentZipCode');
                        }
                        print('Father\'s Information:');
                        print('Last Name: $_fatherLastName');
                        print('First Name: $_fatherFirstName');
                        print('Middle Name: $_fatherMiddleName');
                        print('Age: $_fatherAge');
                        print('Occupation: $_fatherOccupation');
                        print('Contact Number: $_fatherContact');
                        print('Mother\'s Information:');
                        print('Last Name: $_motherLastName');
                        print('First Name: $_motherFirstName');
                        print('Middle Name: $_motherMiddleName');
                        print('Age: $_motherAge');
                        print('Occupation: $_motherOccupation');
                        print('Contact Number: $_motherContact');
                        print('Guardian\'s Information:');
                        print('Full Name: $_guardianFullName');
                        print('Contact Number: $_guardianContact');

                        // Navigate to the next screen or perform other actions
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
