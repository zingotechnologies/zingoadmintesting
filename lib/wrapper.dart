import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/userModel.dart';
import 'pages/dashboardPage.dart';
import 'ui/placeholderWidgets/welcome.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if(user != null){
      return Dashboard();
    } else {
      return Welcome();
    }
  }
}
