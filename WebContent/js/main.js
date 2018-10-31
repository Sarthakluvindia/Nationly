/**
 * 
 */

var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}

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

ui.start('#firebaseui-auth-container', {
	  signInOptions: [
	    firebase.auth.GoogleAuthProvider.PROVIDER_ID,
	    firebase.auth.EmailAuthProvider.PROVIDER_ID
	  ],
	  // Other config options...
	});
//Initialize the FirebaseUI Widget using Firebase.
var ui = new firebaseui.auth.AuthUI(firebase.auth());

var uiConfig = {
		  callbacks: {
		    signInSuccessWithAuthResult: function(authResult, redirectUrl) {
		      // User successfully signed in.
		      // Return type determines whether we continue the redirect automatically
		      // or whether we leave that to developer to handle.
		      return true;
		    },
		    uiShown: function() {
		      // The widget is rendered.
		      // Hide the loader.
		      document.getElementById('loader').style.display = 'none';
		    }
		  },
		  // Will use popup for IDP Providers sign-in flow instead of the default, redirect.
		  signInFlow: 'popup',
		  signInSuccessUrl: '<url-to-redirect-to-on-success>',
		  signInOptions: [
		    // Leave the lines as is for the providers you want to offer your users.
		    firebase.auth.GoogleAuthProvider.PROVIDER_ID,
		    firebase.auth.FacebookAuthProvider.PROVIDER_ID,
		    firebase.auth.TwitterAuthProvider.PROVIDER_ID,
		    firebase.auth.GithubAuthProvider.PROVIDER_ID,
		    firebase.auth.EmailAuthProvider.PROVIDER_ID,
		    firebase.auth.PhoneAuthProvider.PROVIDER_ID
		  ],
		  // Terms of service url.
		  tosUrl: '<your-tos-url>',
		  // Privacy policy url.
		  privacyPolicyUrl: '<your-privacy-policy-url>'
		};
//The start method will wait until the DOM is loaded.
ui.start('#firebaseui-auth-container', uiConfig);

function login(){
	var email = document.getElementById("lo_email").value;
	var password = document.getElementById("lo_password").value;
	firebase.auth().signInWithEmailAndPassword(email, password);
}

function signup() {
	 var Number = document.getElementById('phone').value;
	 var email = document.getElementById('email').value;
	 var pass = document.getElementById('password').value;
	 var sub = document.getElementById('submit_button');
	 var IndNum = /^[0]?[789]\d{9}$/;
	    var emailExp = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	    if(IndNum.test(Number)){
	    	if(emailExp.test(email)){
	    	   //code
	    		alert("hello");
	 	       return;
	    	}
	    	else {
	    		alert('please enter valid Email ID');
	 	       document.getElementById('email').focus();
			}
	    	
	   }

	   else{
	       alert('please enter valid mobile number');
	       document.getElementById('phone').focus();
	   }
	
	
}

firebase.auth().onAuthStateChanged(function(user) {
	  if (user) {
	    // User is signed in.
		  
	  } else {
	    // No user is signed in.
	  }
	});