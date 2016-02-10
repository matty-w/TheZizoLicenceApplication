
import 'dart:html';
import 'viewablepages.dart';
import 'package:ServerFunctions/ServerFunctions.dart';
import 'package:PopupLibrary/PopupLibrary.dart';

class ListenToButtons
{ 
  GlobalNavigationFunctions gnf = new GlobalNavigationFunctions();
  PopupSelection ps = new PopupSelection();
  PopupConstructor pc = new PopupConstructor();
  LicenceActionFunctions laf = new LicenceActionFunctions();
  OnLoadLicence oll = new OnLoadLicence();
  LicenceNavigation ln = new LicenceNavigation();
  
  void login()
  {
    querySelector("#submitButton").onClick.listen((MouseEvent m) => gnf.loginLicenceApplication("#usernameTextbox", "#passwordTextbox"));
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
  }
  
  void createLicence()
  {
    window.onLoad.listen((Event e) => gnf.checkForLoggedInUser("'username'", "'password'"));
    CreateLicenceFunctions c = new CreateLicenceFunctions();
    querySelector("#popupAction").onClick.listen(laf.saveToClipboard);
    querySelector("#yes").onClick.listen(c.completeLicence);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#no").onClick.listen(pc.dismissBasicPrompt);
    ln.setLogOut("#showLogOut");
    oll.setDefaultIpAddress("#url");
    c.disableDateLengthTextBox();
    c.createDefaultDate();
    c.setRadioButtons();
    c.listenToRadioButtons();
    querySelector("#username-output").innerHtml = window.sessionStorage['username'];
    querySelector("#default_submitButton").onClick.listen(c.submitForm);
    ViewablePages.revealOptions();
  }
  
  void addAdmin()
  {
    window.onLoad.listen((Event e) => gnf.checkForLoggedInUser("'username'", "'password'"));
    AddAdminFunctions a = new AddAdminFunctions();
    ln.setLogOut("#showLogOut");
    querySelector("#ok").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);     
    querySelector("#username-output").innerHtml = window.sessionStorage['username'];
    querySelector("#addUser_submitButton").onClick.listen(a.addAdmin);     
    ViewablePages.revealOptions();
  }
  
  void addPermissions()
  {
    window.onLoad.listen((Event e) => gnf.checkForLoggedInUser("'username'", "'password'"));
    AddPermissionsFunctions a = new AddPermissionsFunctions();
    ln.setLogOut("#showLogOut");
    querySelector("#ok").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);    
    querySelector("#addPermissions_button").onClick.listen(a.addPermission);
    querySelector("#username-output").innerHtml = window.sessionStorage['username'];   
    a.setDescriptionText();
    ViewablePages.revealOptions();
  }
  
  void removePermissions()
  {
    window.onLoad.listen((Event e) => gnf.checkForLoggedInUser("'username'", "'password'"));
    AddPermissionsFunctions a = new AddPermissionsFunctions();
    ln.setLogOut("#showLogOut");
    querySelector("#ok").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#removePermissions_button").onClick.listen(a.removePermission);
    querySelector("#username-output").innerHtml = window.sessionStorage['username'];
    a.setDescriptionText();
    ViewablePages.revealOptions();
  }
  
  void regenerateLicence()
  {
    window.onLoad.listen((Event e) => gnf.checkForLoggedInUser("'username'", "'password'"));
    RegenerateLicenceFunctions r = new RegenerateLicenceFunctions();
    ln.setLogOut("#showLogOut");
    oll.setDefaultIpAddress("#url");
    querySelector("#popupAction").onClick.listen(laf.saveToClipboard);
    querySelector("#ok").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#regenerateLicence_button").onClick.listen(r.regenerateLicence);
    querySelector("#username-output").innerHtml = window.sessionStorage['username'];
    ViewablePages.revealOptions();
  }
  
  void removeAdmin()
  {
    window.onLoad.listen((Event e) => gnf.checkForLoggedInUser("'username'", "'password'"));
    
    RemoveAdminFunctions r = new RemoveAdminFunctions();
    ln.setLogOut("#showLogOut");
    querySelector("#ok").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);     
    querySelector("#username-output").innerHtml = window.sessionStorage['username'];
    querySelector("#removeUser_button").onClick.listen(r.removeUser);     
    ViewablePages.revealOptions();
  }
  
  void removeLicence()
  {
    window.onLoad.listen((Event e) => gnf.checkForLoggedInUser("'username'", "'password'"));
    RemoveLicenceFunctions r = new RemoveLicenceFunctions();
    Storage local = window.sessionStorage;
    String response = local['permissions'];
    InputElement searchBox = querySelector("#licenceSearch");
    ButtonElement searchButton = querySelector("#removeLicenceSearch_button");
    window.onLoad.listen(laf.clearTable);
    searchBox.disabled = true;
    searchButton.disabled = false;
    if(response.contains("check-licence"))
    {
      searchBox.disabled = false;
    }
    if(!response.contains("check-licence"))
    {
      searchButton.disabled = true;
      searchButton.style.background = "#2C3539";
      searchButton.style.color = "#848482";
    }
    
    ln.setLogOut("#showLogOut");
    querySelector("#ok").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#removeLicence_button").onClick.listen(r.removeLicence);
    querySelector("#removeLicenceSearch_button").onClick.listen(r.searchLicences);
    querySelector("#username-output").innerHtml = window.sessionStorage['username'];   
    ViewablePages.revealOptions();
  }
  
  void searchResults()
  {
    window.onLoad.listen((Event e) => gnf.checkForLoggedInUser("'username'", "'password'"));
    LicenceSearchResults s = new LicenceSearchResults();
    ln.setLogOut("#showLogOut");
    window.onLoad.listen(s.loadTable);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#ok").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#returnButton").onClick.listen(s.returnToPage);
    querySelector("#deleteLicencesButton").onClick.listen(s.deleteLicences);
    querySelector("#username-output").innerHtml = window.sessionStorage['username'];  
  }
  
  void changePassword()
  {
    window.onLoad.listen((Event e) => gnf.checkForLoggedInUser("'username'", "'password'"));
    InputElement username = querySelector("#username");
    Storage local = window.sessionStorage;
    String response = local['permissions'];
    List<String> permissions = null;
    
    if(response != null)
      permissions = response.split(",");
    if ((permissions!=null)&&(permissions.contains('change-password')))
    {  
      username.disabled = false;
      username.value = window.sessionStorage['username'];
    }  
    else
    {  
      username.disabled = true;
      username.value = window.sessionStorage['username'];
    }  
    
    ChangePassword cp = new ChangePassword();
    ln.setLogOut("#showLogOut");
    querySelector("#username-output").innerHtml = window.sessionStorage['username'];
    querySelector("#changePassword_submitButton").onClick.listen(cp.changePassword);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#ok").onClick.listen(pc.dismissBasicPrompt);
    ViewablePages.revealOptions();
  }
}