document.write("\
<nav id = 'menu'>\
  <div id = 'hidden'>\
    <div id = 'table'>\
      <div class='actionMenu' permission='add-licence'    id = 'showCreateLicence'>    <a href='createLicence.html'>Create A New Licence</a></div>\
      <div class='actionMenu' permission='add-user'       id = 'showAddAdmin'>         <a href='addAdmin.html'>Add Admin To Licence Server</a></div>\
      <div class='actionMenu' permission='add-permission' id = 'showAddPermissions'>   <a href='addPermissions.html'>Add Permissions For An Admin</a></div>\
      <div class='actionMenu' permission='remove-permission' id = 'showRemovePermissions'>   <a href='removePermissions.html'>Remove Permissions For An Admin</a></div>\
      <div class='actionMenu' permission='regenerate-key' id = 'showRegenerateLicence'><a href='regenerateLicence.html'>Regenerate A Licence</a></div>\
      <div class='actionMenu' permission='remove-licence' id = 'showRemoveLicence'>    <a href='removeLicence.html'>Remove A Licence</a></div>\
      <div class='actionMenu' permission='delete-user'    id = 'showRemoveAdmin'>      <a href='removeAdmin.html'>Remove Admin</a></div>\
      <div class='actionMenu' permission='view-logs'      id = 'showLogAccess'>        <a href='logAccess.html'>View Logs</a></div>\
      <div class='actionMenu' permission='show-licences'  id = 'showViewLicences'>     <a href='viewLicences.html'>View Licences</a></div>\
      <div class='actionMenu' permission='password'       id = 'showCreateLicence'>    <a href='changePassword.html'>Change A Password</a></div>\
      <div class='actionMenu' permission='log-out'        id = 'showLogOut'>           <a>Log Out</a></div>\
    </div>\
  </div>\
</nav>");
