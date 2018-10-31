<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page | Nationly</title>
<script src="https://www.gstatic.com/firebasejs/5.5.5/firebase.js"></script>
<style type="text/css">
  #popUpWindow{
    background: #0b98de; 
  }
    #signOutWindow{
    background: #0b98de; 
  }
  ::placeholder {
  color: #1976D2;
  }
</style>
<script>
//Initialize Firebase
var config = {
  apiKey: "AIzaSyC4UzLRuWKz48W30jk6SAUdqtKX87QNq28",
  authDomain: "fwtproject-b7b66.firebaseapp.com",
  databaseURL: "https://fwtproject-b7b66.firebaseio.com",
  projectId: "fwtproject-b7b66",
  storageBucket: "",
  messagingSenderId: "482900236031"
};
firebase.initializeApp(config);
</script>
<script src="https://cdn.firebase.com/libs/firebaseui/3.4.1/firebaseui.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/3.4.1/firebaseui.css" /> 
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="assets/css/style.css">

  <script src="https://cdn.firebase.com/libs/firebaseui/3.4.1/firebaseui.js"></script>
    <link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/3.4.1/firebaseui.css" />
    <script type="text/javascript">
      // FirebaseUI config.
      var uiConfig = {
        signInSuccessUrl: 'index.jsp',
        signInOptions: [
          // Leave the lines as is for the providers you want to offer your users.
          firebase.auth.GoogleAuthProvider.PROVIDER_ID,
          //firebase.auth.FacebookAuthProvider.PROVIDER_ID,
          //firebase.auth.TwitterAuthProvider.PROVIDER_ID,
          //firebase.auth.GithubAuthProvider.PROVIDER_ID,
          firebase.auth.EmailAuthProvider.PROVIDER_ID,
          //firebase.auth.PhoneAuthProvider.PROVIDER_ID,
          //firebaseui.auth.AnonymousAuthProvider.PROVIDER_ID
        ],
        // tosUrl and privacyPolicyUrl accept either url string or a callback
        // function.
        // Terms of service url/callback.
        tosUrl: '<your-tos-url>',
        // Privacy policy url/callback.
        privacyPolicyUrl: function() {
          window.location.assign('<your-privacy-policy-url>');
        }
      };
      // Initialize the FirebaseUI Widget using Firebase.
      var ui = new firebaseui.auth.AuthUI(firebase.auth());
      // The start method will wait until the DOM is loaded.
      ui.start('#firebaseui-auth-container', uiConfig);
    </script>

<script type="text/javascript">
      initApp = function() {
        firebase.auth().onAuthStateChanged(function(user) {
          if (user) {
            // User is signed in.
            var displayName = user.displayName;
            var email = user.email;
            var emailVerified = user.emailVerified;
            var photoURL = user.photoURL;
            var uid = user.uid;
            var phoneNumber = user.phoneNumber;
            var providerData = user.providerData;
            document.getElementById('signoutBtn').addEventListener('click',function(){
              firebase.auth().signOut();
              $('#signOutWindow').modal('hide');
            });
            user.getIdToken().then(function(accessToken) {
              document.getElementById('signer').textContent = displayName + ' | Sign Out';
              var signout = document.getElementById('signer');
              signout.dataset.target = "#signOutWindow";
              
            });
          } else {
            // User is signed out.
            document.getElementById('signer').textContent = 'Sign In / Register';
            var signout = document.getElementById('signer');
              signout.dataset.target = "#popUpWindow";
            // document.getElementById('sign-in').textContent = 'Sign in';
            // document.getElementById('account-details').textContent = 'null';
          }
        }, function(error) {
          console.log(error);
        });
      };
      window.addEventListener('load', function() {
        initApp()
      });
    </script>


<!-- CSS Files -->
<link rel="stylesheet" href="css/style.css">

</head>
<body>
<div class="login-form w3_form">
  <!--  Title-->
      <div class="login-title w3_title">
           <h1>User login Form</h1>
      </div>
           <div class="login w3_login">
                <h2 class="login-header w3_header">Log in</h2>
                	<div class="w3l_grid">    
<div id="firebaseui-auth-container"></div>
</div>
       </div>
</div>
</body>
</html>