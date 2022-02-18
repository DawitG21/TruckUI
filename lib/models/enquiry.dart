import 'dart:convert';

class Enquiry {
  String? id;
  String? name;
  String? email;
  String? subject;
  String? cdenquiry;
  String? type;
  String? date;

  Enquiry({
this.id,
this.name,
this.email,
this.subject,
this.cdenquiry,
this.type,
this.date,
  });

factory Enquiry.fromJson(Map<String, dynamic> jsonData) {
    return Enquiry(
        id: jsonData['id'],
        name: jsonData['name'],
        email: jsonData['email'],
        subject: jsonData['subject'],
        cdenquiry: jsonData['cdenquiry'],
        type: jsonData['type'],
        date: jsonData['date']);
    }

    static Map<String, dynamic> toMap(Enquiry enquiry) => {
        'id': enquiry.id,
        'name': enquiry.name,
        'email': enquiry.email,
        'subject':enquiry.subject,
        'cdenquiry':enquiry.cdenquiry,
        'type':enquiry.type,
        'date':enquiry.date
      };
      static String encode(List<Enquiry> enquiry) => json.encode(
        enquiry
            .map<Map<String, dynamic>>((enquiry) => Enquiry.toMap(enquiry))
            .toList(),
      );

       static List<Enquiry> decode(String enquiries) =>
      (json.decode(enquiries) as List<dynamic>)
          .map<Enquiry>((item) => Enquiry.fromJson(item))
          .toList();

}


