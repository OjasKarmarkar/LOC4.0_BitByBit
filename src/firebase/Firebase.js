import {getFirestore} from "firebase/firestore"
import { initializeApp } from "firebase/app";

const firebaseConfig = {
  apiKey: "AIzaSyDgoDSc2MWm_8wuIJEx3wwEy29Sfw8K36s",
  authDomain: "loc-bitbybit.firebaseapp.com",
  projectId: "loc-bitbybit",
  storageBucket: "loc-bitbybit.appspot.com",
  messagingSenderId: "143685424297",
  appId: "1:143685424297:web:8666491f4c79e633f445b8",
  measurementId: "G-646VY4M9L5"
};


// eslint-disable-next-line 
const app = initializeApp(firebaseConfig);
export default getFirestore();