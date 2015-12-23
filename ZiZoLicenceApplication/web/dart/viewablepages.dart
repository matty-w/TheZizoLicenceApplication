library pages;

import 'dart:html';
import 'package:SoapRequestLibrary/SoapRequestLibrary.dart';

class ViewablePages
{
  static void revealOptions()
  {
    String adminName = window.sessionStorage['username'];
    String adminPassword = window.sessionStorage['password'];
    
    ServerRequest.checkPermissions(adminName, adminPassword, ServerRequest.defaultUri(), enablePermissions);
  }
  
  static void enablePermissions(String response)
  {
    List<String> permissions = response.split(",");
    permissions.add("log-out");
    permissions.add("password");
    for (DivElement e in document.getElementsByClassName("actionMenu"))
      if (!permissions.contains(e.attributes['permission']))
        e.innerHtml = "";
    
    DivElement divTable = querySelector("#hidden");
    divTable.style.display = "block";
  }
}