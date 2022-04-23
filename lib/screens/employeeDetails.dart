
import 'package:flutter/material.dart';
import 'package:test_demo/model/employeeInfo.dart';

class EmployeeDetailPage extends StatelessWidget {
  final EmployeeInfo employeeInfo;
  const EmployeeDetailPage(this.employeeInfo, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProfileHeader(
                avatar:employeeInfo.profileImage.toString(),
                coverImage: '',
                title: employeeInfo.name.toString(),
              ),
              const SizedBox(height: 10.0),
              _buildUserInfo(context,employeeInfo),

            ],
          ),
        ));
  }

  Widget _buildUserInfo(BuildContext context, EmployeeInfo employeeInfo) {

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: const Text(
              "User Information",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                           ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            leading: const Icon(Icons.my_location),
                            title: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text("Location"),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(employeeInfo.address.toString()),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.email),
                            title: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text("Email"),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(employeeInfo.email.toString()),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.phone),
                            title: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child:  Text("Phone"),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(employeeInfo.phone.toString()),
                            ),
                          ),
                            ListTile(
                             title: const Text("Website"),
                            subtitle: Text(
                                employeeInfo.website.toString()),
                          ),
                          ListTile(
                            title: const Text("Company"),
                            subtitle: Text(
                                employeeInfo.company.toString()),
                          ),
                        ]
                    ).toList(),

                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}




class ProfileHeader extends StatelessWidget {
  final String? coverImage;
  final String? avatar;
  final String? title;

  const ProfileHeader(
      {Key? key,
        this.coverImage,
         this.avatar,
         this.title,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        Ink(
          height: 180,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
          ),
        ),

        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.4,
                child: AspectRatio(
                  aspectRatio: 16 / 12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: avatar != ""
                        ? Image.network(
                      avatar!,
                      fit: BoxFit.contain,
                    )
                        : Container(),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                title.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),

              const SizedBox(height: 5.0),

            ],
          ),
        )
      ],
    );
  }
}

