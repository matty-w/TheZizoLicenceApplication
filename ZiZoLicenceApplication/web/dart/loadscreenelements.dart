library elements;

import 'listentobuttons.dart';

class LoadScreenElements
{
  ListenToButtons ltb = new ListenToButtons();
  
  void loginPage()
  {
    ltb.login();
  }
  
  void createLicence()
  {
    ltb.createLicence();
  }
  
  void addAdmin()
  {
    ltb.addAdmin();
  }
  
  void addPermissions()
  {
    ltb.addPermissions();
  }
  
  void removePermissions()
  {
    ltb.removePermissions();
  }
  
  void regenerateLicence()
  {
    ltb.regenerateLicence();
  }
  
  void removeAdmin()
  {
    ltb.removeAdmin();
  }
  
  void removeLicence()
  {
    ltb.removeLicence();
  }
  
  void searchResult()
  {
    ltb.searchResults();
  }
  
  void changePassword()
  {
    ltb.changePassword();
  }
}
