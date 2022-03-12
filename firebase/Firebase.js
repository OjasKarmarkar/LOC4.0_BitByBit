// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDgoDSc2MWm_8wuIJEx3wwEy29Sfw8K36s",
  authDomain: "loc-bitbybit.firebaseapp.com",
  projectId: "loc-bitbybit",
  storageBucket: "loc-bitbybit.appspot.com",
  messagingSenderId: "143685424297",
  appId: "1:143685424297:web:8666491f4c79e633f445b8",
  measurementId: "G-646VY4M9L5"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);